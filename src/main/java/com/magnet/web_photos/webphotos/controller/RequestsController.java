package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.AlbumSendEntity;
import com.magnet.web_photos.webphotos.entity.AlbumShareRequest;
import com.magnet.web_photos.webphotos.entity.ImageSendEntity;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.AlbumAskToShareRepository;
import com.magnet.web_photos.webphotos.repository.AlbumsRepository;
import com.magnet.web_photos.webphotos.repository.FriendRequestRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.*;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
    private AlbumAskToShareRepository albumAskToShareRepository;

    @Autowired
    public RequestsController(UserRepository userRepository, UserService userService, ImageService imageService, AlbumsService albumsService,
                              AlbumsRepository albumsRepository, FriendRequestService friendRequestService, FriendRequestRepository friendRequestRepository, RequestsService requestsService,
                              AlbumAskToShareRepository albumAskToShareRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
        this.albumsService = albumsService;
        this.albumsRepository = albumsRepository;
        this.friendRequestService = friendRequestService;
        this.friendRequestRepository = friendRequestRepository;
        this.requestsService = requestsService;
        this.albumAskToShareRepository = albumAskToShareRepository;
    }

    @GetMapping("/web/requests")
    public String getRequestsPage(Model model, Authentication authentication, HttpServletRequest request){
        //User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        User user = SessionUtil.getSessionUser(request);
        List<ImageSendEntity> imagesSentFromOthers = requestsService.getImageSendRequestsToUser(user.getId());
        List<AlbumSendEntity> albumsSentFromOthers = requestsService.getAlbumSendRequestsToUser(user.getId());
        List<AlbumShareRequest> albumsAskedToShareByOthers = requestsService.getAllRequestsAskedByOthers(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("imagesSharedByOthers", imagesSentFromOthers);
        model.addAttribute("albumsSharedByOthers", albumsSentFromOthers);
        model.addAttribute("albumsAskedToShareByOthers", albumsAskedToShareByOthers);
        return "requests";
    }

    @PostMapping("/web/requests/accept-and-save-image")
    public String saveSharedImage(@RequestParam("requestId") Long requestId){
        requestsService.acceptAndSaveSentImage(requestId);
        return "redirect:/web/requests";
    }

    @GetMapping("/web/requests/delete-image-request")
    public String deleteImageShareRequest(@RequestParam("requestId") Long requestId){
        requestsService.deleteImageShareRequest(requestId);
        return "redirect:/web/requests";
    }

    @PostMapping("/web/requests/accept-and-save-album")
    public String saveSharedAlbum(@RequestParam("requestId") Long requestId){
        requestsService.acceptAndSaveSentAlbum(requestId);
        return "redirect:/web/requests";
    }

    @GetMapping("/web/requests/delete-album-request")
    public String deleteAlbumShareRequest(@RequestParam("requestId") Long requestId){
        requestsService.deleteAlbumShareRequest(requestId);
        return "redirect:/web/requests";
    }

    @GetMapping("/web/requests/delete-album-request-asked-by-user")
    public String deleteReq(@RequestParam("requestId") Long requestId){
        requestsService.deleteAskedAlbumRequest(requestId);
        return "redirect:/web/requests";
    }

    @PostMapping("/web/requests/share-album/to")
    public String shareAlbum(@RequestParam("userId") Long userId,@RequestParam("albumId") Long albumId, @RequestParam("requestId") Long requestId, Model model, Authentication authentication, HttpServletRequest request){
        if(userId != null && albumId != null){
            //User sender = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
            User sender = SessionUtil.getSessionUser(request);
            AlbumShareRequest albumShareRequest = albumAskToShareRepository.getById(requestId);
            albumAskToShareRepository.delete(albumShareRequest);
            albumsService.createAlbumShareRequest(sender.getId(),userId,albumId);
        }
        System.out.println("ALBUM ID = " + albumId);
        System.out.println("USER TO ID= " + userId);
        return "redirect:/web/requests";
    }

}
