package com.magnet.web_photos.webphotos.model;

public class UsersAboutInfo {
    private Long userId;
    private String aboutInfo;

    public UsersAboutInfo() {
    }

    public UsersAboutInfo(Long userId, String aboutInfo) {
        this.userId = userId;
        this.aboutInfo = aboutInfo;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAboutInfo() {
        return aboutInfo;
    }

    public void setAboutInfo(String aboutInfo) {
        this.aboutInfo = aboutInfo;
    }
}
