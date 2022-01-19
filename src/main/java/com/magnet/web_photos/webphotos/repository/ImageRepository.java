package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.Img;
import com.magnet.web_photos.webphotos.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends JpaRepository<Img,Long> {
    @Query("select i from Img i where i.image_name = :imageName")
    Img findImageByImageName(String imageName);
//    @Query("select i from Img  i where :user member of i.image_owners")
//    List<Img> findImagesByUser(User user);
    @Query("select i from Img i where i.imageId = :imgId")
    Img findImageById(Long imgId);
}
