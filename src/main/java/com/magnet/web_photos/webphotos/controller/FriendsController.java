package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.entity.FriendRequest;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.SortForm;
import com.magnet.web_photos.webphotos.repository.FriendRequestRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.FriendRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class FriendsController {
    private UserRepository userRepository;
    private FriendRequestService friendRequestService;
    private FriendRequestRepository friendRequestRepository;

    @Autowired
    public FriendsController(UserRepository userRepository, FriendRequestService friendRequestService, FriendRequestRepository friendRequestRepository) {
        this.userRepository = userRepository;
        this.friendRequestService = friendRequestService;
        this.friendRequestRepository = friendRequestRepository;
    }

    @GetMapping("/web/friends")
    public String getFriendsPage(@ModelAttribute("sortForm") SortForm sortForm,Model model, Authentication authentication){
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        List<FriendRequest> friendRequestList = friendRequestService.getFriendRequestsForReceiver(user.getId());
        List<UserDTO> friendList = friendRequestService.getAllAcceptedRequests(user.getId());
        boolean noRequestsNoFriends = friendRequestList.isEmpty() && friendList.isEmpty();
//        List<UserDTO> friendList = friendRequestService.getAllAcceptedRequestsForReceiver(user.getId());
//        List<UserDTO> usersWhoAcceptedReq = friendRequestService.getAllAcceptedRequestsForSender(user.getId());
//        friendList.addAll(usersWhoAcceptedReq);
        model.addAttribute("user",user);
        model.addAttribute("friends",friendList);
        model.addAttribute("number_of_friends",friendList.size());
        model.addAttribute("friendRequests", friendRequestList);
        model.addAttribute("listsEmpty", noRequestsNoFriends);
        return "friends";
    }

    @PostMapping("/web/friends/sort-friends")
    public String sortFriendsList(@ModelAttribute("sortForm") SortForm sortForm, Model model){
        return "redirect:/web/friends";
    }

    @PostMapping("/web/friends/accept-friend-request")
    public String acceptFriendRequest(@RequestParam(value = "requestId") Long requestId, RedirectAttributes redirectAttrs, Authentication authentication){
        String successMessage = "";
        User user = Optional.ofNullable(userRepository.getUser(authentication.getName())).orElseThrow();
        Optional<FriendRequest> friendRequest = friendRequestRepository.findById(requestId);
        FriendRequest foundRequest;
        if(friendRequest.isPresent()){
            foundRequest = friendRequest.get();
            foundRequest.setAccepted(true);
            friendRequestService.createFriendRequest(foundRequest);
            successMessage = "Friend request accepted";
        } else {
            successMessage = "Error during request";
        }
        redirectAttrs.addFlashAttribute("successMessage", successMessage);
        return "redirect:/web/friends";
    }

    @PostMapping("/web/friends/decline-friend-request")
    public String declineFriendRequest(@RequestParam(value = "requestId") Long requestId, RedirectAttributes redirectAttrs){
        String successMessage = "";
        Optional<FriendRequest> friendRequest = friendRequestRepository.findById(requestId);
        FriendRequest foundRequest;
        if(friendRequest.isPresent()){
            foundRequest = friendRequest.get();
            foundRequest.setAccepted(false);
            foundRequest.setDeclined(true);
            friendRequestService.deleteFriendRequest(foundRequest);
            successMessage = "Friend request declined";
        } else {
            successMessage = "Error during request";
        }
        redirectAttrs.addFlashAttribute("successMessage", successMessage);
        return "redirect:/web/friends";
    }

    @GetMapping("/web/friends/getFriendRequestInfo")
    public String getFriendRequestInfo(@RequestParam(value = "userId") Long userId, Model model){
        User user = Optional.ofNullable(userRepository.findUserById(userId)).orElseThrow();
        model.addAttribute("friendRequestUserName", user.getFirstname());
        model.addAttribute("friendRequestUser", user);
        return "redirect:/web/friends";
    }

    @ModelAttribute("sortTypes")
    public String[] sortTypes () {
        return new String[] { "ID", "Username", "Date" };
    }
}
