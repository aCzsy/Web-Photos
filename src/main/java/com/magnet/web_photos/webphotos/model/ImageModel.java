package com.magnet.web_photos.webphotos.model;

import org.springframework.web.multipart.MultipartFile;

public class ImageModel {
    private Long imageId;
    private String imageComment;
    private String category;
    private MultipartFile uploaded_image;

    public String getImageComment() {
        return imageComment;
    }

    public void setImageComment(String imageComment) {
        this.imageComment = imageComment;
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

    public MultipartFile getUploaded_image() {
        return uploaded_image;
    }

    public void setUploaded_image(MultipartFile uploaded_image) {
        this.uploaded_image = uploaded_image;
    }
}
