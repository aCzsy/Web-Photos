package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.ImageService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class UserGalleryController {
    private UserRepository userRepository;
    private UserService userService;
    private ImageService imageService;

    @Autowired
    public UserGalleryController(UserRepository userRepository, UserService userService, ImageService imageService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.imageService = imageService;
    }

    @GetMapping("/user/user-gallery/")
    public String getUserGallery(@RequestParam(value = "userId") Long userId, Model model, Authentication authentication){
        User authenticatedUser = userRepository.getUser(authentication.getName());
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        model.addAttribute("authUser", authenticatedUser);
        model.addAttribute("user",user);
        model.addAttribute("userPhotos", imageService.getAllImagesByUserId(user.getId()));
        return "user-gallery";
    }
}
