package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
public class AlbumsController {

    private UserRepository userRepository;
    private UserService userService;

    public AlbumsController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping("/albums")
    public String getAlbumsPage(Authentication authentication, Model model){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        model.addAttribute("user",foundUser);
        return "albums";
    }
}
