package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;

@Entity
public class ImageShareRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageShareId;
    @ManyToOne
    @JoinColumn(name = "requesting_user_id")
    private User userMakingRequest;
    @ManyToOne
    @JoinColumn(name = "image_owner_id")
    private User imageOwner;
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

    public User getUserMakingRequest() {
        return userMakingRequest;
    }

    public void setUserMakingRequest(User userMakingRequest) {
        this.userMakingRequest = userMakingRequest;
    }

    public User getImageOwner() {
        return imageOwner;
    }

    public void setImageOwner(User imageOwner) {
        this.imageOwner = imageOwner;
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
