package com.example.checkRevision.model;

public class Message {

    private int messageId;
    private String incomingUserId;
    private String outgoingUserId;
    private String messageContent;

    public Message(int messageId, String incomingUserId, String outgoingUserId, String messageContent) {
        this.messageId = messageId;
        this.incomingUserId = incomingUserId;
        this.outgoingUserId = outgoingUserId;
        this.messageContent = messageContent;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getIncomingUserId() {
        return incomingUserId;
    }

    public void setIncomingUserId(String incomingUserId) {
        this.incomingUserId = incomingUserId;
    }

    public String getOutgoingUserId() {
        return outgoingUserId;
    }

    public void setOutgoingUserId(String outgoingUserId) {
        this.outgoingUserId = outgoingUserId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }
}
