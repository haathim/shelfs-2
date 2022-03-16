package com.example.checkRevision.model;

import java.sql.Timestamp;

public class NewOrder {

    private int orderId;
    private String buyerId;
    private Timestamp dateOrdered;
    private int status;
    private String deliverer;
    private boolean isCourier;
    private int totalPrice;

    public NewOrder(int orderId, String buyerId, Timestamp dateOrdered, int status, String deliverer, boolean isCourier, int totalPrice) {
        this.orderId = orderId;
        this.buyerId = buyerId;
        this.dateOrdered = dateOrdered;
        this.status = status;
        this.deliverer = deliverer;
        this.isCourier = isCourier;
        this.totalPrice = totalPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public Timestamp getDateOrdered() {
        return dateOrdered;
    }

    public void setDateOrdered(Timestamp dateOrdered) {
        this.dateOrdered = dateOrdered;
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

    public boolean isCourier() {
        return isCourier;
    }

    public void setCourier(boolean courier) {
        isCourier = courier;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
