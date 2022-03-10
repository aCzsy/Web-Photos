package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;

@Entity
public class ImageShareRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageShareId;
    @ManyToOne
    @JoinColumn(name = "request_sender_id")
    private User sender;
    @ManyToOne
    @JoinColumn(name = "request_receiver_id")
    private User receiver;
    @ManyToOne
    @JoinColumn(name = "image_id")
    private Img image;
    private boolean isAccepted;
    private boolean isDeclined;

    public ImageShareRequest() {
    }

    public Long getImageShareId() {
        return imageShareId;
    }

    public void setImageShareId(Long imageShareId) {
        this.imageShareId = imageShareId;
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

    public Img getImage() {
        return image;
    }

    public void setImage(Img image) {
        this.image = image;
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
