package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;

@Entity
public class AlbumShareRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long albumShareRequestId;
    @ManyToOne
    @JoinColumn(name = "requesting_user_id")
    private User userMakingRequest;
    @ManyToOne
    @JoinColumn(name = "album_owner_id")
    private User albumOwner;
    @ManyToOne
    @JoinColumn(name = "album_id")
    private Album album;
    private boolean isAccepted;
    private boolean isDeclined;

    public AlbumShareRequest() {
    }

    public Long getAlbumShareRequestId() {
        return albumShareRequestId;
    }

    public void setAlbumShareRequestId(Long albumShareRequestId) {
        this.albumShareRequestId = albumShareRequestId;
    }

    public User getUserMakingRequest() {
        return userMakingRequest;
    }

    public void setUserMakingRequest(User userMakingRequest) {
        this.userMakingRequest = userMakingRequest;
    }

    public User getAlbumOwner() {
        return albumOwner;
    }

    public void setAlbumOwner(User albumOwner) {
        this.albumOwner = albumOwner;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public boolean isAccepted() {
        return isAccepted;
    }

    public void setAccepted(boolean accepted) {
        isAccepted = accepted;
    }

    public boolean isDeclined() {
        return isDeclined;
    }

    public void setDeclined(boolean declined) {
        isDeclined = declined;
    }
}
