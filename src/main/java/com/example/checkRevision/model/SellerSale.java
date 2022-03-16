package com.example.checkRevision.model;

public class SellerSale {
    private String buyer;
    private int adId;
    private String title;
    private String Author;
    private int orderId;

    public SellerSale(String buyer, int adId, String title, String author, int orderId) {
        this.buyer = buyer;
        this.adId = adId;
        this.title = title;
        Author = author;
        this.orderId = orderId;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
