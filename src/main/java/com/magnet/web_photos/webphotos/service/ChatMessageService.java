package com.magnet.web_photos.webphotos.service;

import com.magnet.web_photos.webphotos.repository.ChatMessageRepository;
import com.magnet.web_photos.webphotos.repository.ChatRoomRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatMessageService {
    private ChatRoomRepository chatRoomRepository;
    private ChatMessageRepository chatMessageRepository;
    private ChatRoomService chatRoomService;
    private UserRepository userRepository;
    private UserService userService;

    @Autowired
    public ChatMessageService(ChatRoomRepository chatRoomRepository, ChatMessageRepository chatMessageRepository, ChatRoomService chatRoomService, UserRepository userRepository, UserService userService) {
        this.chatRoomRepository = chatRoomRepository;
        this.chatMessageRepository = chatMessageRepository;
        this.chatRoomService = chatRoomService;
        this.userRepository = userRepository;
        this.userService = userService;
    }
}
