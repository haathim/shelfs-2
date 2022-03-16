package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Ratings {
    private long ratingId;
    private String buyerId;
    private String sellerId;
    private String orderId;
    private Timestamp date;
    private int rating;
    private String comment;

    public Ratings(long ratingId, String buyerId, String sellerId, String orderId, Timestamp date, int rating, String comment) {
        this.ratingId = ratingId;
        this.buyerId = buyerId;
        this.sellerId = sellerId;
        this.orderId = orderId;
        this.date = date;
        this.rating = rating;
        this.comment = comment;
    }

    public long getRatingId() {
        return ratingId;
    }

    public void setRatingId(long ratingId) {
        this.ratingId = ratingId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        if (rating >= 0 && rating <= 5){
            this.rating = rating;
        }

    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
