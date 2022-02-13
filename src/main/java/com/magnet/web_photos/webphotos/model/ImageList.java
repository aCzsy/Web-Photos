package com.magnet.web_photos.webphotos.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class ImageList {
    private MultipartFile[] images;

    public ImageList() {
    }

    public ImageList(MultipartFile[] images) {
        this.images = images;
    }

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }
}
