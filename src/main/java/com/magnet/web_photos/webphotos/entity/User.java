package com.magnet.web_photos.webphotos.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
public class User {
    @Id
    @GeneratedValue
    private Long id;
    @Nationalized
    private String username;
    private String salt;
    private String password;
    private String firstname;
    private String lastname;
    private LocalDate date;
    @Lob //Stored in the DB as BLOB
    private byte [] user_image;
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Img> images = new ArrayList<>();

    public User(){

    }

    public User(Long id, String username, String salt, String password, String firstname, String lastname, LocalDate date) {
        this.id = id;
        this.username = username;
        this.salt = salt;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.date = date;
    }

    public void addImage(Img img){
        images.add(img);
        img.getImage_owners().add(this);
    }

    public void removeImage(Img img){
        images.remove(img);
        img.getImage_owners().remove(this);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public List<Img> getImages() {
        return images;
    }

    public void setImages(List<Img> images) {
        this.images = images;
    }

    public byte[] getUser_image() {
        return user_image;
    }

    public void setUser_image(byte[] user_image) {
        this.user_image = user_image;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id) &&
                username.equals(user.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username);
    }
}
