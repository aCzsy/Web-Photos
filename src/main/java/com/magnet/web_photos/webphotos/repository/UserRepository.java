package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    @Query("select u FROM User u where u.username = :username")
    User getUser(String username);
    @Query("select u FROM User u where u.id = :id")
    User findUserById(Long id);
}
