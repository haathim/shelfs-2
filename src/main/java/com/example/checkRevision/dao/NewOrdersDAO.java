package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.model.NewOrder;
import com.example.checkRevision.model.OrderBuyer;

import java.sql.*;
import java.util.ArrayList;

public class NewOrdersDAO {

    public NewOrdersDAO() {
    }


    public void addOrder(String buyerId, Timestamp dateOrdered, boolean isCourier, int totalPrice) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

        String newOrderSQL = "INSERT INTO `newOrders` (buyerId, dateOrdered, status, deliverer, isCourier, totalPrice) VALUES (?,?,?,?,?,?);";
        PreparedStatement newOrderStmt = con.prepareStatement(newOrderSQL);

        newOrderStmt.setString(1, buyerId);
        newOrderStmt.setTimestamp(2, dateOrdered);
        newOrderStmt.setInt(3, 0);
        newOrderStmt.setString(4, null);
        newOrderStmt.setBoolean(5, isCourier);
        newOrderStmt.setInt(6, totalPrice);
        int result = newOrderStmt.executeUpdate();

    }

    public int getOrderId(String buyerId, Timestamp dateOrdered) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT `orderId` FROM  `newOrders` WHERE `buyerId` = ? AND dateOrdered = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        stmt.setTimestamp(2, dateOrdered);

        ResultSet result = stmt.executeQuery();
        result.next();

        return result.getInt(1);

    }

    public void updateOrderStatus(int orderId, int status) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrders` SET `status` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, status);
        stmt.setInt(2, orderId);

        stmt.executeUpdate();
    }

    public void updateOrderStatusByDeliverer(int orderId, int status, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrders` SET `status` = ? WHERE `orderId` = ? AND `deliverer` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, status);
        stmt.setInt(2, orderId);
        stmt.setString(3, deliverer);

        stmt.executeUpdate();
    }

    public void assignDelivererForOrder(int orderId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrders` SET `deliverer` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, deliverer);
        stmt.setInt(2, orderId);

        stmt.executeUpdate();
    }

    public void completeOrder(int orderId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET `status` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setInt(1, 3);
        stmt.setInt(2, orderId);

        stmt.executeUpdate();
    }


    public ArrayList<NewOrder> getCourierOrders() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM  `newOrders` WHERE `status` = ? AND isCourier = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, 1);
        stmt.setBoolean(2, true);

        ResultSet result = stmt.executeQuery();

        ArrayList<NewOrder> courierOrders = new ArrayList<>();

        while(result.next()){

            NewOrder courierOrder = new NewOrder(result.getInt(1), result.getString(2), result.getTimestamp(3), result.getInt(4), result.getString(5), true, result.getInt(7));

            courierOrders.add(courierOrder);

        }

        return courierOrders;
    }

    public ArrayList<Advertisement> getMyShelfAds(String buyerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT  advertisements.adId, advertisements.title, advertisements.author, advertisements.description, advertisements.bookFrontPhoto FROM neworders\n" +
                "INNER JOIN neworderpickups\n" +
                "ON neworders.orderId = neworderpickups.orderId\n" +
                "INNER JOIN newpickupsads\n" +
                "ON neworderpickups.pickupId = newpickupsads.pickupId\n" +
                "INNER JOIN advertisements\n" +
                "ON newpickupsads.adId = advertisements.adId\n" +
                "WHERE neworders.buyerId = ?\n" +
                "AND neworders.status = 3;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);

        ResultSet result = stmt.executeQuery();


        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();

        while(result.next()){

            int adId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);
            String description = result.getString(4);
            String bookPhotoFront = result.getString(5);

            ads.add(new Advertisement(adId, null, title, author, 0, null, null, true, description, bookPhotoFront, null, null, null));
        }

        return ads;

    }

    public ArrayList<NewOrder> getAllOrdersOfBuyer(String buyerId, String keyword) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworders\n" +
                "WHERE neworders.buyerId = ?\n" +
                "AND (neworders.orderId = ? OR neworders.buyerId LIKE ?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        stmt.setString(2, keyword);
        stmt.setString(3, "%"+keyword+"%");

        ResultSet result = stmt.executeQuery();
        ArrayList<NewOrder> orders = new ArrayList<NewOrder>();
        while(result.next()){

            int orderId = result.getInt(1);
            Timestamp dateOrdered = result.getTimestamp(3);
            int status = result.getInt(4);
            int total = result.getInt(7);

            orders.add(new NewOrder(orderId, "", dateOrdered, status, "", false, total));
        }

        return orders;
    }

    public ArrayList<OrderBuyer> getOrdersForAdmin() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM neworders INNER JOIN buyers ON neworders.buyerId = buyers.username;";

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

    public ArrayList<Advertisement> getOrderDetailsForAdmin(int orderId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT advertisements.* FROM neworders INNER JOIN neworderpickups ON neworders.orderId = neworderpickups.orderId INNER JOIN newpickupsads on neworderpickups.pickupId = newpickupsads.pickupId INNER JOIN advertisements ON newpickupsads.adId = advertisements.adId WHERE neworders.orderId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1,orderId);
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();
        for (int i = 0; i < 10 && result.next(); i++) {
            int adId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);
            int price = result.getInt(4);
            String isbn = result.getString(5);
            String language = result.getString(6);
            boolean available = result.getBoolean(7);
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
}
