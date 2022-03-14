package com.magnet.web_photos.webphotos.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
public class ChatMessage {
    @Id
    @GeneratedValue
    private Long id;
    @Column(name = "chat_id")
    private Long chatId;
    @Column(name = "sender_id")
    private Long senderId;
    @Column(name = "receiver_id")
    private Long receiverId;
    @Nationalized
    @Column(name = "sender_name")
    private String senderName;
    @Nationalized
    @Column(name = "receiver_name")
    private String receiverName;
    private String content;
    private LocalDateTime timestamp;

    public ChatMessage() {
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

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
}
