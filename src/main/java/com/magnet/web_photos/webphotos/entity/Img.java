package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
public class Img {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageId;
    private String image_name;
    private String content_type;
    private String image_size;
    private LocalDate date_uploaded;
    //private Long userId;
    @ManyToMany(mappedBy = "images")
    private List<User> image_owners = new ArrayList<>();
    @Lob //Stored in the DB as BLOB
    private byte [] file_data;

    public Img(){

    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }

    public String getContent_type() {
        return content_type;
    }

    public void setContent_type(String content_type) {
        this.content_type = content_type;
    }

    public String getImage_size() {
        return image_size;
    }

    public void setImage_size(String image_size) {
        this.image_size = image_size;
    }

    public LocalDate getDate_uploaded() {
        return date_uploaded;
    }

    public void setDate_uploaded(LocalDate date_uploaded) {
        this.date_uploaded = date_uploaded;
    }

//    public Long getUserId() {
//        return userId;
//    }
//
//    public void setUserId(Long userId) {
//        this.userId = userId;
//    }


    public List<User> getImage_owners() {
        return image_owners;
    }

    public void setImage_owners(List<User> image_owners) {
        this.image_owners = image_owners;
    }

    public byte[] getFile_data() {
        return file_data;
    }

    public void setFile_data(byte[] file_data) {
        this.file_data = file_data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Img img = (Img) o;
        return imageId.equals(img.imageId) &&
                image_name.equals(img.image_name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(imageId, image_name);
    }
}
