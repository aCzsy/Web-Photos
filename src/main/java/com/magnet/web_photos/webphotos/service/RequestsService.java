package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.*;
import com.magnet.web_photos.webphotos.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RequestsService {
    private ImageSendRepository imageSendRepository;
    private AlbumSendRepository albumSendRepository;
    private UserRepository userRepository;
    private ImageRepository imageRepository;
    private AlbumsRepository albumsRepository;

    @Autowired
    public RequestsService(ImageSendRepository imageSendRepository, UserRepository userRepository, AlbumSendRepository albumSendRepository,
                           ImageRepository imageRepository, AlbumsRepository albumsRepository) {
        this.imageSendRepository = imageSendRepository;
        this.userRepository = userRepository;
        this.albumSendRepository = albumSendRepository;
        this.imageRepository = imageRepository;
        this.albumsRepository = albumsRepository;
    }

    public List<ImageSendEntity> getImageSendRequestsToUser(Long userId){
        return imageSendRepository.getImagesSentByOtherUsers(userId);
    }

    public void acceptAndSaveSentImage(Long requestId){
        ImageSendEntity imageSendEntity = imageSendRepository.getById(requestId);
        imageSendEntity.setAccepted(true);
        Img image = imageRepository.findImageById(imageSendEntity.getImage().getImageId());
        image.getImage_owners().add(imageSendEntity.getReceiver());
        imageSendRepository.save(imageSendEntity);
    }

    public void deleteImageShareRequest(Long requestId){
        ImageSendEntity imageSendEntity = imageSendRepository.getById(requestId);
        Img image = imageRepository.findImageById(imageSendEntity.getImage().getImageId());
        image.getImage_owners().remove(imageSendEntity.getReceiver());
        image.removeRequest(imageSendEntity);
        imageSendRepository.delete(imageSendRepository.getById(requestId));
    }

    public List<ImageSendEntity> getAllSavedSentImages(Long userId){
        List<ImageSendEntity> getAllEntities = imageSendRepository.getAllSavedImagesSharedByOthersForUser(userId);
//        Set<Img> imagesToBeReturned = new HashSet<>();
//        getAllEntities
//                .forEach(imageSendEntity -> imagesToBeReturned.add(imageSendEntity.getImage()));
        return getAllEntities;
    }

    public List<AlbumSendEntity> getAlbumSendRequestsToUser(Long userId){
        return albumSendRepository.getAlbumsSentByOtherUsers(userId);
    }

    public void acceptAndSaveSentAlbum(Long requestId){
        AlbumSendEntity albumSendEntity = albumSendRepository.getById(requestId);
        albumSendEntity.setAccepted(true);
        Album album = albumsRepository.findAlbumById(albumSendEntity.getAlbum().getId());
        album.getOwners().add(albumSendEntity.getReceiver());
        albumSendRepository.save(albumSendEntity);
    }

    public void deleteAlbumShareRequest(Long requestId){
        AlbumSendEntity albumSendEntity = albumSendRepository.getById(requestId);
        Album album = albumsRepository.findAlbumById(albumSendEntity.getAlbum().getId());
        album.getOwners().remove(albumSendEntity.getReceiver());
        album.removeRequest(albumSendEntity);
        albumSendRepository.delete(albumSendRepository.getById(requestId));
    }

    public List<AlbumSendEntity> getAllSavedSentAlbums(Long userId){
        List<AlbumSendEntity> getAllEntities = albumSendRepository.getAllSavedAlbumSharedByOthersForUser(userId);
//        Set<Album> albumsToBeReturned = new HashSet<>();
//        getAllEntities
//                .forEach(albumSendEntity -> albumsToBeReturned.add(albumSendEntity.getAlbum()));
        return getAllEntities;
    }
}
