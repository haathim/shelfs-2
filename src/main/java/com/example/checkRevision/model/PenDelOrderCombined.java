package com.example.checkRevision.model;

public class PenDelOrderCombined {
    private PendingJob pendingJob;
    private Order order;
    private Buyer buyer;
    private Buyer seller;
    private Advertisement advertisement;

    public PenDelOrderCombined(PendingJob pendingJob, Order order, Buyer buyer, Buyer seller, Advertisement advertisement) {
        this.pendingJob = pendingJob;
        this.order = order;
        this.buyer = buyer;
        this.seller = seller;
        this.advertisement = advertisement;
    }

    public PendingJob getPendingJob() {
        return pendingJob;
    }

    public void setPendingJob(PendingJob pendingJob) {
        this.pendingJob = pendingJob;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Buyer getBuyer() {
        return buyer;
    }

    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }

    public Buyer getSeller() {
        return seller;
    }

    public void setSeller(Buyer seller) {
        this.seller = seller;
    }

    public Advertisement getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(Advertisement advertisement) {
        this.advertisement = advertisement;
    }
}
