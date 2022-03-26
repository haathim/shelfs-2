package com.example.checkRevision.model;

public class SellersPayment {
    private int pickupId;
    private Seller seller;
    private int paymentAmount;

    public SellersPayment(int pickupId, Seller seller, int paymentAmount) {
        this.pickupId = pickupId;
        this.seller = seller;
        this.paymentAmount = paymentAmount;
    }

    public int getPickupId() {
        return pickupId;
    }

    public void setPickupId(int pickupId) {
        this.pickupId = pickupId;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public int getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(int paymentAmount) {
        this.paymentAmount = paymentAmount;
    }
}
