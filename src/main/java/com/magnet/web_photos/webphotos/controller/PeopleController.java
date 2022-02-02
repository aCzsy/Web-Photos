package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.SortForm;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@Controller
public class PeopleController {

    private UserRepository userRepository;

    @Autowired
    public PeopleController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/people")
    public String getPeoplePage(Model model,@ModelAttribute("sortForm") SortForm sortForm, Authentication authentication){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        model.addAttribute("user",foundUser);
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("number_of_users", userRepository.findAll().size());
        return "people";
    }

    @GetMapping("/people/getUserProfileImg/{userId}")
    public void displayUserProfileImage(@PathVariable("userId") Long userId, HttpServletResponse httpServletResponse) throws IOException {
        User user = userRepository.getById(userId);
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(user.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @PostMapping("/people/sort-users")
    public String sortUsersList(@ModelAttribute("sortForm") SortForm sortForm, Model model){
        return "redirect:/people";
    }

    @ModelAttribute("sortTypes")
    public String[] sortTypes () {
        return new String[] { "ID", "Username", "Date" };
    }
}
