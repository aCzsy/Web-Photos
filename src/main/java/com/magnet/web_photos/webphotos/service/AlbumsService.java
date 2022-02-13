package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.DTOconverters.AlbumConverters;
import com.magnet.web_photos.webphotos.dto.AlbumDTO;
import com.magnet.web_photos.webphotos.entity.Album;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.AlbumModel;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.ImageRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class AlbumsService {
    private AlbumsRepository albumsRepository;
    private UserRepository userRepository;
    private ImageRepository imageRepository;

    public AlbumsService(AlbumsRepository albumsRepository, UserRepository userRepository, ImageRepository imageRepository) {
        this.albumsRepository = albumsRepository;
        this.userRepository = userRepository;
        this.imageRepository = imageRepository;
    }

    public List<AlbumDTO> getAllAlbums(Long userId){
        return albumsRepository.findAll()
                .stream()
                .map(album -> AlbumConverters.convertAlbumToAlbumDTO(album))
                .collect(Collectors.toList());
    }

    @Transactional
    public void createAlbum(AlbumModel albumModel, Authentication authentication) throws IOException {
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Album album = new Album();
        album.setName(albumModel.getAlbumName());
        album.setComment(albumModel.getAlbumComment());
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
                        imageRepository.save(img);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    album_size.updateAndGet(v -> v + multipartFile.getSize());
                    return img;
                }).collect(Collectors.toList());
        user.addAlbum(album);
        album.setImages(images);
        album.setAlbum_size(album_size.toString());
        album.setDate_created(LocalDate.now());

        albumsRepository.save(album);
    }
}
