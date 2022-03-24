package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.*;

import java.sql.*;
import java.util.ArrayList;

public class DeliveryDAO {
    public void addDeliveryPerson(Delivery newDeliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String userSQL = "INSERT INTO `users`  (`username`,`password`, `userType`, `dateJoined`, `salt`, `verified`) VALUES (?,?,?,?,?,?);";
        String buyerSQL = "INSERT INTO `delivery`  (`username`, `name`, `phoneNo`) VALUES (?,?,?);";

        PreparedStatement userStmt = con.prepareStatement(userSQL);
        userStmt.setString(1,newDeliverer.getUsername());
        userStmt.setString(2,newDeliverer.getPassword());
        userStmt.setString(3,newDeliverer.getUserType());
        userStmt.setTimestamp(4,newDeliverer.getDateJoined());
        userStmt.setInt(5,newDeliverer.getSalt());
        userStmt.setBoolean(6,true);

        PreparedStatement buyerStmt = con.prepareStatement(buyerSQL);

        buyerStmt.setString(1,newDeliverer.getUsername());
        buyerStmt.setString(2,newDeliverer.getFirstName() + " " + newDeliverer.getLastName());
        buyerStmt.setString(3, newDeliverer.getPhoneNo());

        userStmt.executeUpdate();
        buyerStmt.executeUpdate();

    }

    public ArrayList<OrderPickupSeller> getPendingPickups(String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworderpickups INNER JOIN buyers ON neworderpickups.sellerId = buyers.username WHERE deliverer = ? AND (status = 0 OR status = 1);";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<OrderPickupSeller> details = new ArrayList<>();

        while(result.next()){

            int pickupid = result.getInt(1);
            int orderId = result.getInt(2);
            int status = result.getInt(4);
            String sellerId = result.getString(3);
            String firstName = result.getString(7);
            String lastName = result.getString(8);
            String houseNo = result.getString(9);
            String street = result.getString(10);
            String city = result.getString(11);
            String district = result.getString(12);
            String province = result.getString(13);
            String phoneNo = result.getString(15);

            NewOrderPickups orderPickup = new NewOrderPickups(pickupid, orderId, sellerId, status, "");
            Buyer seller = new Buyer(sellerId, "","",0,null,firstName,lastName,houseNo,street,city,district,province,true,phoneNo,"");

            details.add(new OrderPickupSeller(orderPickup, seller));

        }

        return details;

    }

    public ArrayList<Advertisement> getPendingPickupsDetails(int pickupId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM newpickupsads\n" +
                "INNER JOIN neworderpickups\n" +
                "ON newpickupsads.pickupId = neworderpickups.pickupId\n" +
                "INNER JOIN advertisements\n" +
                "ON newpickupsads.adId = advertisements.adId\n" +
                "WHERE newpickupsads.pickupId = ? AND neworderpickups.deliverer = ? AND advertisements.availableStatus = 0;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1,pickupId);
        stmt.setString(2, deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();
        for (int i = 0; i < 10 && result.next(); i++) {
            int adId = result.getInt(8);
            String title = result.getString(9);
            String author = result.getString(10);
            int price = result.getInt(11);
            String isbn = result.getString(12);
            String language = result.getString(13);
            int available = result.getInt(14);
            String description = result.getString(15);
            String bookFrontPhoto = result.getString(16);
            String bookBackPhoto = result.getString(17);
            String category = result.getString(18);
            String sellerId = result.getString(19);
            Timestamp dateAdded = result.getTimestamp(20);

            ads.add(new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded));
        }

        return ads;
    }

    public ArrayList<NewOrderPickups> getPickupHistory(String deliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworderpickups\n" +
                "WHERE deliverer = ? AND status = 2;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<NewOrderPickups> details = new ArrayList<>();

        while(result.next()){
            int pickupid = result.getInt(1);
            int orderId = result.getInt(2);
            int status = result.getInt(4);
            String sellerId = result.getString(3);

            details.add(new NewOrderPickups(pickupid,orderId,sellerId,2,""));
        }

        return details;
    }

    public ArrayList<OrderBuyer> getPendingDeliveries(String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworders INNER JOIN buyers ON neworders.buyerId = buyers.username WHERE (neworders.status = 1 OR neworders.status = 2) AND neworders.deliverer = ?;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<OrderBuyer> details = new ArrayList<>();

        while(result.next()){
            int orderId = result.getInt(1);
            String buyerId = result.getString(2);
            int status = result.getInt(4);
            String firstName = result.getString(9);
            String lastName = result.getString(10);
            int total = result.getInt(7);

            String houseNo = result.getString(11);
            String street = result.getString(12);
            String city = result.getString(13);
            String district = result.getString(14);
            String province = result.getString(15);
            String phoneNo = result.getString(16);

            NewOrder order = new NewOrder(orderId, buyerId, null, status, "", false, total);
            Buyer buyer = new Buyer(buyerId, "","",0,null,firstName,lastName,houseNo,street,city,district,province,true,phoneNo,"");


            details.add(new OrderBuyer(order, buyer));
        }

        return details;
    }

