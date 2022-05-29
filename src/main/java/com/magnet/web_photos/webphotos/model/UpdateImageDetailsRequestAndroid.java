package com.magnet.web_photos.webphotos.model;

public class UpdateImageDetailsRequestAndroid {
    private Long imageId;
    private String category;
    private String comment;
    private String username;

    public UpdateImageDetailsRequestAndroid() {
    }

    public UpdateImageDetailsRequestAndroid(Long imageId, String category, String comment, String username) {
        this.imageId = imageId;
        this.category = category;
        this.comment = comment;
        this.username = username;
    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
