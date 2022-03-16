package com.example.checkRevision.model;

public class Order {
    private long orderId;
    private String buyerId;
    private int adId;
    private boolean isCompleted;

    public Order(long orderId, String buyerId, int adId, boolean isCompleted) {
        this.orderId = orderId;
        this.buyerId = buyerId;
        this.adId = adId;
        this.isCompleted = isCompleted;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", buyerId='" + buyerId + '\'' +
                ", adId=" + adId +
                ", isCompleted=" + isCompleted +
                '}';
    }
}
