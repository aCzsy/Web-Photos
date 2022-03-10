package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.ImageSendEntity;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.FriendRequestRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RequestsController {
    private UserRepository userRepository;
    private UserService userService;
    private ImageService imageService;
    private AlbumsService albumsService;
    private AlbumsRepository albumsRepository;
    private FriendRequestService friendRequestService;
    private FriendRequestRepository friendRequestRepository;
    private RequestsService requestsService;

    @Autowired
    public RequestsController(UserRepository userRepository, UserService userService, ImageService imageService, AlbumsService albumsService,
                              AlbumsRepository albumsRepository, FriendRequestService friendRequestService, FriendRequestRepository friendRequestRepository, RequestsService requestsService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
        this.albumsService = albumsService;
        this.albumsRepository = albumsRepository;
        this.friendRequestService = friendRequestService;
        this.friendRequestRepository = friendRequestRepository;
        this.requestsService = requestsService;
    }

    @GetMapping("/requests")
    public String getRequestsPage(Model model, Authentication authentication){
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        List<ImageSendEntity> imagesSentFromOthers = requestsService.getImageSendRequestsToUser(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("imagesSharedByOthers", imagesSentFromOthers);
        return "requests";
    }

    @PostMapping("/requests/accept-and-save")
    public String saveSharedImage(@RequestParam("requestId") Long requestId){
        requestsService.acceptAndSaveSentImage(requestId);
        return "redirect:/requests";
    }

    @PostMapping("/requests/delete-request")
    public String deleteImageShareRequest(@RequestParam("requestId") Long requestId){
        requestsService.deleteImageShareRequest(requestId);
        return "redirect:/requests";
    }
}
