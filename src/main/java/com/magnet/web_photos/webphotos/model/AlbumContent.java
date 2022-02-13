package com.magnet.web_photos.webphotos.model;

import org.springframework.web.multipart.MultipartFile;

public class AlbumContent {
    private AlbumInfo albumInfo;
    private MultipartFile[] images;

    public AlbumContent() {
    }

    public AlbumContent(AlbumInfo albumInfo, MultipartFile[] images) {
        this.albumInfo = albumInfo;
        this.images = images;
    }

    public AlbumInfo getAlbumInfo() {
        return albumInfo;
    }

    public void setAlbumInfo(AlbumInfo albumInfo) {
        this.albumInfo = albumInfo;
    }

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }
}
