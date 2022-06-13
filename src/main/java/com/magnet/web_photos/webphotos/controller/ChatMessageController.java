package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.ChatMessageDTO;
import com.magnet.web_photos.webphotos.entity.ChatMessage;
import com.magnet.web_photos.webphotos.entity.ChatRoom;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.model.FullChatMessage;
import com.magnet.web_photos.webphotos.model.ReturnChatMessage;
import com.magnet.web_photos.webphotos.repository.ChatMessageRepository;
import com.magnet.web_photos.webphotos.repository.ChatRoomRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.ChatMessageService;
import com.magnet.web_photos.webphotos.service.ChatRoomService;
import com.magnet.web_photos.webphotos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;

@Controller
public class ChatMessageController {
    private SimpMessagingTemplate simpMessagingTemplate;
    private ChatRoomRepository chatRoomRepository;
    private ChatMessageRepository chatMessageRepository;
    private ChatMessageService chatMessageService;
    private UserRepository userRepository;
    private UserService userService;
    private ChatRoomService chatRoomService;

    @Autowired
    public ChatMessageController(ChatRoomRepository chatRoomRepository, ChatMessageRepository chatMessageRepository,
                                 ChatMessageService chatMessageService, UserRepository userRepository, UserService userService,
                                 ChatRoomService chatRoomService, SimpMessagingTemplate simpMessagingTemplate) {
        this.chatRoomRepository = chatRoomRepository;
        this.chatMessageRepository = chatMessageRepository;
        this.chatMessageService = chatMessageService;
        this.userRepository = userRepository;
        this.userService = userService;
        this.chatRoomService = chatRoomService;
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    // Handles messages from /app/chat. (Note:Spring adds the /app prefix itself).
    @MessageMapping("/chat")
    public void sendMessage(FullChatMessage fullChatMessage){
        User sender = userRepository.findUserById(Long.parseLong(fullChatMessage.getSenderId()));
        User receiver = userRepository.findUserById(Long.parseLong(fullChatMessage.getReceiverId()));
        String senderName = sender.getFirstname() + " " + sender.getLastname();
        String receiverName = receiver.getFirstname() + " " + receiver.getLastname();

        ChatRoom chatRoom = chatRoomService.getMessagesForUsers(sender.getId(), receiver.getId());

        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setSenderId(Long.parseLong(fullChatMessage.getSenderId()));
        chatMessage.setReceiverId(Long.parseLong(fullChatMessage.getReceiverId()));
        chatMessage.setContent(fullChatMessage.getMessage());
        chatMessage.setSenderName(senderName);
        chatMessage.setReceiverName(receiverName);
        chatMessage.setTimestamp(LocalDateTime.now());

        chatRoom.getMessages().add(chatMessage);

        chatRoomRepository.save(chatRoom);

        ReturnChatMessage returnChatMessage = new ReturnChatMessage();
        returnChatMessage.setSenderName(userRepository.findUserById(Long.parseLong(fullChatMessage.getSenderId())).getFirstname() +
                " " + userRepository.findUserById(Long.parseLong(fullChatMessage.getSenderId())).getLastname());
        returnChatMessage.setMessage(fullChatMessage.getMessage());
        returnChatMessage.setSenderId(fullChatMessage.getSenderId());

        simpMessagingTemplate.convertAndSend("/web/topic/messages", returnChatMessage);

        //getMessages(fullChatMessage);

        //chatMessageRepository.save(chatMessage);
    }

    // Sends the return value of this method to /topic/messages
    //@SendTo("/web/topic/messages")
//    public ChatMessageDTO getMessages(ChatMessageDTO chatMessageDTO){
//        return chatMessageDTO;
//    }
//    public FullChatMessage getMessages(FullChatMessage fullChatMessage){
//        System.out.println(fullChatMessage.getMessage());
//        return fullChatMessage;
//    }

}
