package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlbumsRepository extends JpaRepository<Album,Long> {
    @Query("select a from Album a where a.id = :albumId")
    Album findAlbumById(Long albumId);

}
