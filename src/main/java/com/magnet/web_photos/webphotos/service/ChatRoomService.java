package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.repository.ChatMessageRepository;
import com.magnet.web_photos.webphotos.repository.ChatRoomRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

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
}
