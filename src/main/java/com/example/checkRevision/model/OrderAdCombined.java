package com.example.checkRevision.model;

public class OrderAdCombined {
    private Order order;
    private Advertisement ad;

    public OrderAdCombined(Order order, Advertisement ad) {
        this.order = order;
        this.ad = ad;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Advertisement getAd() {
        return ad;
    }

    public void setAd(Advertisement ad) {
        this.ad = ad;
    }

    @Override
    public String toString() {
        return "OrderAdCombined{" +
                "order=" + order +
                ", ad=" + ad +
                '}';
    }
}
