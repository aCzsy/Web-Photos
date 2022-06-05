package com.magnet.web_photos.webphotos.model;

public class AlbumAccessResponse {
    private String accessGranted;
    private String accessType;
    private String isFriendRequestSent;

    public AlbumAccessResponse(String accessGranted, String accessType, String isFriendRequestSent) {
        this.accessGranted = accessGranted;
        this.accessType = accessType;
        this.isFriendRequestSent = isFriendRequestSent;
    }

    public String getAccessGranted() {
        return accessGranted;
    }

    public void setAccessGranted(String accessGranted) {
        this.accessGranted = accessGranted;
    }

    public String getAccessType() {
        return accessType;
    }

    public void setAccessType(String accessType) {
        this.accessType = accessType;
    }

    public String getIsFriendRequestSent() {
        return isFriendRequestSent;
    }

    public void setIsFriendRequestSent(String isFriendRequestSent) {
        this.isFriendRequestSent = isFriendRequestSent;
    }
}
