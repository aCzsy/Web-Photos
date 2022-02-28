package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.ImageComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageCommentsRepository extends JpaRepository<ImageComments, Long> {
    @Query("select i from ImageComments i where i.imageId = :imageId and i.ownerId = :ownerId")
    public ImageComments getCommentsByImageIdAndOwnerId(Long imageId, Long ownerId);
}
