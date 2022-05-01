package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.DTOconverters.UserConverters;
import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.dto.UserDTOAndroid;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping
public class LoginController {
    private UserRepository userRepository;
    private UserService userService;

    @Autowired
    public LoginController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping("/web/login")
    public String getLoginPage(){
        return "login";
    }

//    @PostMapping("/login")
//    public void authenticateAndroid(){
////        User user = userService.getUser(username);
////        if(user != null){
////            request.getSession().setAttribute("user", user);
////        }
////
////        return UserConverters.convertUserToUserDTOAndroid(user);
//    }

}
