package com.example.checkRevision.model;

public class OrderBuyer {
    public NewOrder order;
    public Buyer buyer;

    public OrderBuyer(NewOrder order, Buyer buyer) {
        this.order = order;
        this.buyer = buyer;
    }

    public NewOrder getOrder() {
        return order;
    }

    public void setOrder(NewOrder order) {
        this.order = order;
    }

    public Buyer getBuyer() {
        return buyer;
    }

    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }
}
