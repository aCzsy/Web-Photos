package com.magnet.web_photos.webphotos.dto;

import com.magnet.web_photos.webphotos.entity.Img;

import java.time.LocalDate;
import java.util.List;

public class AlbumDTO {
    private Long id;
    private String name;
    private String comment;
    private LocalDate dateCreated;
    private List<Img> images;

    public AlbumDTO() {
    }

    public AlbumDTO(Long id, String name, String comment, LocalDate dateCreated, List<Img> images) {
        this.id = id;
        this.name = name;
        this.comment = comment;
        this.dateCreated = dateCreated;
        this.images = images;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDate getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDate dateCreated) {
        this.dateCreated = dateCreated;
    }

    public List<Img> getImages() {
        return images;
    }

    public void setImages(List<Img> images) {
        this.images = images;
    }
}
