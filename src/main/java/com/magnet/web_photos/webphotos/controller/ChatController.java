package com.magnet.web_photos.webphotos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
    @GetMapping("/chat")
    public String getChatPage(){
        return "chat";
    }
}
