package com.magnet.web_photos.webphotos.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Album {
    @Id
    @GeneratedValue
    private Long id;
    @Nationalized
    private String name;
    private String comment;
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<User> users = new ArrayList<>();
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Img> images = new ArrayList<>();

    public Album(){

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

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Img> getImages() {
        return images;
    }

    public void setImages(List<Img> images) {
        this.images = images;
    }

}
