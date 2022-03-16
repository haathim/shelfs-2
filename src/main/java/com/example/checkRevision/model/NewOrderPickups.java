package com.example.checkRevision.model;

public class NewOrderPickups {

    private int pickupId;
    private int orderId;
    private String sellerId;
    private int status;
    private String deliverer;

    public NewOrderPickups(int pickupId, int orderId, String sellerId, int status, String deliverer) {
        this.pickupId = pickupId;
        this.orderId = orderId;
        this.sellerId = sellerId;
        this.status = status;
        this.deliverer = deliverer;
    }

    public int getPickupId() {
        return pickupId;
    }

    public void setPickupId(int pickupId) {
        this.pickupId = pickupId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDeliverer() {
        return deliverer;
    }

    public void setDeliverer(String deliverer) {
        this.deliverer = deliverer;
    }
}
