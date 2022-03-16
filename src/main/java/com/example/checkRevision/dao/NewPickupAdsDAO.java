package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NewPickupAdsDAO {

    public NewPickupAdsDAO() {
    }

    public void addPickupAd(int pickupId, int adId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String newOrderSQL = "INSERT INTO `newPickupsAds` (pickupId, adId) VALUES (?,?);";
        PreparedStatement newOrderStmt = con.prepareStatement(newOrderSQL);

        newOrderStmt.setInt(1, pickupId);
        newOrderStmt.setInt(2, adId);

        newOrderStmt.executeUpdate();
    }
}
