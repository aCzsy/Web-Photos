package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.DTOconverters.FriendReqConverter;
import com.magnet.web_photos.webphotos.dto.FriendRequestDTO;
import com.magnet.web_photos.webphotos.entity.FriendRequest;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.SortForm;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import com.magnet.web_photos.webphotos.service.UserService;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;
import java.util.Optional;

@Controller
public class PeopleController {

    private UserRepository userRepository;
    private UserService userService;
    private FriendRequestService friendRequestService;

    @Autowired
    public PeopleController(UserRepository userRepository, FriendRequestService friendRequestService, UserService userService) {
        this.friendRequestService = friendRequestService;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    //String reqSentMsg = null;

    @GetMapping("/web/people")
    public String getPeoplePage(Model model,@ModelAttribute("sortForm") SortForm sortForm, Authentication authentication){
        User foundUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        model.addAttribute("user",foundUser);
        model.addAttribute("users", userService.getListOfPeople(foundUser.getId()));
        model.addAttribute("number_of_users", userService.getListOfPeople(foundUser.getId()).size());
//        if(reqSentMsg != null){
//            model.addAttribute("requestSentMsg",reqSentMsg);
//        } else{
//            reqSentMsg = "Friend request";
//            model.addAttribute("requestSentMsg", reqSentMsg);
//        }
        return "people";
    }

    @GetMapping("/web/people/getUserProfileImg/{userId}")
    public void displayUserProfileImage(@PathVariable("userId") Long userId, HttpServletResponse httpServletResponse) throws IOException {
        User user = userRepository.getById(userId);
        httpServletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        httpServletResponse.getOutputStream().write(user.getUser_image());
        httpServletResponse.getOutputStream().close();
    }

    @PostMapping("/web/people/sort-users")
    public String sortUsersList(@ModelAttribute("sortForm") SortForm sortForm, Model model){
        return "redirect:/web/people";
    }

//    @PostMapping("/web/people/friend-request/to/")
//    public String sendFriendRequest(@RequestParam(value = "userId") Long userId, RedirectAttributes redirectAttrs, Authentication authentication){
//        User authenticatedUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
//        User receiver = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
//        FriendRequest friendRequest = new FriendRequest();
//        friendRequest.setFromUser(authenticatedUser);
//        friendRequest.setToUser(receiver);
//        friendRequest.setSent(true);
//        friendRequestService.createFriendRequest(friendRequest);
//        redirectAttrs.addFlashAttribute("successMessage", "Friend request sent");
//
////        reqSentMsg = "Friend request sent";
//        return "redirect:/web/people";
//    }

    @PostMapping(value = "/web/people/friend-request/to/", produces = "application/json")
    public @ResponseBody
    FriendRequestDTO sendFriendRequest(@RequestParam(value = "userId") Long userId, RedirectAttributes redirectAttrs, Authentication authentication){
        User authenticatedUser = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        User receiver = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        FriendRequest friendRequest = new FriendRequest();
        friendRequest.setFromUser(authenticatedUser);
        friendRequest.setToUser(receiver);
        friendRequest.setSent(true);
        friendRequestService.createFriendRequest(friendRequest);
        redirectAttrs.addFlashAttribute("successMessage", "Friend request sent");

        return FriendReqConverter.convertFriendReqToDTO(friendRequest);
    }

    @GetMapping(value = "/web/people/check-requests", produces = "application/json")
    public @ResponseBody
    Map<String, String> checkRequests(@RequestParam(value = "userId") Long userId, HttpServletRequest request){
        User authenticatedUser = SessionUtil.getSessionUser(request);
        String res = Boolean.toString(friendRequestService.ifBothSentRequests(authenticatedUser.getId(), userId));

        return Collections.singletonMap("response", res);
    }

    @ModelAttribute("sortTypes")
    public String[] sortTypes () {
        return new String[] { "ID", "Username", "Date" };
    }
}
