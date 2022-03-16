package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Message {
    private int messageId;
    private String from;
    private String to;
    private Timestamp date;
    private String content;

    public Message(int messageId, String from, String to, Timestamp date, String content) {
        this.messageId = messageId;
        this.from = from;
        this.to = to;
        this.date = date;
        this.content = content;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
