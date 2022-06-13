package com.magnet.web_photos.webphotos.model;

public class ReturnChatMessage {
    private String senderName;
    private String senderId;
    private String message;

    public ReturnChatMessage() {
    }

    public ReturnChatMessage(String senderName, String senderId, String message) {
        this.senderName = senderName;
        this.senderId = senderId;
        this.message = message;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
