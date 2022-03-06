package com.magnet.web_photos.webphotos.dto;

import com.magnet.web_photos.webphotos.entity.User;

public class ImageCommentDTO {
    private byte [] senderProfilePic;
    private String userFullName;
    private String message;

    public ImageCommentDTO() {
    }

    public ImageCommentDTO(byte[] senderProfilePic, String userFullName, String message) {
        this.senderProfilePic = senderProfilePic;
        this.userFullName = userFullName;
        this.message = message;
    }

    public byte[] getSenderProfilePic() {
        return senderProfilePic;
    }

    public void setSenderProfilePic(byte[] senderProfilePic) {
        this.senderProfilePic = senderProfilePic;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
