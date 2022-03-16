package com.example.checkRevision.model;

public class NewPickupAds {

    private int pickupId;
    private int adId;

    public NewPickupAds(int pickupId, int adId) {
        this.pickupId = pickupId;
        this.adId = adId;
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
