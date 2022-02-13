package com.magnet.web_photos.webphotos.model;

public class AlbumInfo {
    private Long albumId;
    private String albumName;
    private String albumComment;
    private String albumAccessType;

    public AlbumInfo() {
    }

    public AlbumInfo(Long albumId, String albumName, String albumComment, String albumAccessType) {
        this.albumId = albumId;
        this.albumName = albumName;
        this.albumComment = albumComment;
        this.albumAccessType = albumAccessType;
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

    public String getAlbumAccessType() {
        return albumAccessType;
    }

    public void setAlbumAccessType(String albumAccessType) {
        this.albumAccessType = albumAccessType;
    }
}
