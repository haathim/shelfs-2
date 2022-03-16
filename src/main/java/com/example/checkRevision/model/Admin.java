package com.example.checkRevision.model;

import java.sql.Timestamp;

public class Admin extends User{
    private String firstName;
    private String lastName;
    private String phoneNo;

        public Admin(String username, String password, String userType, Timestamp dateJoined, int salt, String firstName, String lastName, String phoneNo) {
        super(username, password, userType, dateJoined, salt);
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNo = phoneNo;
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

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }


}
