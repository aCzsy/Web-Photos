package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.entity.ChatRoom;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.ChatMessageRepository;
import com.magnet.web_photos.webphotos.repository.ChatRoomRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatRoomService {
    private ChatRoomRepository chatRoomRepository;
    private ChatMessageRepository chatMessageRepository;
    private ChatMessageService chatMessageService;
    private UserRepository userRepository;
    private UserService userService;

    @Autowired
    public ChatRoomService(ChatRoomRepository chatRoomRepository, ChatMessageRepository chatMessageRepository, @Lazy ChatMessageService chatMessageService, UserRepository userRepository, UserService userService) {
        this.chatRoomRepository = chatRoomRepository;
        this.chatMessageRepository = chatMessageRepository;
        this.chatMessageService = chatMessageService;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    public ChatRoom getMessagesForUsers(Long userId, Long userId2){
        if(chatRoomRepository.getChatMessages(userId,userId2) == null){
            return chatRoomRepository.getChatMessages(userId2,userId);
        }
        return chatRoomRepository.getChatMessages(userId,userId2);
    }
}
