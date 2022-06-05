package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    @Query("select u FROM User u where u.username = :username")
    User getUser(String username);
    @Query("select u FROM User u where u.id = :id")
    User findUserById(Long id);
    @Query("select u FROM User u where u.username = :username")
    User get_user_by_username(String username);
    @Modifying(clearAutomatically = true)
    @Query("update User u SET u.username = :username, u.password = :password WHERE u.id = :id")
    int updateCredentials(String username, String password, Long id);
}
