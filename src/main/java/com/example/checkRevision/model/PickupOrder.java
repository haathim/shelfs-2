package com.example.checkRevision.model;

public class PickupOrder {

    private int id;
    private int pickupId;
    private int adId;

    public PickupOrder(int id, int pickupId, int adId) {
        this.id = id;
        this.pickupId = pickupId;
        this.adId = adId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPickupId() {
        return pickupId;
    }

    public void setPickupId(int pickupId) {
        this.pickupId = pickupId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }
}
