package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.*;
import com.example.checkRevision.variables.MyVariables;

import java.sql.*;
import java.util.ArrayList;

public class OrdersDAO {

    public OrdersDAO() {
    }

    public ArrayList<OrderAdCombined> getAllOrdersOfBuyer(String buyerId) throws SQLException, ClassNotFoundException {

        System.out.println("3333");

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `orders` INNER JOIN `advertisements` ON orders.adId = advertisements.adId WHERE buyerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        ResultSet result = stmt.executeQuery();

        System.out.println("4444");

        ArrayList<OrderAdCombined> orders = new ArrayList<OrderAdCombined>();

        while(result.next()){

            int orderId = result.getInt(1);
//            String buyerId = result.getString(2);
            int adId = result.getInt(3);
            boolean isDelivered = result.getBoolean(4);

            Order ord = new Order(orderId, buyerId, adId, isDelivered);

            //        int adId = result.getInt(5);
            String title = result.getString(6);
            String author = result.getString(7);
            int price = result.getInt(8);
            String isbn = result.getString(9);
            String language = result.getString(10);
            boolean available = result.getBoolean(11);
            String description = result.getString(12);
            String bookFrontPhoto = result.getString(13);
            String bookBackPhoto = result.getString(14);
            String category = result.getString(15);
            String sellerId = result.getString(16);
            Timestamp dateAdded = result.getTimestamp(17);

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

            orders.add(new OrderAdCombined(ord, ad));


        }

        System.out.println("5555");

        return orders;
    }

    public ArrayList<BuyerAdvertisement> getAllOrdersOfSeller(String aSellerId, String query, int currentPage) throws SQLException, ClassNotFoundException {

        System.out.println("3333");

        Connection con = DBConnection.getConnection();
//        String sql = "SELECT  *  FROM `orders` INNER JOIN `advertisements` ON orders.adId = advertisements.adId WHERE sellerId = ? AND advertisements.title LIKE ? LIMIT ?,?;";
        String sql = "SELECT advertisements.*, neworders.buyerId FROM neworders\n" + "INNER JOIN neworderpickups\n" + "ON neworders.orderId = neworderpickups.orderId\n" + "INNER JOIN newpickupsads\n" + "on neworderpickups.pickupId = newpickupsads.pickupId\n" + "INNER JOIN advertisements\n" + "ON newpickupsads.adId = advertisements.adId\n" + "WHERE neworderpickups.sellerId = ?\n" + "AND neworderpickups.status <> 0 AND advertisements.title LIKE ? LIMIT ?,?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aSellerId);
        stmt.setString(2,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(3,start);
        stmt.setInt(4,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<BuyerAdvertisement> buyerAdvertisements = new ArrayList<BuyerAdvertisement>();

        System.out.println("FROM SALES HISTORY DAO BEFORE WHILE LOOP");
        while(result.next()){

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

            Advertisement advertisement = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

            String buyerId = result.getString(14);

            Buyer buyer = new Buyer(buyerId);

            buyerAdvertisements.add(new BuyerAdvertisement(buyer, advertisement));
        }

        return buyerAdvertisements;
    }

    public int getAllOrdersOfSellerNumberOfRows(String username, String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM neworders INNER JOIN neworderpickups ON neworders.orderId = neworderpickups.orderId INNER JOIN newpickupsads on neworderpickups.pickupId = newpickupsads.pickupId INNER JOIN advertisements ON newpickupsads.adId = advertisements.adId WHERE neworderpickups.sellerId = ? AND neworderpickups.status <> 0 AND advertisements.title LIKE ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,username);
        stmt.setString(2,"%"+query+"%");
        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getInt(1);
        }
        else{
            return 0;
        }
    }

    public OrderAdCombined getOrderByIdForBuyer(int aOrderId, String aBuyerId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `orders` INNER JOIN `advertisements` ON orders.adId = advertisements.adId WHERE orders.orderId = ? AND orders.buyerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aOrderId);
        stmt.setString(2, aBuyerId);
        ResultSet result = stmt.executeQuery();

