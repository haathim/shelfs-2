package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.*;
import com.example.checkRevision.variables.MyVariables;

import java.sql.*;
import java.util.ArrayList;

public class PendingJobsDAO {

    public ArrayList<PenDelOrderCombined> getUnacceptedJobs(String query, int currentPage) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username WHERE acceptedByDeliverer = false AND pendingJobs.`seller-province` LIKE ? LIMIT ?, ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
//        stmt.setString(2,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(2,start);
        stmt.setInt(3,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<PenDelOrderCombined> penDelOrders = new ArrayList<PenDelOrderCombined>();

        while(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);

            Buyer buyer = new Buyer(buyerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

            //            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            penDelOrders.add(new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement));

        }

        return  penDelOrders;
    }

    public int getUnacceptedJobsNumberOfRows(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username WHERE acceptedByDeliverer = false AND pendingJobs.`seller-province` LIKE ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getInt(1);
        }
        else{
            return 0;
        }
    }

    public PenDelOrderCombined getUnacceptedJobsDetails(int aOrderId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username WHERE acceptedByDeliverer = false AND pendingJobs.orderId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aOrderId);
        ResultSet result = stmt.executeQuery();

        if(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);

            Buyer buyer = new Buyer(buyerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

//            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            return new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement);

        }
        else{
            return  null;
        }


    }

    public ArrayList<PenDelOrderCombined> getPendingPickupsOfDeliverer(String aDeliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username WHERE acceptedByDeliverer = true AND pendingJobs.deliverer = ? AND pendingJobs.isPickedup = false;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aDeliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<PenDelOrderCombined> penDelOrders = new ArrayList<PenDelOrderCombined>();

        while(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);

            Buyer buyer = new Buyer(buyerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

            //            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            penDelOrders.add(new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement));

        }

        return  penDelOrders;
    }

    public ArrayList<PenDelOrderCombined> getPendingDeliveriesOfDeliverer(String aDeliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username  WHERE acceptedByDeliverer = true AND pendingJobs.deliverer = ? AND pendingJobs.isPickedup = true AND pendingJobs.isDelivered = false;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aDeliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<PenDelOrderCombined> penDelOrders = new ArrayList<PenDelOrderCombined>();

        while(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);


            Buyer buyer = new Buyer(buyerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

            //            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            penDelOrders.add(new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement));

        }

        return  penDelOrders;
    }

    public PenDelOrderCombined getAcceptedJobsDetails(int aOrderId, String aDeliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username WHERE acceptedByDeliverer = true AND pendingJobs.orderId = ? AND deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aOrderId);
        stmt.setString(2, aDeliverer);
        ResultSet result = stmt.executeQuery();

        if(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);


            Buyer buyer = new Buyer(buyerId, "", "",-1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

            //            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            return new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement);

        }
        else{
            return  null;
        }


    }

    public void acceptJob(int orderId, String deliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `pendingJobs` SET `acceptedByDeliverer` = ? , `deliverer` = ? WHERE `orderId` = ? AND acceptedByDeliverer = false ;";
        PreparedStatement updateStmt = con.prepareStatement(sql);
        updateStmt.setBoolean(1, true);
        updateStmt.setString(2, deliverer);
        updateStmt.setInt(3, orderId);
        int updateResult = updateStmt.executeUpdate();

    }

    public void updatePickup(int orderId, String deliverer) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "UPDATE pendingJobs SET isPickedup = true WHERE orderId = ? AND deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        stmt.setString(2, deliverer);
        stmt.executeUpdate();
    }

    public void updateDelivery(int orderId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE pendingJobs SET isDelivered = true WHERE isPickedup = true AND orderId = ? AND deliverer = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderId);
        stmt.setString(2, deliverer);
        stmt.executeUpdate();
    }

    public ArrayList<PenDelOrderCombined> getDeliveryHistoryJobs(String aDeliverer, String query, int currentPage) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username  WHERE acceptedByDeliverer = true AND pendingJobs.deliverer = ? AND pendingJobs.isPickedup = true AND pendingJobs.isDelivered = true;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aDeliverer);
        ResultSet result = stmt.executeQuery();

        ArrayList<PenDelOrderCombined> penDelOrders = new ArrayList<PenDelOrderCombined>();

        while(result.next()){

            int orderId = result.getInt(1);

            String sellerHouseNo = result.getString(2);
            String sellerStreet = result.getString(3);
            String sellerCity = result.getString(4);
            String sellerDistrict = result.getString(5);
            String sellerProvince = result.getString(6);

            String buyerHouseNo = result.getString(7);
            String buyerStreet = result.getString(8);
            String buyerCity = result.getString(9);
            String buyerDistrict = result.getString(10);
            String buyerProvince = result.getString(11);

            boolean acceptedByDeliverer = result.getBoolean(12);
            String deliverer = result.getString(13);
            boolean isPickedUp = result.getBoolean(14);
            boolean isDelivered = result.getBoolean(15);

            PendingJob pendingJob = new PendingJob(orderId, sellerHouseNo, sellerStreet, sellerCity, sellerDistrict, sellerProvince, buyerHouseNo, buyerStreet, buyerCity, buyerDistrict, buyerProvince, acceptedByDeliverer, "", isPickedUp, isDelivered);

//            int orderId = result.getInt(16);
            String buyerId = result.getString(17);
            int adId = result.getInt(18);
            boolean isCompleted = result.getBoolean(19);

            Order order = new Order(orderId, buyerId, adId, isDelivered);

//            String buyerId = result.getString(20);
            String buyerFirstName = result.getString(21);
            String buyerLastName = result.getString(22);
//            String houseNo = result.getString(23);
//            String street = result.getString(24);
//            String city = result.getString(25);
//            String district = result.getString(26);
//            String province = result.getString(27);
            boolean sellerApplied = result.getBoolean(28);
            String buyerPhoneNo = result.getString(29);
            String buyerEmail = result.getString(30);


            Buyer buyer = new Buyer(buyerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", false, buyerPhoneNo, buyerEmail);

            //            int adId = result.getInt(31);
            String title = result.getString(32);
            String author = result.getString(33);
            int price = result.getInt(34);
            String isbn = result.getString(35);
            String language = result.getString(36);
            int available = result.getInt(37);
            String description = result.getString(38);
            String bookFrontPhoto = result.getString(39);
            String bookBackPhoto = result.getString(40);
            String category = result.getString(41);
            String sellerId = result.getString(42);
            Timestamp dateAdded = result.getTimestamp(43);

            Advertisement advertisement =  new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

//            String sellerId = result.getString(44);
            String sellerFirstName = result.getString(45);
            String sellerLastName = result.getString(46);
//            String houseNo = result.getString(47);
//            String street = result.getString(48);
//            String city = result.getString(49);
//            String district = result.getString(50);
//            String province = result.getString(51);
//            boolean sellerApplied = result.getBoolean(52);
            String sellerPhoneNo = result.getString(53);
            String sellerEmail = result.getString(54);

            Buyer seller = new Buyer(sellerId, "", "", -1, null, buyerFirstName, buyerLastName, "", "", "", "", "", true, sellerPhoneNo, sellerEmail);

            penDelOrders.add(new PenDelOrderCombined(pendingJob, order, buyer, seller, advertisement));

        }

        return  penDelOrders;
    }

    public int getDeliveryHistoryJobsNumberOfRows(String aDeliverer, String query) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM pendingJobs INNER JOIN orders ON pendingJobs.orderId = orders.orderId INNER JOIN buyers AS buyerDetails ON orders.buyerId = buyerDetails.username INNER JOIN advertisements ON orders.adId = advertisements.adId INNER JOIN buyers AS sellerDetails ON advertisements.sellerId = sellerDetails.username  WHERE acceptedByDeliverer = true AND pendingJobs.deliverer = ? AND pendingJobs.isPickedup = true AND pendingJobs.isDelivered = true AND (pendingJobs.`buyer-province` LIKE ? OR pendingJobs.`seller-province` LIKE ?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aDeliverer);
        stmt.setString(2,"%"+query+"%");
        stmt.setString(3,"%"+query+"%");

        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getInt(1);
        }
        else{
            return 0;
        }
    }
}
