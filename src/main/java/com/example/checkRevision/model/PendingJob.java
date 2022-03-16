package com.example.checkRevision.model;

public class PendingJob {
    private int orderId;
    private String sellerHouseNo;
    private String sellerStreet;
    private String sellerCity;
    private String sellerDistrict;
    private String sellerProvince;
    private String buyerHouseNo;
    private String buyerStreet;
    private String buyerCity;
    private String buyerDistrict;
    private String buyerProvince;
    private boolean acceptedByDeliverer;
    private String deliverer;
    private boolean isPickedUp;
    private boolean isDelivered;

    public PendingJob(int orderId, String sellerHouseNo, String sellerStreet, String sellerCity, String sellerDistrict, String sellerProvince, String buyerHouseNo, String buyerStreet, String buyerCity, String buyerDistrict, String buyerProvince, boolean acceptedByDeliverer, String deliverer, boolean isPickedUp, boolean isDelivered) {
        this.orderId = orderId;
        this.sellerHouseNo = sellerHouseNo;
        this.sellerStreet = sellerStreet;
        this.sellerCity = sellerCity;
        this.sellerDistrict = sellerDistrict;
        this.sellerProvince = sellerProvince;
        this.buyerHouseNo = buyerHouseNo;
        this.buyerStreet = buyerStreet;
        this.buyerCity = buyerCity;
        this.buyerDistrict = buyerDistrict;
        this.buyerProvince = buyerProvince;
        this.acceptedByDeliverer = acceptedByDeliverer;
        this.deliverer = deliverer;
        this.isPickedUp = isPickedUp;
        this.isDelivered = isDelivered;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getSellerHouseNo() {
        return sellerHouseNo;
    }

    public void setSellerHouseNo(String sellerHouseNo) {
        this.sellerHouseNo = sellerHouseNo;
    }

    public String getSellerStreet() {
        return sellerStreet;
    }

    public void setSellerStreet(String sellerStreet) {
        this.sellerStreet = sellerStreet;
    }

    public String getSellerCity() {
        return sellerCity;
    }

    public void setSellerCity(String sellerCity) {
        this.sellerCity = sellerCity;
    }

    public String getSellerDistrict() {
        return sellerDistrict;
    }

    public void setSellerDistrict(String sellerDistrict) {
        this.sellerDistrict = sellerDistrict;
    }

    public String getSellerProvince() {
        return sellerProvince;
    }

    public void setSellerProvince(String sellerProvince) {
        this.sellerProvince = sellerProvince;
    }

    public String getBuyerHouseNo() {
        return buyerHouseNo;
    }

    public void setBuyerHouseNo(String buyerHouseNo) {
        this.buyerHouseNo = buyerHouseNo;
    }

    public String getBuyerStreet() {
        return buyerStreet;
    }

    public void setBuyerStreet(String buyerStreet) {
        this.buyerStreet = buyerStreet;
    }

    public String getBuyerCity() {
        return buyerCity;
    }

    public void setBuyerCity(String buyerCity) {
        this.buyerCity = buyerCity;
    }

    public String getBuyerDistrict() {
        return buyerDistrict;
    }

    public void setBuyerDistrict(String buyerDistrict) {
        this.buyerDistrict = buyerDistrict;
    }

    public String getBuyerProvince() {
        return buyerProvince;
    }

    public void setBuyerProvince(String buyerProvince) {
        this.buyerProvince = buyerProvince;
    }

    public boolean isAcceptedByDeliverer() {
        return acceptedByDeliverer;
    }

    public void setAcceptedByDeliverer(boolean acceptedByDeliverer) {
        this.acceptedByDeliverer = acceptedByDeliverer;
    }

    public String getDeliverer() {
        return deliverer;
    }

    public void setDeliverer(String deliverer) {
        this.deliverer = deliverer;
    }

    public boolean isPickedUp() {
        return isPickedUp;
    }

    public void setPickedUp(boolean pickedUp) {
        isPickedUp = pickedUp;
    }

    public boolean isDelivered() {
        return isDelivered;
    }

    public void setDelivered(boolean delivered) {
        isDelivered = delivered;
    }
}
