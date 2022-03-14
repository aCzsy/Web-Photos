package com.magnet.web_photos.webphotos.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class ChatRoom {
    @Id
    @GeneratedValue
    private Long id;
    @Column(name = "chat_id")
    private Long chatId;
    @Column(name = "sender_id")
    private Long senderId;
    @Column(name = "receiver_id")
    private Long receiverId;
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChatMessage> messages = new ArrayList<>();

    public ChatRoom() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getChatId() {
        return chatId;
    }

    public void setChatId(Long chatId) {
        this.chatId = chatId;
    }

    public Long getSenderId() {
        return senderId;
    }

    public void setSenderId(Long senderId) {
        this.senderId = senderId;
    }

    public Long getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Long receiverId) {
        this.receiverId = receiverId;
    }

    public List<ChatMessage> getMessages() {
        return messages;
    }

    public void setMessages(List<ChatMessage> messages) {
        this.messages = messages;
    }
}
