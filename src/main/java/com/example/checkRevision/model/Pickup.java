package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Pickup {

    private int pickupId;
    private String sellerId;
    private Timestamp datePlaced;
    private int status;
    private String deliverer;

    public Pickup(int pickupId, String sellerId, Timestamp datePlaced, int status, String deliverer) {
        this.pickupId = pickupId;
        this.sellerId = sellerId;
        this.datePlaced = datePlaced;
        this.status = status;
        this.deliverer = deliverer;
    }

    public int getPickupId() {
        return pickupId;
    }

    public void setPickupId(int pickupId) {
        this.pickupId = pickupId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public Timestamp getDatePlaced() {
        return datePlaced;
    }

    public void setDatePlaced(Timestamp datePlaced) {
        this.datePlaced = datePlaced;
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
