package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.DTOconverters.AlbumAskToShareConverter;
import com.magnet.web_photos.webphotos.DTOconverters.AlbumConverters;
import com.magnet.web_photos.webphotos.dto.AlbumAskToShareDTO;
import com.magnet.web_photos.webphotos.dto.AlbumDTO;
import com.magnet.web_photos.webphotos.entity.*;
import com.magnet.web_photos.webphotos.model.AlbumModel;
import com.magnet.web_photos.webphotos.repository.*;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
@Transactional
public class AlbumsService {
    private AlbumsRepository albumsRepository;
    private UserRepository userRepository;
    private ImageRepository imageRepository;
    private ImageCommentsRepository imageCommentsRepository;
    private AlbumSendRepository albumSendRepository;
    private AlbumAskToShareRepository albumAskToShareRepository;

    public AlbumsService(AlbumsRepository albumsRepository, UserRepository userRepository, ImageRepository imageRepository,
                         ImageCommentsRepository imageCommentsRepository, AlbumSendRepository albumSendRepository,
                         AlbumAskToShareRepository albumAskToShareRepository) {
        this.albumsRepository = albumsRepository;
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
        this.imageCommentsRepository = imageCommentsRepository;
        this.albumSendRepository = albumSendRepository;
        this.albumAskToShareRepository = albumAskToShareRepository;
    }

    public List<AlbumDTO> getUsersAlbums(Long userId){
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        return user.getAlbums()
                .stream()
                .map(album -> AlbumConverters.convertAlbumToAlbumDTO(album))
                .collect(Collectors.toList());
    }

    public List<AlbumDTO> getAllAlbums(){
        return albumsRepository.findAll()
                .stream()
                .map(album -> AlbumConverters.convertAlbumToAlbumDTO(album))
                .collect(Collectors.toList());
    }

    public Album createAlbum(AlbumModel albumModel, Authentication authentication) throws IOException {
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Album album = new Album();
        album.setName(albumModel.getAlbumName());
        album.setComment(albumModel.getAlbumComment());
        album.setAlbumAccessType(albumModel.getAlbumAccessType());
        AtomicReference<Long> album_size = new AtomicReference<>(0L);
        AtomicReference<Long> id = new AtomicReference<>(0L);
        List<Img> images = albumModel.getAdded_images()
                .stream()
                .map(multipartFile -> {
                    Img img = new Img();
                    try {
                        img.setImage_name(multipartFile.getOriginalFilename());
                        img.setContent_type(multipartFile.getContentType());
                        img.setImage_size(String.valueOf(multipartFile.getSize()));
                        img.setDate_uploaded(LocalDate.now());
                        img.setComment("");
                        img.setImage_owners(new ArrayList<>());
                        img.setFile_data(multipartFile.getBytes());
                        ImageComments imageComments = new ImageComments();
                        img.setImageComments(imageComments);
                        Img savedImage = imageRepository.save(img);
                        album.addImage(img);
                        if(savedImage.getImageId() > 0){
                            imageComments.setImageId(savedImage.getImageId());
                            imageCommentsRepository.save(imageComments);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    album_size.updateAndGet(v -> v + multipartFile.getSize());
                    return img;
                }).collect(Collectors.toList());
        user.addAlbum(album);
        //album.setImages(images);
        album.setAlbum_size(album_size.toString());
        //album.setDate_created(LocalDate.now());

        albumsRepository.save(album);

        return album;
    }

    public void addImagesToAlbum(Album album, Set<Img> images){
        //album.getImages().addAll(images);
        images.forEach(img -> {
            album.addImage(img);
            imageRepository.save(img);
        });
    }

    public void addImageToAlbum(Album album, Img img, User user){
        ImageComments imageComments = new ImageComments();
        imageComments.setOwnerId(user.getId());
        Comment comment = new Comment();
        comment.setSender(user);
        img.setImageComments(imageComments);

        Img savedImage = imageRepository.save(img);
        if(savedImage.getImageId() > 0){
            imageComments.setImageId(savedImage.getImageId());
            imageCommentsRepository.save(imageComments);
        }

        album.getAlbum_images().add(img);
    }

    public void editAlbumDetails(AlbumModel albumModel){
        albumsRepository.findById(albumModel.getAlbumId())
                .map(album -> {
                    album.setName(Optional.ofNullable(albumModel.getAlbumName()).orElse(albumModel.getAlbumName()));
                    album.setComment(Optional.ofNullable(albumModel.getAlbumComment()).orElse(albumModel.getAlbumComment()));
                    album.setAlbumAccessType(Optional.ofNullable(albumModel.getAlbumAccessType()).orElse(album.getAlbumAccessType()));
                    return albumsRepository.save(album);
                });
    }

    public void deleteAlbum(Album album, User user){
        Set<Img> imagesFromGallery = new HashSet<>();
        album.getAlbum_images()
                .forEach(img -> {
                    if(!(user.getImages().contains(img))) imagesFromGallery.add(img);
                });

        album.getAlbum_images().clear();
        imageRepository.deleteAll(imagesFromGallery);
        user.removeAlbum(album);
        albumsRepository.delete(album); //IMPORTANT
    }

    public void deleteImageFromAlbum(Album album, Img img, User user){
        //album.getImages().remove(img);
        if(user.getImages().contains(img)){
            album.removeImage(img);
        } else{
            album.removeImage(img);
            imageRepository.delete(img); //IMPORTANT
        }
    }

    public void createAlbumShareRequest(Long senderId, Long receiverId, Long albumId){
        User sender = Optional.ofNullable(userRepository.findUserById(senderId)).orElseThrow();
        User receiver = Optional.ofNullable(userRepository.findUserById(receiverId)).orElseThrow();
        Album album = albumsRepository.findAlbumById(albumId);
        AlbumSendEntity albumSendEntity = new AlbumSendEntity();
        albumSendEntity.setSender(sender);
        albumSendEntity.setReceiver(receiver);
//        albumSendEntity.setAlbum(album);
        album.addRequest(albumSendEntity);
        albumSendRepository.save(albumSendEntity);
    }

    public void createAskToShareAlbumRequest(Long requestMakerId, Long ownerId, Long albumId){
        User requestMaker = Optional.ofNullable(userRepository.findUserById(requestMakerId)).orElseThrow();
        User owner = Optional.ofNullable(userRepository.findUserById(ownerId)).orElseThrow();
        Album album = albumsRepository.findAlbumById(albumId);

        AlbumShareRequest albumShareRequest = new AlbumShareRequest();
        albumShareRequest.setUserMakingRequest(requestMaker);
        albumShareRequest.setAlbumOwner(owner);
        albumShareRequest.setAlbum(album);

        albumAskToShareRepository.save(albumShareRequest);
    }

    public AlbumAskToShareDTO getPendingAlbumShareRequest(Long userId, Long ownerId, Long albumId){
        User sender = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        User receiver = Optional.ofNullable(userRepository.findUserById(ownerId)).orElseThrow();
        AlbumAskToShareDTO albumAskToShareDTO = new AlbumAskToShareDTO();
        AlbumShareRequest albumShareRequest = albumAskToShareRepository.getRequestBySenderAndOwnerIds(userId, ownerId, albumId);

        if(albumShareRequest != null){
            albumAskToShareDTO = AlbumAskToShareConverter.albumAskToShareDTO(albumShareRequest);
        }

        return albumAskToShareDTO;
    }
}
