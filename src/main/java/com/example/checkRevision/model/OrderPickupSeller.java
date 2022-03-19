package com.example.checkRevision.model;

public class OrderPickupSeller {
    private NewOrderPickups newOrderPickups;
    private Buyer seller;

    public OrderPickupSeller(NewOrderPickups newOrderPickups, Buyer seller) {
        this.newOrderPickups = newOrderPickups;
        this.seller = seller;
    }

    public NewOrderPickups getNewOrderPickups() {
        return newOrderPickups;
    }

    public void setNewOrderPickups(NewOrderPickups newOrderPickups) {
        this.newOrderPickups = newOrderPickups;
    }

    public Buyer getSeller() {
        return seller;
    }

    public void setSeller(Buyer seller) {
        this.seller = seller;
    }
}
