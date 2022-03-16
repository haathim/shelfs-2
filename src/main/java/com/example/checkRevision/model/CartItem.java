package com.example.checkRevision.model;

import java.sql.Timestamp;

public class CartItem {
    private long cartItemId;
    private String adId;
    private String buyerId;
    private Timestamp timeAdded;

    public CartItem(long cartItemId, String adId, String buyerId, Timestamp timeAdded) {
        this.cartItemId = cartItemId;
        this.adId = adId;
        this.buyerId = buyerId;
        this.timeAdded = timeAdded;
    }

    public long getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(long cartItemId) {
        this.cartItemId = cartItemId;
    }

    public String getAdId() {
        return adId;
    }

    public void setAdId(String adId) {
        this.adId = adId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public Timestamp getTimeAdded() {
        return timeAdded;
    }

    public void setTimeAdded(Timestamp timeAdded) {
        this.timeAdded = timeAdded;
    }
}