    public ArrayList<Advertisement> getPendingDeliveryDetails(int orderId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT advertisements.* FROM neworders INNER JOIN neworderpickups ON neworders.orderId = neworderpickups.orderId INNER JOIN newpickupsads on neworderpickups.pickupId = newpickupsads.pickupId INNER JOIN advertisements ON newpickupsads.adId = advertisements.adId WHERE neworders.orderId = ? AND neworders.deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1,orderId);
        stmt.setString(2, deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();
        for (int i = 0; i < 10 && result.next(); i++) {
            int adId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);
            int price = result.getInt(4);
            String isbn = result.getString(5);
            String language = result.getString(6);
            int available = result.getInt(7);
            String description = result.getString(8);
            String bookFrontPhoto = result.getString(9);
            String bookBackPhoto = result.getString(10);
            String category = result.getString(11);
            String sellerId = result.getString(12);
            Timestamp dateAdded = result.getTimestamp(13);

            ads.add(new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded));
        }

        return ads;
    }

    public ArrayList<NewOrder> getDeliveryHistory(String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworders\n" +
                "WHERE deliverer = ? AND status = 3;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,deliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<NewOrder> details = new ArrayList<>();

        while(result.next()){
            int orderId = result.getInt(1);
            String buyerId = result.getString(2);
            int totalPrice = result.getInt(7);

            details.add(new NewOrder(orderId,buyerId,null,3,deliverer,false,totalPrice));
        }

        return details;
    }

    public ArrayList<Delivery> getDeliveryPersonDetails() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users INNER JOIN delivery ON users.username = delivery.username;";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        ArrayList<Delivery> deliveryPersons = new ArrayList<>();
        while (result.next()){
            String username = result.getString(1);
            Timestamp dateJoined = result.getTimestamp(5);
            String name = result.getString(8);
            String phoneNo = result.getString(9);

            deliveryPersons.add( new Delivery(username, "",dateJoined,0,name,"",phoneNo));
        }

        return deliveryPersons;

    }

    public ArrayList<OrderBuyer> getPendingDeliveriesToAssignDeliverer() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworders INNER JOIN buyers ON neworders.buyerId = buyers.username WHERE neworders.status = 1 AND neworders.deliverer IS NULL;";

        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();
        ArrayList<OrderBuyer> details = new ArrayList<>();

        while(result.next()){
            int orderId = result.getInt(1);
            String buyerId = result.getString(2);
            Timestamp dateOrdered = result.getTimestamp(3);
            int status = result.getInt(4);
            String deliverer = result.getString(5);
            boolean isCourier = result.getBoolean(6);
            int total = result.getInt(7);

            String firstName = result.getString(9);
            String lastName = result.getString(10);
            String houseNo = result.getString(11);
            String street = result.getString(12);
            String city = result.getString(13);
            String district = result.getString(14);
            String province = result.getString(15);
            String phoneNo = result.getString(16);
            String email = result.getString(17);

            NewOrder order = new NewOrder(orderId, buyerId, dateOrdered, status, deliverer, false, total);
            Buyer buyer = new Buyer(buyerId, "","",0,null,firstName,lastName,houseNo,street,city,district,province,true,phoneNo,email);


            details.add(new OrderBuyer(order, buyer));
        }

        return details;
    }

    public ArrayList<OrderPickupSeller> getPendingPickupsToAssignDeliverer() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworderpickups\n" +
                "INNER JOIN buyers\n" +
                "ON neworderpickups.sellerId = buyers.username\n" +
                "WHERE deliverer IS NULL AND status = 0;";

        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        ArrayList<OrderPickupSeller> details = new ArrayList<>();

        while(result.next()){

            int pickupid = result.getInt(1);
            int orderId = result.getInt(2);
            int status = result.getInt(4);
            String sellerId = result.getString(3);
            String firstName = result.getString(7);
            String lastName = result.getString(8);
            String houseNo = result.getString(9);
            String street = result.getString(10);
            String city = result.getString(11);
            String district = result.getString(12);
            String province = result.getString(13);
            String phoneNo = result.getString(15);

            NewOrderPickups orderPickup = new NewOrderPickups(pickupid, orderId, sellerId, status, "");
            Buyer seller = new Buyer(sellerId, "","",0,null,firstName,lastName,houseNo,street,city,district,province,true,phoneNo,"");

            details.add(new OrderPickupSeller(orderPickup, seller));

        }

        return details;
    }
}
