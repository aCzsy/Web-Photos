package com.magnet.web_photos.webphotos.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Nationalized
    @Column(length = 20)
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private LocalDate date;
    private String about_info = null;
    @Lob //Stored in the DB as BLOB
    private byte [] user_image;
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Img> images = new ArrayList<>();
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Album> albums = new ArrayList<>();
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles = new HashSet<>();
    private boolean enabled;

    public User(){

    }

    public User(Long id, String username, String password, String firstname, String lastname, LocalDate date, boolean enabled) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.date = date;
        this.roles = new HashSet<>();
        this.enabled = enabled;
    }

    public void addImage(Img img){
        images.add(img);
        img.getImage_owners().add(this);
    }

    public void removeImage(Img img){
        images.remove(img);
        img.getImage_owners().remove(this);
    }

    public void addAlbum(Album album){
        albums.add(album);
        album.getOwners().add(this);
    }

    public void removeAlbum(Album album){
        albums.remove(album);
        album.getOwners().remove(this);
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

    public String getAbout_info() {
        return about_info;
    }

    public void setAbout_info(String about_info) {
        this.about_info = about_info;
    }

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id) &&
                firstname.equals(user.firstname) &&
                lastname.equals(user.lastname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstname, lastname);
    }
}