        if(result.next()) {
            int orderId = result.getInt(1);
            String buyerId = result.getString(2);
            int adId = result.getInt(3);
            boolean isDelivered = result.getBoolean(4);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//        int adId = result.getInt(5);
            String title = result.getString(6);
            String author = result.getString(7);
            int price = result.getInt(8);
            String isbn = result.getString(9);
            String language = result.getString(10);
            boolean available = result.getBoolean(11);
            String description = result.getString(12);
            String bookFrontPhoto = result.getString(13);
            String bookBackPhoto = result.getString(14);
            String category = result.getString(15);
            String sellerId = result.getString(16);
            Timestamp dateAdded = result.getTimestamp(17);

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

            OrderAdCombined orderAd = new OrderAdCombined(order, ad);

            System.out.println("5555");

            return orderAd;
        }
        else{
            return null;
        }

    }

    public OrderAdCombined getOrderByIdForSeller(int aOrderId, String aSellerId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `orders` INNER JOIN `advertisements` ON orders.adId = advertisements.adId WHERE orders.orderId = ? AND advertisements.sellerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aOrderId);
        stmt.setString(2, aSellerId);
        ResultSet result = stmt.executeQuery();

        if(result.next()) {
            int orderId = result.getInt(1);
            String buyerId = result.getString(2);
            int adId = result.getInt(3);
            boolean isDelivered = result.getBoolean(4);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//        int adId = result.getInt(5);
            String title = result.getString(6);
            String author = result.getString(7);
            int price = result.getInt(8);
            String isbn = result.getString(9);
            String language = result.getString(10);
            boolean available = result.getBoolean(11);
            String description = result.getString(12);
            String bookFrontPhoto = result.getString(13);
            String bookBackPhoto = result.getString(14);
            String category = result.getString(15);
            String sellerId = result.getString(16);
            Timestamp dateAdded = result.getTimestamp(17);

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

            OrderAdCombined orderAd = new OrderAdCombined(order, ad);

            System.out.println("5555");

            return orderAd;
        }
        else{
            return null;
        }

    }

    public void addOrder(Advertisement ad, String buyerId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

        String newOrderSQL = "INSERT INTO `orders` (buyerId, adId, isCompleted) VALUES (?,?,?);";
        PreparedStatement newOrderStmt = con.prepareStatement(newOrderSQL);

        newOrderStmt.setString(1, buyerId);
        newOrderStmt.setInt(2, (int) ad.getAdId());
        newOrderStmt.setBoolean(3, false);

        int result = newOrderStmt.executeUpdate();

    }


//    public ArrayList<OrderAdCombined> getSalesHistory(String sellerId) throws SQLException, ClassNotFoundException {
//
//
//        System.out.println("3333");
//
//        Connection con = DBConnection.getConnection();
//        String sql = "SELECT  *  FROM `orders` INNER JOIN `advertisements` ON orders.adId = advertisements.adId WHERE sellerId = ? AND isCompleted = true;";
//        PreparedStatement stmt = con.prepareStatement(sql);
//        stmt.setString(1, sellerId);
//        ResultSet result = stmt.executeQuery();
//
//        ArrayList<OrderAdCombined> orders = new ArrayList<OrderAdCombined>();
//
//        while(result.next()){
//
//            int orderId = result.getInt(1);
//            String buyerId = result.getString(2);
//            int adId = result.getInt(3);
//            boolean isDelivered = result.getBoolean(4);
//
//            Order ord = new Order(orderId, buyerId, adId, isDelivered);
//
//            //        int adId = result.getInt(5);
//            String title = result.getString(6);
//            String author = result.getString(7);
//            int price = result.getInt(8);
//            String isbn = result.getString(9);
//            String language = result.getString(10);
//            boolean available = result.getBoolean(11);
//            String description = result.getString(12);
//            String bookFrontPhoto = result.getString(13);
//            String bookBackPhoto = result.getString(14);
//            String category = result.getString(15);
////            String sellerId = result.getString(16);
//            Timestamp dateAdded = result.getTimestamp(17);
//
//            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);
//
//            orders.add(new OrderAdCombined(ord, ad));
//
//
//        }
//
//        System.out.println("5555");
//
//        return orders;
//    }

}
