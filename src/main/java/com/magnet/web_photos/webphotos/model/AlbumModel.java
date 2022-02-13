package com.magnet.web_photos.webphotos.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

public class AlbumModel {
    private Long albumId;
    private String albumName;
    private String albumComment;
    private String albumAccessType;
    private List<MultipartFile> added_images = new ArrayList<>();


    public AlbumModel() {
    }

    public AlbumModel(Long albumId, String albumName, String albumComment, String albumAccessType,List<MultipartFile> added_images) {
        this.albumId = albumId;
        this.albumName = albumName;
        this.albumComment = albumComment;
        this.albumAccessType = albumAccessType;
        this.added_images = added_images;
    }

    public Long getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Long albumId) {
        this.albumId = albumId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public String getAlbumComment() {
        return albumComment;
    }

    public void setAlbumComment(String albumComment) {
        this.albumComment = albumComment;
    }

    public List<MultipartFile> getAdded_images() {
        return added_images;
    }

    public void setAdded_images(List<MultipartFile> added_images) {
        this.added_images = added_images;
    }

    public String getAlbumAccessType() {
        return albumAccessType;
    }

    public void setAlbumAccessType(String albumAccessType) {
        this.albumAccessType = albumAccessType;
    }
}
