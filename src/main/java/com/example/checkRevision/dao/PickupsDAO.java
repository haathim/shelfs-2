package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Advertisement;

import java.sql.*;
import java.util.ArrayList;

public class PickupsDAO {

    public PickupsDAO() {
    }

    public void addPickup(String sellerId, ArrayList<Advertisement> ads) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO `pickups` (sellerId, datePlaced, status) VALUES (?,?,?);";
        PreparedStatement stmt = con.prepareStatement(sql);

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        stmt.setString(1, sellerId);
        stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
        stmt.setBoolean(3, false);

        stmt.executeUpdate();

        String sql2 = "SELECT `pickupId` FROM `pickups` WHERE `sellerId` = ? AND `datePlaced` = ?";
        PreparedStatement stmt2 = con.prepareStatement(sql2);
        stmt2.setString(1, sellerId);
        stmt2.setTimestamp(2, currentTime);
        ResultSet resultSet = stmt2.executeQuery();
        resultSet.next();
        int pickupId = resultSet.getInt(1);

        String sql3 = "INSERT INTO `pickupOrders` (pickupId, adId) VALUES (?,?);";
        PreparedStatement stmt3 = con.prepareStatement(sql3);

        for (Advertisement ad:ads){

            stmt3.setInt(1, pickupId);
            stmt3.setInt(2, (int) ad.getAdId());

            stmt3.executeUpdate();

        }


    }
}
