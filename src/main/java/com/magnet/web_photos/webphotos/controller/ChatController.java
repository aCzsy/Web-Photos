package com.magnet.web_photos.webphotos.controller;

import com.magnet.web_photos.webphotos.entity.ChatRoom;
import com.magnet.web_photos.webphotos.entity.User;
import com.magnet.web_photos.webphotos.repository.ChatMessageRepository;
import com.magnet.web_photos.webphotos.repository.ChatRoomRepository;
import com.magnet.web_photos.webphotos.repository.UserRepository;
import com.magnet.web_photos.webphotos.service.ChatMessageService;
import com.magnet.web_photos.webphotos.service.ChatRoomService;
import com.magnet.web_photos.webphotos.service.UserService;
import com.magnet.web_photos.webphotos.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ChatController {
//    @GetMapping("/web/chat")
//    public String getChatPage(){
//        return "chat";
//    }
    private ChatRoomRepository chatRoomRepository;
    private ChatMessageRepository chatMessageRepository;
    private ChatMessageService chatMessageService;
    private UserRepository userRepository;
    private UserService userService;
    private ChatRoomService chatRoomService;

    @Autowired
    public ChatController(ChatRoomRepository chatRoomRepository, ChatMessageRepository chatMessageRepository,
                          ChatMessageService chatMessageService, UserRepository userRepository, UserService userService,
                          ChatRoomService chatRoomService) {
        this.chatRoomRepository = chatRoomRepository;
        this.chatMessageRepository = chatMessageRepository;
        this.chatMessageService = chatMessageService;
        this.userRepository = userRepository;
        this.userService = userService;
        this.chatRoomService = chatRoomService;
    }

    @GetMapping("/web/chat/get-massages")
    public @ResponseBody
    ChatRoom getMessages(@RequestParam(value = "userId") Long userId, HttpServletRequest request){
        User user = SessionUtil.getSessionUser(request);

        ChatRoom chatRoom = chatRoomService.getMessagesForUsers(user.getId(), userId);
        ChatRoom chatRoom_for_receiver = chatRoomService.getMessagesForUsers(userId, user.getId());
        ChatRoom chatRoomToReturn = null;

        if(chatRoom != null){
            return chatRoom;
        }
        else if(chatRoom_for_receiver != null){
            return chatRoom_for_receiver;
        }
        else{
            ChatRoom newChatRoom = new ChatRoom();
            newChatRoom.setSenderId(user.getId());
            newChatRoom.setReceiverId(userId);
            return chatRoomRepository.save(newChatRoom);
        }

        //return chatRoom;

//        if(chatRoom == null){
//            ChatRoom newChatRoom = new ChatRoom();
//            newChatRoom.setSenderId(user.getId());
//            newChatRoom.setReceiverId(userId);
//            chatRoomRepository.save(newChatRoom);
//        }
//        else{
//            if(chatRoom_for_receiver != null){
//                return chatRoom_for_receiver;
//            }
//        }
//
//        return chatRoom;
    }
}
