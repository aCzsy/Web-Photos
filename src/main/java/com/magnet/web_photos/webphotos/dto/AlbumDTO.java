package com.magnet.web_photos.webphotos.dto;

import com.magnet.web_photos.webphotos.entity.Img;

import java.time.LocalDate;
import java.util.List;

public class AlbumDTO {
    private Long id;
    private String name;
    private String comment;
    private LocalDate date_created;
    private String albumAccessType;
    private List<Img> album_images;

    public AlbumDTO() {
    }

    public AlbumDTO(Long id, String name, String comment, LocalDate date_created, String albumAccessType, List<Img> album_images) {
        this.id = id;
        this.name = name;
        this.comment = comment;
        this.date_created = date_created;
        this.albumAccessType = albumAccessType;
        this.album_images = album_images;
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

    public LocalDate getDate_created() {
        return date_created;
    }

    public void setDate_created(LocalDate date_created) {
        this.date_created = date_created;
    }

    public String getAlbumAccessType() {
        return albumAccessType;
    }

    public void setAlbumAccessType(String albumAccessType) {
        this.albumAccessType = albumAccessType;
    }

    public List<Img> getAlbum_images() {
        return album_images;
    }

    public void setAlbum_images(List<Img> album_images) {
        this.album_images = album_images;
    }
}
