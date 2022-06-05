package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;

@Entity
public class AlbumSendEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long albumToSendRequestId;
    @ManyToOne
    @JoinColumn(name = "album_sender_id")
    private User sender;
    @ManyToOne
    @JoinColumn(name = "album_receiver_id")
    private User receiver;
    @ManyToOne
    private Album album;
    private boolean isAccepted;
    private boolean isDeclined;

    public AlbumSendEntity() {
    }

    public Long getAlbumToSendRequestId() {
        return albumToSendRequestId;
    }

    public void setAlbumToSendRequestId(Long albumToSendRequestId) {
        this.albumToSendRequestId = albumToSendRequestId;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
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
