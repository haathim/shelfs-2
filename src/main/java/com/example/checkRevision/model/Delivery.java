package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Delivery extends User{
    private String firstName;
    private String lastName;
    private String phoneNo;

    public Delivery(String username, String password, Timestamp dateJoined, int salt, String firstName, String lastName, String phoneNo) {
        super(username, password, "delivery", dateJoined, salt);
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNo = phoneNo;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getFullName(){
        return firstName+lastName;
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

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}
