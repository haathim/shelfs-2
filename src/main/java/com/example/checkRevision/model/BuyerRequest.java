package com.example.checkRevision.model;

import java.sql.Timestamp;

public class BuyerRequest {
    private long requestId;
    private String buyerId;
    private String title;
    private String author;
    private Timestamp date;
    private String category;
    private String comment;
    private int preferredPrice;

    public BuyerRequest(long requestId, String buyerId, String title, String author, Timestamp date, String category, String comment, int preferredPrice) {
        this.requestId = requestId;
        this.buyerId = buyerId;
        this.title = title;
        this.author = author;
        this.date = date;
        this.category = category;
        this.comment = comment;
        this.preferredPrice = preferredPrice;
    }


    public long getRequestId() {
        return requestId;
    }

    public void setRequestId(long requestId) {
        this.requestId = requestId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getPreferredPrice() {
        return preferredPrice;
    }

    public void setPreferredPrice(int preferredPrice) {
        this.preferredPrice = preferredPrice;
    }

    @Override
    public String toString() {
        return "BuyerRequest{" +
                "requestId=" + requestId +
                ", buyerId='" + buyerId + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", date=" + date +
                ", category='" + category + '\'' +
                ", comment='" + comment + '\'' +
                ", preferredPrice=" + preferredPrice +
                '}';
    }
}
