package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.ChatRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {
    @Query("select c from ChatRoom c where c.senderId = :userId1 and c.receiverId = :userId2")
    public ChatRoom getChatMessages(Long userId1, Long userId2);



}
