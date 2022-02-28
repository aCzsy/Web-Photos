package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.ImageModel;
import com.magnet.web_photos.webphotos.model.UserCredentialsModel;
import com.magnet.web_photos.webphotos.model.UsersAboutInfo;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;
import java.util.Optional;

@Controller
public class ProfileController {

    private UserRepository userRepository;
    private UserService userService;
    private FriendRequestService friendRequestService;

    @Autowired
    public ProfileController(UserRepository userRepository, UserService userService, FriendRequestService friendRequestService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.friendRequestService = friendRequestService;
    }

    @GetMapping("/profile")
    public String getProfilePage(@ModelAttribute("imageModel") ImageModel imageModel, Model model, Authentication authentication,
                                 @ModelAttribute("userCredentialsModel") UserCredentialsModel userCredentialsModel, @ModelAttribute("userAboutInfo")UsersAboutInfo usersAboutInfo){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
//        if(userRepository.findUserById(userCredentialsModel.getUserId()) != null){
//            foundUser = userRepository.findUserById(userCredentialsModel.getUserId());
//        }
        model.addAttribute("user",foundUser);
        model.addAttribute("number_of_friends",friendRequestService.getAllAcceptedRequests(foundUser.getId()).size());
        return "profile";
    }

    @PostMapping("/profile/upload-image")
    public String uploadProfileImage(@ModelAttribute("imageModel") ImageModel imageModel, Model model, Authentication authentication) throws IOException {
        if(imageModel.getUploaded_image().getSize() == 0){
            //uploadError = "Please select file to upload.";
            //model.addAttribute("uploadError", uploadError);
        } else{
            //model.addAttribute("successNote", successNote);
            User currentUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
            userService.setUserProfilePicture(currentUser,imageModel);
        }
        return "redirect:/profile";
    }

    @GetMapping("/profile/getUserProfileImg")
    public void displayUserProfileImage(Authentication authentication, HttpServletResponse httpServletResponse) throws IOException {
        User currentUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(currentUser.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @GetMapping("/profile/get-users-profile-picture/{userId}")
    public void getProfilePictureByUserId(@PathVariable("userId") Long userId, HttpServletResponse httpServletResponse) throws IOException {
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(user.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @PostMapping("/profile/edit-user-details")
    public String editUserDetails(@ModelAttribute("userCredentialsModel") UserCredentialsModel userCredentialsModel, Model model){
        String userNameError = null;
        String passwordError = null;

        if(!userService.isUsernameAvailable(userCredentialsModel.getUserName())){
            userNameError = "Username already exists";
            model.addAttribute(userNameError, "userNameError");
        }

        if(!userCredentialsModel.getNewPassword().equals(userCredentialsModel.getRepeatNewPassword())){
            passwordError = "Passwords don't match";
            model.addAttribute(passwordError, "passwordError");
        }

        if(userNameError == null && passwordError == null){
            userService.editUser(userCredentialsModel);
        }

        return "profile";
    }

    @PostMapping("/profile/edit-user-info")
    public String editUserAboutInfo(@ModelAttribute("userAboutInfo")UsersAboutInfo usersAboutInfo){
        userService.editUserAboutInfo(usersAboutInfo);
        return "redirect:/profile";
    }

}
