package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.ImageSendEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageSendRepository extends JpaRepository<ImageSendEntity, Long> {
    @Query("select i from ImageSendEntity i where i.receiver.id = :userId and i.isAccepted = false and i.isDeclined = false ")
    public List<ImageSendEntity> getImagesSentByOtherUsers(Long userId);

    @Query("select i from ImageSendEntity i where i.receiver.id = :userId and i.isAccepted = true and i.isDeclined = false")
    public List<ImageSendEntity> getAllSavedImagesSharedByOthersForUser(Long userId);
}
