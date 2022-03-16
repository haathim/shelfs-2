package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeliveryDAO {
    public void addDeliveryPerson(Delivery newDeliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String userSQL = "INSERT INTO `users`  (`username`,`password`, `userType`, `dateJoined`, `salt`) VALUES (?,?,?,?,?);";
        String buyerSQL = "INSERT INTO `delivery`  (`username`, `name`, `phoneNo`) VALUES (?,?,?);";

        PreparedStatement userStmt = con.prepareStatement(userSQL);
        userStmt.setString(1,newDeliverer.getUsername());
        userStmt.setString(2,newDeliverer.getPassword());
        userStmt.setString(3,newDeliverer.getUserType());
        userStmt.setTimestamp(4,newDeliverer.getDateJoined());
        userStmt.setInt(5,newDeliverer.getSalt());

        PreparedStatement buyerStmt = con.prepareStatement(buyerSQL);

        buyerStmt.setString(1,newDeliverer.getUsername());
        buyerStmt.setString(2,newDeliverer.getFirstName() + " " + newDeliverer.getLastName());
        buyerStmt.setString(3, newDeliverer.getPhoneNo());

        userStmt.executeUpdate();
        buyerStmt.executeUpdate();

    }
}
