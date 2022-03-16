package com.example.checkRevision.model;

import java.sql.Date;
import java.sql.Timestamp;

abstract public class User {
    protected String username;
    protected String password;
    protected String userType;
    protected Timestamp dateJoined;
    protected int salt;

    public User(String username, String password, String userType, Timestamp dateJoined, int salt) {
        this.username = username;
        this.password = password;
        this.userType = userType;
        this.dateJoined = dateJoined;
        this.salt = salt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getSalt() {
        return salt;
    }

    public void setSalt(int salt) {
        this.salt = salt;
    }

    public Timestamp getDateJoined() {
        return dateJoined;
    }

    public void setDateJoined(Timestamp dateJoined) {
        this.dateJoined = dateJoined;
    }

    //    public void func(){
//        java.util.Date dt = new java.util.Date();
//
//        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//        String currentTime = sdf.format(dt);
//        System.out.println(currentTime);
//    }
}
