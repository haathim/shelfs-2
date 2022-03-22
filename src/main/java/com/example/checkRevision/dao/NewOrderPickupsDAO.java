package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Seller;
import com.example.checkRevision.model.SellerSale;
import com.example.checkRevision.model.SellersPayment;

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

    public void undoPendingPickupForDeliverer(String deliverer, int pickupId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET deliverer = NULL WHERE `pickupId` = ? and deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, pickupId);
        stmt.setString(2, deliverer);

        stmt.executeUpdate();
    }

    public void undoPendingDeliveryForDeliverer(String deliverer, int orderId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrders` SET deliverer = NULL WHERE `orderId` = ? and deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        stmt.setString(2, deliverer);

        stmt.executeUpdate();
    }

    public void addPickupPaymentStatus(int pickupId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = " INSERT INTO `pickupPaymentStatus` (pickupId, status) VALUES (?,?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, pickupId);
        stmt.setBoolean(2, false);

        stmt.executeUpdate();
    }


    public ArrayList<SellersPayment> getToBePayedSellers() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT neworderpickups.pickupId, neworderpickups.sellerId, buyers.firstName, buyers.lastname, buyers.email, sellers.bankAccountNo, sellers.bankName, sellers.bankBranch, SUM(advertisements.price) FROM neworderpickups INNER JOIN newpickupsads on neworderpickups.pickupId = newpickupsads.pickupId INNER JOIN advertisements ON newpickupsads.adId = advertisements.adId INNER JOIN buyers ON neworderpickups.sellerId = buyers.username INNER JOIN sellers ON neworderpickups.sellerId = sellers.username INNER JOIN pickuppaymentstatus ON neworderpickups.pickupId = pickuppaymentstatus.pickupId WHERE neworderpickups.status = 1 AND pickuppaymentstatus.status = 0 GROUP BY neworderpickups.pickupId;";

        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();
        ArrayList<SellersPayment> sellersPaymentsList= new ArrayList<>();

        while (result.next()){

            int pickupId = result.getInt(1);
            String sellerId = result.getString(2);
            String firstName = result.getString(3);
            String lastName = result.getString(4);
            String email = result.getString(5);
            String bankAccountNo = result.getString(6);
            String bankName = result.getString(7);
            String bankBranch = result.getString(8);
            int paymentAmount = result.getInt(9);



            Seller seller = new Seller(sellerId,"","seller",0,null, firstName, lastName, "","","","","",true,"",email,"", "", "", bankAccountNo,bankName,bankBranch);
            sellersPaymentsList.add(new SellersPayment(pickupId, seller, paymentAmount));
        }

        return sellersPaymentsList;

    }

    public void updatePickupPaymentStatus(int pickupId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = " UPDATE `pickupPaymentStatus` SET status = 1 WHERE pickupId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, pickupId);

        stmt.executeUpdate();
    }
}
