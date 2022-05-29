package com.magnet.web_photos.webphotos.model;

public class DeleteImageRequestAndroid {
    private Long imageId;
    private String username;

    public DeleteImageRequestAndroid() {
    }

    public DeleteImageRequestAndroid(Long imageId, String username) {
        this.imageId = imageId;
        this.username = username;
    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
