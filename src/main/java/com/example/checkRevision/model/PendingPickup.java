package com.example.checkRevision.model;

public class PendingPickup {
    private long orderId;
    private String buyerId;
    private String houseNo;
    private String street;
    private String city;
    private String district;
    private String province;
//    check whether can use 0,1,2 for status without using String
    private String status;

    public PendingPickup(long orderId, String buyerId, String houseNo, String street, String city, String district, String province, String status) {
        this.orderId = orderId;
        this.buyerId = buyerId;
        this.houseNo = houseNo;
        this.street = street;
        this.city = city;
        this.district = district;
        this.province = province;
        this.status = status;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
