package com.magnet.web_photos.webphotos.model;

import com.magnet.web_photos.webphotos.dto.ImageDTO_Android;

public class UploadImageRequestAndroid {
    private String username;
    private ImageDTO_Android imageDTO_android;

    public UploadImageRequestAndroid() {
    }

    public UploadImageRequestAndroid(String username, ImageDTO_Android imageDTO_android) {
        this.username = username;
        this.imageDTO_android = imageDTO_android;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public ImageDTO_Android getImageDTO_android() {
        return imageDTO_android;
    }

    public void setImageDTO_android(ImageDTO_Android imageDTO_android) {
        this.imageDTO_android = imageDTO_android;
    }
}
