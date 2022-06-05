package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.Album;
import com.magnet.web_photos.webphotos.entity.AlbumShareRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AlbumAskToShareRepository extends JpaRepository<AlbumShareRequest,Long> {
    @Query("select a from AlbumShareRequest a where a.userMakingRequest.id = :userId and a.albumOwner.id = :ownerId and a.album.id = :albumId")
    AlbumShareRequest getRequestBySenderAndOwnerIds(Long userId, Long ownerId, Long albumId);

    @Query("select a from AlbumShareRequest a where a.albumOwner.id = :userId and a.isAccepted = false ")
    List<AlbumShareRequest> getAllNotAccepterRequestsForOwner(Long userId);
}
