package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.AlbumSendEntity;
import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.AlbumSendRepository;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.FriendRequestRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Set;

@Controller
public class ReceivedFilesController {
    private UserRepository userRepository;
    private UserService userService;
    private ImageService imageService;
    private AlbumsService albumsService;
    private AlbumsRepository albumsRepository;
    private FriendRequestService friendRequestService;
    private FriendRequestRepository friendRequestRepository;
    private RequestsService requestsService;
    private AlbumSendRepository albumSendRepository;

    @Autowired
    public ReceivedFilesController(UserRepository userRepository, UserService userService, ImageService imageService, AlbumsService albumsService,
                                   AlbumsRepository albumsRepository, FriendRequestService friendRequestService,
                                   FriendRequestRepository friendRequestRepository, RequestsService requestsService, AlbumSendRepository albumSendRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
        this.albumsService = albumsService;
        this.albumsRepository = albumsRepository;
        this.friendRequestService = friendRequestService;
        this.friendRequestRepository = friendRequestRepository;
        this.requestsService = requestsService;
        this.albumSendRepository = albumSendRepository;
    }

    @GetMapping("/web/received-files")
    public String getReceivedFilesPage(Model model, Authentication authentication){
        User user = userRepository.getUser(authentication.getName());
        model.addAttribute("user",user);
        model.addAttribute("sentImageRequests", requestsService.getAllSavedSentImages(user.getId()));
        model.addAttribute("sentAlbumRequests", requestsService.getAllSavedSentAlbums(user.getId()));
        return "received-files";
    }

    @GetMapping("/web/received-files/album-gallery")
    public String getReceivedAlbumsGalleryPage(@RequestParam("requestId") Long requestId, Model model, Authentication authentication){
        User user = userRepository.getUser(authentication.getName());
        AlbumSendEntity albumSendEntity = albumSendRepository.getById(requestId);
        model.addAttribute("user",user);
        model.addAttribute("sentAlbumRequest", albumSendEntity.getAlbum().getAlbum_images());
        model.addAttribute("album_name", albumSendEntity.getAlbum().getName());
        return "received-albums-gallery";
    }

}
