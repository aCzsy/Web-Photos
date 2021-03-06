package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.DTOconverters.UserConverters;
import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/web/signup")
public class SignupController {
    private final UserService userService;

    @Autowired
    public SignupController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public String signupView(){
        return "signup";
    }

    @PostMapping
    public String signupUser(@ModelAttribute UserDTO userDTO, Model model){
        String signupError = null;
        String redirectTo = "signup";

        User user = UserConverters.convertUserDTOtoUser(userDTO);

        if(!userService.isUsernameAvailable(user.getUsername())){
            signupError = "Username already exists";
        }

        if(userDTO.getPassword().length() < 4){
            signupError = "Password length must be greater than 4 characters";
        }

        if (signupError == null) {
            User savedUser = userService.saveUser(user);
            if (savedUser == null ) {
                signupError = "There was an error signing you up. Please try again.";
            }
        }

        if (signupError == null) {
            model.addAttribute("signupSuccess", true);
            redirectTo = "login";
        } else {
            model.addAttribute("signupError", signupError);
        }

        return redirectTo;
    }


}
