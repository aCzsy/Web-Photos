package com.magnet.web_photos.webphotos.dto;

public class AlbumAskToShareDTO {
    private String isAccepted;
    private String isSent;

    public AlbumAskToShareDTO() {
    }

    public AlbumAskToShareDTO(String isAccepted, String isSent) {
        this.isAccepted = isAccepted;
        this.isSent = isSent;
    }

    public String getIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(String isAccepted) {
        this.isAccepted = isAccepted;
    }

    public String getIsSent() {
        return isSent;
    }

    public void setIsSent(String isSent) {
        this.isSent = isSent;
    }
}
