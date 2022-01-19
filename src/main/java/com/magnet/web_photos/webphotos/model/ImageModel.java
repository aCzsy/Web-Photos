package com.magnet.web_photos.webphotos.model;

import org.springframework.web.multipart.MultipartFile;

public class ImageModel {
    private Long imageId;
    private MultipartFile uploaded_image;

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public MultipartFile getUploaded_image() {
        return uploaded_image;
    }

    public void setUploaded_image(MultipartFile uploaded_image) {
        this.uploaded_image = uploaded_image;
    }
}
