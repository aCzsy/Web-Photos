package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlbumsRepository extends JpaRepository<Album,Long> {
}
