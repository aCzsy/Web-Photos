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
import java.util.Optional;
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
        if(!checkIfFriends(friendRequest.getFromUser().getId(), friendRequest.getToUser().getId())){
            friendRequestRepository.save(friendRequest);
        }
    }

    public void deleteFriendRequest(FriendRequest friendRequest){
        friendRequestRepository.delete(friendRequest);
    }

    public List<FriendRequest> getFriendRequestsForSender(Long userId){
        return friendRequestRepository.getUsersFriendRequestsForSender(userId);
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

    public List<FriendRequest> getAllAcceptedRequestsAsFriendRequests(Long userId){
        List<FriendRequest> list1 = friendRequestRepository.getUsersAcceptedFriendRequestsForReceiver(userId);
        List<FriendRequest> list2 = friendRequestRepository.getUsersAcceptedFriendRequestsForSender(userId);
        list1.addAll(list2);

        return list1;
    }

    public boolean checkIfFriends(Long userId1, Long userId2){
        List<FriendRequest> allAccepterRequests = getAllAcceptedRequestsAsFriendRequests(userId1);

        Optional<FriendRequest> acceptedBetweenBothUsers =
                allAccepterRequests
                .parallelStream()
                .filter(friendRequest -> (friendRequest.getFromUser().getId().equals(userId1) && friendRequest.getToUser().getId().equals(userId2))
                || friendRequest.getFromUser().getId().equals(userId2) && friendRequest.getToUser().getId().equals(userId1))
                .findFirst();

        return acceptedBetweenBothUsers.isPresent();
    }

    public boolean isFriendRequestSent(Long userId1, Long userId2){
            List<FriendRequest> reqs = friendRequestRepository.getNotAcceptedFriendRequestsForSender(userId1, userId2);

            return !reqs.isEmpty();
    }

    public boolean ifBothSentRequests(Long userId1, Long userId2){
        List<FriendRequest> reqs1 = friendRequestRepository.getSentRequestsForSender(userId1, userId2);
        List<FriendRequest> reqs2 = friendRequestRepository.getSentRequestsForReceiver(userId2,userId1);

        if(!reqs1.isEmpty() || !reqs2.isEmpty()){
            return true;
        } else{
            return false;
        }
    }

    public FriendRequest findFriendRequestByUserIds(Long userId1, Long userId2){
        List<FriendRequest> allAccepterRequests = getAllAcceptedRequestsAsFriendRequests(userId1);
        FriendRequest _foundReq = null;

        Optional<FriendRequest> foundRequest =
                allAccepterRequests
                .parallelStream()
                .filter(friendRequest -> (friendRequest.getFromUser().getId().equals(userId1) && friendRequest.getToUser().getId().equals(userId2))
                || friendRequest.getFromUser().getId().equals(userId2) && friendRequest.getToUser().getId().equals(userId1))
                .findFirst();

        if(foundRequest.isPresent()){
            _foundReq = foundRequest.get();
        }

        return _foundReq;
    }

    public void deleteFriendRequestByUserIds(Long userId1, Long userId2){
        FriendRequest friendRequest = findFriendRequestByUserIds(userId1, userId2);

        deleteFriendRequest(friendRequest);
    }
}
