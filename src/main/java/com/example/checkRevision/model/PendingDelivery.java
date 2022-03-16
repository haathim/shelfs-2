package com.example.checkRevision.model;

public class PendingDelivery {
    private long orderId;
    private String houseNo;
    private String street;
    private String city;
    private String district;
    private String province;
    private boolean acceptedByDeliverer;
    private String deliverer;

    public PendingDelivery(long orderId, String houseNo, String street, String city, String district, String province, boolean acceptedByDeliverer, String deliverer) {
        this.orderId = orderId;
        this.houseNo = houseNo;
        this.street = street;
        this.city = city;
        this.district = district;
        this.province = province;
        this.acceptedByDeliverer = acceptedByDeliverer;
        this.deliverer = deliverer;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getHouseNo() {
        return houseNo;
    }

    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
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
}
