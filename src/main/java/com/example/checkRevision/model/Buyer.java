package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Buyer extends User{
    private String firstName;
    private String lastName;
    private String houseNo;
    private String street;
    private String city;
    private String district;
    private String province;
    private boolean sellerApplied;
    private String phoneNo;
    private String email;


    public Buyer(String username, String password, String userType, int salt, Timestamp dateJoined, String firstName, String lastName, String houseNo, String street, String city, String district, String province, boolean sellerApplied, String phoneNo, String email) {
        super(username, password, userType, dateJoined, salt);
        this.firstName = firstName;
        this.lastName = lastName;
        this.houseNo = houseNo;
        this.street = street;
        this.city = city;
        this.district = district;
        this.province = province;
        this.sellerApplied = sellerApplied;
        this.phoneNo = phoneNo;
        this.email = email;

    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public boolean isSellerApplied() {
        return sellerApplied;
    }

    public void setSellerApplied(boolean sellerApplied) {
        this.sellerApplied = sellerApplied;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress(){
        return getHouseNo()+", "+getStreet()+", "+getCity()+", "+getDistrict()+", "+getProvince();
    }
}

