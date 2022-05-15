package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.dto.ChatMessageDTO;
import com.magnet.web_photos.webphotos.entity.ChatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

@Controller
public class ChatMessageController {
    // Handles messages from /app/chat. (Note the Spring adds the /app prefix for us).
    @MessageMapping("/chat")
    // Sends the return value of this method to /topic/messages
    @SendTo("/web/topic/messages")
    public ChatMessageDTO getMessages(ChatMessageDTO chatMessageDTO){
        return chatMessageDTO;
    }

}
