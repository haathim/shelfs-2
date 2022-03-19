package com.example.checkRevision.model;

public class BuyerAdvertisement {
    public Buyer buyer;
    public Advertisement ad;

    public BuyerAdvertisement(Buyer buyer, Advertisement ad) {
        this.buyer = buyer;
        this.ad = ad;
    }

    public Buyer getBuyer() {
        return buyer;
    }

    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }

    public Advertisement getAd() {
        return ad;
    }

    public void setAd(Advertisement ad) {
        this.ad = ad;
    }
}
