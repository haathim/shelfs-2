package com.example.checkRevision.model;

public class NewOrderNewOrderPickups {
    private NewOrder newOrder;
    private NewOrderPickups newOrderPickups;
    int totalPrice;
    int adId;

    public NewOrderNewOrderPickups(NewOrder newOrder, NewOrderPickups newOrderPickups, int totalPrice, int adId) {
        this.newOrder = newOrder;
        this.newOrderPickups = newOrderPickups;
        this.totalPrice = totalPrice;
        this.adId = adId;
    }

    public NewOrder getNewOrder() {
        return newOrder;
    }

    public void setNewOrder(NewOrder newOrder) {
        this.newOrder = newOrder;
    }

    public NewOrderPickups getNewOrderPickups() {
        return newOrderPickups;
    }

    public void setNewOrderPickups(NewOrderPickups newOrderPickups) {
        this.newOrderPickups = newOrderPickups;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }
}
