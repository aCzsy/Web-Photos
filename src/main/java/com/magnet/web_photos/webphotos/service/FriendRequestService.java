package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.DTOconverters.UserConverters;
import com.magnet.web_photos.webphotos.dto.UserDTO;
import com.magnet.web_photos.webphotos.entity.FriendRequest;
import com.magnet.web_photos.webphotos.repository.FriendRequestRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FriendRequestService {
    private UserRepository userRepository;
    private FriendRequestRepository friendRequestRepository;

    @Autowired
    public FriendRequestService(UserRepository userRepository, FriendRequestRepository friendRequestRepository) {
        this.userRepository = userRepository;
        this.friendRequestRepository = friendRequestRepository;
    }

    public void createFriendRequest(FriendRequest friendRequest){
        friendRequestRepository.save(friendRequest);
    }

    public void deleteFriendRequest(FriendRequest friendRequest){
        friendRequestRepository.delete(friendRequest);
    }

    public List<FriendRequest> getFriendRequestsForSender(Long userId){
        return friendRequestRepository.getUsersFriendRequestsForReceiver(userId);
    }

    public List<FriendRequest> getFriendRequestsForReceiver(Long userId){
        return friendRequestRepository.getUsersFriendRequestsForReceiver(userId);
    }

    public List<UserDTO> getAllAcceptedRequestsForSender(Long userId){
        List<UserDTO> friends = new ArrayList<>();

        friendRequestRepository.getUsersAcceptedFriendRequestsForSender(userId)
                .forEach(friendRequest -> friends.add(UserConverters.convertUserToUserDTO(friendRequest.getToUser())));

        return friends;
    }

    public List<UserDTO> getAllAcceptedRequestsForReceiver(Long userId){
        List<UserDTO> friends = new ArrayList<>();

        friendRequestRepository.getUsersAcceptedFriendRequestsForReceiver(userId)
            .forEach(friendRequest -> friends.add(UserConverters.convertUserToUserDTO(friendRequest.getFromUser())));

        return friends;
    }

    public List<UserDTO> getAllAcceptedRequests(Long userId){
        List<UserDTO> acceptedReqsForSender = new ArrayList<>();
        List<UserDTO> acceptedReqsForReceiver = new ArrayList<>();

        friendRequestRepository.getUsersAcceptedFriendRequestsForSender(userId)
                .forEach(friendRequest -> acceptedReqsForSender.add(UserConverters.convertUserToUserDTO(friendRequest.getToUser())));

        friendRequestRepository.getUsersAcceptedFriendRequestsForReceiver(userId)
                .forEach(friendRequest -> acceptedReqsForReceiver.add(UserConverters.convertUserToUserDTO(friendRequest.getFromUser())));

        acceptedReqsForSender.addAll(acceptedReqsForReceiver);

        return acceptedReqsForSender;
    }
}
