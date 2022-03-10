package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.ImageShareRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageShareRequestRepository extends JpaRepository<ImageShareRequest, Long> {
}
