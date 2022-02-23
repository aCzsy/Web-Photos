package com.magnet.web_photos.webphotos.model;

public class UserCredentialsModel {
    private Long userId;
    private String userName;
    private String newPassword;
    private String repeatNewPassword;

    public UserCredentialsModel() {
    }

    public UserCredentialsModel(Long userId,String userName, String newPassword, String repeatNewPassword) {
        this.userId = userId;
        this.userName = userName;
        this.newPassword = newPassword;
        this.repeatNewPassword = repeatNewPassword;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getRepeatNewPassword() {
        return repeatNewPassword;
    }

    public void setRepeatNewPassword(String repeatNewPassword) {
        this.repeatNewPassword = repeatNewPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
