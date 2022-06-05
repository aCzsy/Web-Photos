package com.magnet.web_photos.webphotos.DTOconverters;

import com.magnet.web_photos.webphotos.dto.AlbumAskToShareDTO;
import com.magnet.web_photos.webphotos.entity.AlbumShareRequest;

public class AlbumAskToShareConverter {
    public static AlbumAskToShareDTO albumAskToShareDTO(AlbumShareRequest albumShareRequest){
        AlbumAskToShareDTO albumAskToShareDTO = new AlbumAskToShareDTO();
        albumAskToShareDTO.setIsAccepted(Boolean.toString(albumShareRequest.isAccepted()));
        albumAskToShareDTO.setIsSent(Boolean.toString(albumShareRequest.isSent()));

        return albumAskToShareDTO;
    }
}
