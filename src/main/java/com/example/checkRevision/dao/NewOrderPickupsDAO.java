package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.SellerSale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewOrderPickupsDAO {

    public NewOrderPickupsDAO() {
    }


    public void addPickup(int orderId, String seller) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO `newOrderPickups` (orderId, sellerId, status) VALUES (?,?,?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        stmt.setString(2, seller);
        stmt.setInt(3, 0);

        stmt.executeUpdate();
    }

    public int getPickupId(int orderId, String seller) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `pickupId` FROM  `newOrderPickups` WHERE `orderId` = ? AND sellerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        stmt.setString(2, seller);

        ResultSet result = stmt.executeQuery();
        result.next();

        return result.getInt(1);
    }

    public void assignDelivererForPickup(int pickupId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET `deliverer` = ? WHERE `pickupId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, deliverer);
        stmt.setInt(2, pickupId);

        stmt.executeUpdate();
    }

    public void updatePickupStatus(String deliverer, int pickupId, int status) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET `status` = ? WHERE `pickupId` = ? and deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, status);
        stmt.setInt(2, pickupId);
        stmt.setString(3, deliverer);

        stmt.executeUpdate();
    }

    public int getOrderIdOfPickup(int pickupId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `orderId` FROM  `newOrderPickups` WHERE `pickupId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, pickupId);
        ResultSet result = stmt.executeQuery();
        result.next();

        return result.getInt(1);
    }

    public ArrayList<Integer> getAllPickupsStatusOfOrderId(int orderId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `status` FROM  `newOrderPickups` WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        ResultSet result = stmt.executeQuery();

        ArrayList<Integer> pickupStatuses = new ArrayList<>();

        while(result.next()){
            pickupStatuses.add(result.getInt(1));
        }
        return pickupStatuses;
    }


    public ArrayList<SellerSale> getNewSellerSales(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `neworders`.`orderId`, `advertisements`.`adId`, `buyerId`, `title`, `author` FROM `neworders` INNER JOIN `neworderpickups` ON `neworders`.`orderId` = `neworderpickups`.`orderId` INNER JOIN `newpickupsads` ON `neworderpickups`.`pickupId` = `newpickupsads`.`pickupId` INNER JOIN `advertisements`ON `newpickupsads`.`adId` = `advertisements`.`adId` WHERE `neworderpickups`.`sellerId` = ? and `newOrderPickups`.`status` = 0;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);

        ResultSet result = stmt.executeQuery();
        ArrayList<SellerSale> newSellerSales= new ArrayList<>();

        while (result.next()){
            newSellerSales.add(new SellerSale(result.getString(3), result.getInt(2), result.getString(4), result.getString(5), result.getInt(1)));
        }

        return newSellerSales;



    }
}
