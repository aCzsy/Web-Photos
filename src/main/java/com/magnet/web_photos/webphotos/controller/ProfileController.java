package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.*;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import com.magnet.web_photos.webphotos.service.UserService;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;
import java.util.Optional;

@Controller
public class ProfileController {

    private UserRepository userRepository;
    private UserService userService;
    private FriendRequestService friendRequestService;
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    public ProfileController(UserRepository userRepository, UserService userService, FriendRequestService friendRequestService, UserDetailsServiceImpl userDetailsService) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.friendRequestService = friendRequestService;
        this.userDetailsService = userDetailsService;
    }

    @GetMapping("/web/profile")
    public String getProfilePage(@ModelAttribute("imageModel") ImageModel imageModel, Model model, @AuthenticationPrincipal MyUserDetails myUserDetails,
                                 @ModelAttribute("userCredentialsModel") UserCredentialsModel userCredentialsModel, @ModelAttribute("userAboutInfo")UsersAboutInfo usersAboutInfo,
                                 HttpServletRequest request){
        User foundUser = userRepository.getUser(myUserDetails.getUsername());
        //User foundUser = userRepository.getUser("johnDoeee");
        //User foundUser = SessionUtil.getSessionUser(request);
        //User foundUser = userRepository.getUser(userDetailsService.loadUserByUsername(userCredentialsModel.getUserName()).getUsername());
        System.out.println("SESSION USER" + foundUser.getId() + " : " + foundUser.getFirstname());
//        if(userRepository.findUserById(userCredentialsModel.getUserId()) != null){
//            foundUser = userRepository.findUserById(userCredentialsModel.getUserId());
//        }
        model.addAttribute("user",foundUser);
        model.addAttribute("number_of_friends",friendRequestService.getAllAcceptedRequests(foundUser.getId()).size());
        return "profile";
    }

    @PostMapping("/web/profile/upload-image")
    public String uploadProfileImage(@ModelAttribute("imageModel") ImageModel imageModel, Model model,@AuthenticationPrincipal MyUserDetails myUserDetails, HttpServletRequest request) throws IOException {
        if(imageModel.getUploaded_image().getSize() == 0){
            //uploadError = "Please select file to upload.";
            //model.addAttribute("uploadError", uploadError);
        } else{
            //model.addAttribute("successNote", successNote);
            //User currentUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
            //User currentUser = SessionUtil.getSessionUser(request);
            User currentUser = userRepository.getUser(myUserDetails.getUsername());
            userService.setUserProfilePicture(currentUser,imageModel);
        }
        return "redirect:/web/profile";
    }

    @GetMapping("/web/profile/getUserProfileImg")
    public void displayUserProfileImage(HttpServletRequest httpServletRequest,@AuthenticationPrincipal MyUserDetails myUserDetails, HttpServletResponse httpServletResponse) throws IOException {
        //User currentUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        //User currentUser = SessionUtil.getSessionUser(httpServletRequest);
        User currentUser = userRepository.getUser(myUserDetails.getUsername());
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(currentUser.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @GetMapping("/profile/get-users-profile-picture/{userId}")
    public void getProfilePictureByUserId(@PathVariable("userId") Long userId,@AuthenticationPrincipal MyUserDetails myUserDetails,HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        //User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        //User user = SessionUtil.getSessionUser(httpServletRequest);
        User user = userRepository.getUser(myUserDetails.getUsername());
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(user.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @PostMapping("/web/profile/edit-user-details")
    public String editUserDetails(@ModelAttribute("userCredentialsModel") UserCredentialsModel userCredentialsModel, Model model,
                                  @AuthenticationPrincipal MyUserDetails myUserDetails, HttpServletRequest request, RedirectAttributes redirectAttrs){
        System.out.println("ID=" + userCredentialsModel.getUserId());
        System.out.println("USERNAME=" + userCredentialsModel.getUserName());
        System.out.println("PASSWORD=" + userCredentialsModel.getNewPassword());
        String userNameError = null;
        String passwordError = null;
        String successMsg = null;

        User user = userRepository.getUser(myUserDetails.getUsername());
        System.out.println("USERNAME=" + user.getUsername());

        if(!userCredentialsModel.getUserName().equals(user.getUsername())){
            if(!userService.isUsernameAvailable(userCredentialsModel.getUserName())){
                userNameError = "Username already exists";
                redirectAttrs.addFlashAttribute("userNameError", userNameError);
            }
        }

        if(userCredentialsModel.getUserName().isEmpty()){
            userNameError = "Username can't be blank";
            redirectAttrs.addFlashAttribute("userNameError", userNameError);
        }

        if(!userCredentialsModel.getNewPassword().isEmpty()){
            if(userCredentialsModel.getNewPassword().length() < 4){
                passwordError = "Password must contain at least 5 characters";
                redirectAttrs.addFlashAttribute("passwordError", passwordError);
            }
        }

        if(userCredentialsModel.getNewPassword().isEmpty()){
            passwordError = "Password can't be blank";
            redirectAttrs.addFlashAttribute("passwordError", passwordError);
        }

        if(userCredentialsModel.getUserName().isEmpty() && userCredentialsModel.getNewPassword().isEmpty()){
            passwordError = "Username and Password can't be blank";
            redirectAttrs.addFlashAttribute("passwordError", passwordError);
        }


        if(userNameError == null && passwordError == null){
            if(userService.editUser(userCredentialsModel) > 0){
                myUserDetails.setUsername(userCredentialsModel.getUserName());
                myUserDetails.setPassword(userCredentialsModel.getNewPassword());
                request.getSession().setAttribute("user", userRepository.getUser(myUserDetails.getUsername()));
                System.out.println("USER=" + SessionUtil.getSessionUser(request).getId());
                successMsg = "Credentials updated successfully";
                //model.addAttribute("successMsg", successMsg);
                redirectAttrs.addFlashAttribute("successMsg", successMsg);
            }
        }

        return "redirect:/web/profile";
    }

    @PostMapping("/web/profile/edit-user-info")
    public String editUserAboutInfo(@ModelAttribute("userAboutInfo")UsersAboutInfo usersAboutInfo){
        userService.editUserAboutInfo(usersAboutInfo);
        return "redirect:/web/profile";
    }

}
