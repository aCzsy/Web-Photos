package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.AlbumSendEntity;
import com.magnet.web_photos.webphotos.entity.ImageSendEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlbumSendRepository extends JpaRepository<AlbumSendEntity, Long> {
    @Query("select a from AlbumSendEntity a where a.receiver.id = :userId and a.isAccepted = false and a.isDeclined = false ")
    public List<AlbumSendEntity> getAlbumsSentByOtherUsers(Long userId);

    @Query("select a from AlbumSendEntity a where a.receiver.id = :userId and a.isAccepted = true and a.isDeclined = false")
    public List<AlbumSendEntity> getAllSavedAlbumSharedByOthersForUser(Long userId);
}
