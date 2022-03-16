package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Wishlist {
    private int wishlistId;
    private int adId;
    private String buyerId;
    private Timestamp dateAdded;

    public Wishlist(int wishlistId, int adId, String buyerId, Timestamp dateAdded) {
        this.wishlistId = wishlistId;
        this.adId = adId;
        this.buyerId = buyerId;
        this.dateAdded = dateAdded;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Timestamp dateAdded) {
        this.dateAdded = dateAdded;
    }
}
