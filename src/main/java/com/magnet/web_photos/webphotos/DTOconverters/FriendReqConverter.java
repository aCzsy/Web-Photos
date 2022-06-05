package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.FriendRequestDTO;
import com.magnet.web_photos.webphotos.entity.FriendRequest;

public class FriendReqConverter {
    public static FriendRequestDTO convertFriendReqToDTO(FriendRequest friendRequest){
        FriendRequestDTO friendRequestDTO = new FriendRequestDTO();
        friendRequestDTO.setIsAccepted(Boolean.toString(friendRequest.isAccepted()));
        friendRequestDTO.setIsDeclined(Boolean.toString(friendRequest.isDeclined()));
        friendRequestDTO.setIsSent(Boolean.toString(friendRequest.isSent()));

        return friendRequestDTO;
    }
}
