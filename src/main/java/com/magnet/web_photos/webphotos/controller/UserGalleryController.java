package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.AlbumAskToShareDTO;
import com.magnet.web_photos.webphotos.entity.Album;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.AlbumAccessResponse;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.AlbumsService;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Map;
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

    @GetMapping("/web/user/user-gallery/")
    public String getUserGallery(@RequestParam(value = "userId") Long userId, Model model, Authentication authentication, HttpServletRequest request){
        //User authenticatedUser = userRepository.getUser(authentication.getName());
        User authenticatedUser = SessionUtil.getSessionUser(request);
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        model.addAttribute("authUser", authenticatedUser);
        model.addAttribute("user",user);
        model.addAttribute("userPhotos", imageService.getAllImagesByUserId(user.getId()));
        model.addAttribute("userAlbums",albumsService.getUsersAlbums(user.getId()));
        model.addAttribute("users_number_of_friends",friendRequestService.getAllAcceptedRequests(user.getId()).size());
        return "user-gallery";
    }

    @GetMapping("/web/user/album-gallery")
    public String getUserAlbumGallery(@RequestParam(value = "userId") Long userId,@RequestParam(value = "albumId") Long albumId,
                                      Model model, Authentication authentication, HttpServletRequest request){
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        //User authenticatedUser = userRepository.getUser(authentication.getName());
        User authenticatedUser = SessionUtil.getSessionUser(request);
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        String user_firstname = user.getFirstname();
        model.addAttribute("authUser", authenticatedUser);
        model.addAttribute("album_name", album.getName());
        model.addAttribute("album_id",album.getId());
        model.addAttribute("users_name", user_firstname);
        model.addAttribute("images",album.getAlbum_images());
        model.addAttribute("user",user);

        return "user-album-gallery";
    }

    @GetMapping(value = "/web/user/check-access", produces = "application/json")
    public @ResponseBody
    AlbumAccessResponse checkAccessStatus(@RequestParam(value = "userId") Long userId, @RequestParam(value = "albumId") Long albumId,
                                          Model model, Authentication authentication, HttpServletRequest request){
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        //User authenticatedUser = userRepository.getUser(authentication.getName());
        User authenticatedUser = SessionUtil.getSessionUser(request);
        Album album = Optional.ofNullable(albumsRepository.findAlbumById(albumId)).orElseThrow();
        String errorMessage_Private = "";
        String errorMessage_FriendsOnly = "";
        boolean accessGranted = false;
        String accessType = "";
        boolean isFriendRequestSent = false;

        if(album.getAlbumAccessType().equals("Public")){
            accessGranted = true;
            accessType = "Public";
        } else if(album.getAlbumAccessType().equals("Private")){
            accessType = "Private";
        } else if(album.getAlbumAccessType().equals("Friends only")){
            if(friendRequestService.checkIfFriends(user.getId(),authenticatedUser.getId())){
                accessGranted = true;
            } else{
                accessType = "Friends only";
                if(friendRequestService.isFriendRequestSent(authenticatedUser.getId(), user.getId())){
                    isFriendRequestSent = true;
                }
            }
        }

        //return Collections.singletonMap("response", Boolean.toString(accessGranted));
        return new AlbumAccessResponse(Boolean.toString(accessGranted), accessType, Boolean.toString(isFriendRequestSent));
    }

    @PostMapping("/web/user/ask-to-share/")
    public @ResponseBody
    ResponseEntity<?> askToShareAlbum(@RequestParam(value = "userId") Long userId, @RequestParam(value = "albumId") Long albumId, HttpServletRequest request){
        User authenticatedUser = SessionUtil.getSessionUser(request);
        albumsService.createAskToShareAlbumRequest(authenticatedUser.getId(), userId, albumId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/web/user/check-asked-requests")
    public @ResponseBody
    AlbumAskToShareDTO checkAskedRequests(@RequestParam(value = "userId") Long userId, @RequestParam(value = "albumId") Long albumId, HttpServletRequest request){
        User authenticatedUser = SessionUtil.getSessionUser(request);

//        boolean isFound = albumsService.getPendingAlbumShareRequest(authenticatedUser.getId(), userId, albumId);

        return albumsService.getPendingAlbumShareRequest(authenticatedUser.getId(), userId, albumId);
    }
}
