package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.Album;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.AlbumsService;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@Controller
public class UserGalleryController {
    private UserRepository userRepository;
    private UserService userService;
    private ImageService imageService;
    private AlbumsService albumsService;
    private AlbumsRepository albumsRepository;
    private FriendRequestService friendRequestService;

    @Autowired
    public UserGalleryController(UserRepository userRepository, UserService userService, ImageService imageService, AlbumsService albumsService, FriendRequestService friendRequestService, AlbumsRepository albumsRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
        this.albumsService = albumsService;
        this.friendRequestService = friendRequestService;
        this.albumsRepository = albumsRepository;
    }

    @GetMapping("/user/user-gallery/")
    public String getUserGallery(@RequestParam(value = "userId") Long userId, Model model, Authentication authentication){
        User authenticatedUser = userRepository.getUser(authentication.getName());
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        model.addAttribute("authUser", authenticatedUser);
        model.addAttribute("user",user);
        model.addAttribute("userPhotos", imageService.getAllImagesByUserId(user.getId()));
        model.addAttribute("userAlbums",albumsService.getUsersAlbums(user.getId()));
        model.addAttribute("users_number_of_friends",friendRequestService.getAllAcceptedRequests(user.getId()).size());
        return "user-gallery";
    }

    @GetMapping("/user/album-gallery")
    public String getUserAlbumGallery(@RequestParam(value = "userId") Long userId,@RequestParam(value = "albumId") Long albumId, Model model, Authentication authentication){
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        User authenticatedUser = userRepository.getUser(authentication.getName());
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        String user_firstname = user.getFirstname();
        model.addAttribute("authUser", authenticatedUser);
        model.addAttribute("album_name", album.getName());
        model.addAttribute("album_id",album.getId());
        model.addAttribute("users_name", user_firstname);
        model.addAttribute("images",album.getImages());
        model.addAttribute("user",user);
        return "user-album-gallery";
    }
}
