package com.magnet.web_photos.webphotos.dto;

public class FriendRequestDTO {
    private String isAccepted;
    private String isDeclined;
    private String isSent;

    public FriendRequestDTO() {
    }

    public FriendRequestDTO(String isAccepted, String isDeclined, String isSent) {
        this.isAccepted = isAccepted;
        this.isDeclined = isDeclined;
        this.isSent = isSent;
    }

    public String getIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(String isAccepted) {
        this.isAccepted = isAccepted;
    }

    public String getIsDeclined() {
        return isDeclined;
    }

    public void setIsDeclined(String isDeclined) {
        this.isDeclined = isDeclined;
    }

    public String getIsSent() {
        return isSent;
    }

    public void setIsSent(String isSent) {
        this.isSent = isSent;
    }
}
