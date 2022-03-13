package com.magnet.web_photos.webphotos.entity;

import org.apache.tomcat.jni.Address;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.time.Clock;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Album {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Nationalized
    private String name;
    private String comment;
    private String album_size;
    private LocalDate date_created = LocalDate.now(Clock.systemUTC());;
    @Column(name = "access_type")
    private String albumAccessType;
    @ManyToMany(mappedBy = "albums")
    private List<User> owners = new ArrayList<>();
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Img> album_images = new ArrayList<>();
    @OneToMany(mappedBy = "album", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AlbumSendEntity> albumSendEntities = new ArrayList<>();

    public Album(){
    }

    public void addImage(Img image) {
        album_images.add(image);
        image.getAlbumsWhereImageExist().add(this);
    }

    public void removeImage(Img image) {
        album_images.remove(image);
        image.getAlbumsWhereImageExist().remove(this);
    }

    public void addRequest(AlbumSendEntity albumSendEntity) {
        albumSendEntities.add( albumSendEntity );
        albumSendEntity.setAlbum( this );
    }

    public void removeRequest(AlbumSendEntity albumSendEntity) {
        albumSendEntities.remove( albumSendEntity );
        albumSendEntity.setAlbum( null );
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAlbum_size() {
        return album_size;
    }

    public void setAlbum_size(String album_size) {
        this.album_size = album_size;
    }

    public LocalDate getDate_created() {
        return date_created;
    }

    public void setDate_created(LocalDate date_created) {
        this.date_created = date_created;
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

    public String getAlbumAccessType() {
        return albumAccessType;
    }

    public void setAlbumAccessType(String albumAccessType) {
        this.albumAccessType = albumAccessType;
    }

    public List<User> getOwners() {
        return owners;
    }

    public void setOwners(List<User> owners) {
        this.owners = owners;
    }

    public List<Img> getAlbum_images() {
        return album_images;
    }

    public void setAlbum_images(List<Img> album_images) {
        this.album_images = album_images;
    }

    public List<AlbumSendEntity> getAlbumSendEntities() {
        return albumSendEntities;
    }

    public void setAlbumSendEntities(List<AlbumSendEntity> albumSendEntities) {
        this.albumSendEntities = albumSendEntities;
    }
}
