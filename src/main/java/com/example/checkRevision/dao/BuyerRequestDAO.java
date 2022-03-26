package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.BuyerRequest;
import com.example.checkRevision.model.Order;
import com.example.checkRevision.model.OrderAdCombined;
import com.example.checkRevision.variables.MyVariables;

import java.sql.*;
import java.util.ArrayList;

public class BuyerRequestDAO {
    public BuyerRequestDAO() {
    }

    public int addBuyerRequest(BuyerRequest buyerRequest) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        System.out.println("Error - 9");

        String newBuyReqSQL = "INSERT INTO `buyerRequests` (`title`, `author`, `date`, `buyerId`, `category`, `comment`, `preferredPrice`) VALUES (?,?,?,?,?,?,?);";
        PreparedStatement newAdStmt = con.prepareStatement(newBuyReqSQL);

        System.out.println("Error - 10");

        newAdStmt.setString(1, buyerRequest.getTitle());
        newAdStmt.setString(2, buyerRequest.getAuthor());
        newAdStmt.setTimestamp(3, buyerRequest.getDate());
        newAdStmt.setString(4, buyerRequest.getBuyerId());
        newAdStmt.setString(5, buyerRequest.getCategory());
        newAdStmt.setString(6, buyerRequest.getComment());
        newAdStmt.setInt(7, buyerRequest.getPreferredPrice());

        System.out.println("Error - 2");

        int userResult = newAdStmt.executeUpdate();

        System.out.println("Error - 1111");

        return userResult;

        //Get adId of new Ad
//        String getAdIdSQL = "SELECT * FROM `advertisements` WHERE `sellerId` = ? ORDER BY `dateAdded` DESC;";
//        PreparedStatement getAdIdStmt = con.prepareStatement(getAdIdSQL);
//        getAdIdStmt.setString(1, newAd.getSellerId());
//        System.out.println("Error - 112");
//        ResultSet result = getAdIdStmt.executeQuery();
//        System.out.println("Error - 113");
//        result.next();
//        int adId = result.getInt(1);
//
//        System.out.println("Error - 3");

        //save book Images
//        MyFileHandler saveFile = new MyFileHandler();
//        saveFile.saveBookPhotos(bookPhotoFront, bookPhotoBack, adId);
//
//        System.out.println("Error - 4");

        //update value for url in db
//        String port = MyVariables.port;
//        String bookPhotoFrontURL = "http://localhost:"+port+"/checkRevision_war_exploded/uploads/bookPhotoFront/"+adId+".jpg";
//        String bookPhotoBackURL = "http://localhost:"+port+"/checkRevision_war_exploded/uploads/bookPhotoBack/"+adId+".jpg";
//
//        String updateBookImageSQL = "UPDATE `advertisements` SET `bookFrontPhoto` = ?, `bookBackPhoto` = ? WHERE `adId` = ?;";
//        PreparedStatement updateStmt = con.prepareStatement(updateBookImageSQL);
//
//        updateStmt.setString(1, bookPhotoFrontURL);
//        updateStmt.setString(2, bookPhotoBackURL);
//        updateStmt.setInt(3, adId);

//        int updateResult = updateStmt.executeUpdate();
    }

    public ArrayList<BuyerRequest> getAllBuyerRequests(String query, int currentPage) throws SQLException, ClassNotFoundException {
        System.out.println("3333");

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `buyerRequests` WHERE (buyerRequests.title LIKE ? OR buyerRequests.author LIKE ?) LIMIT ?, ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");

        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(3,start);
        stmt.setInt(4,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<BuyerRequest> buyReqs = new ArrayList<BuyerRequest>();

        while(result.next()){

            int requestId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);

            Timestamp date = result.getTimestamp(4);
            String buyerId = result.getString(5);
            String category = result.getString(6);
            String comment = result.getString(7);
            int preferredPrice = result.getInt(8);

            buyReqs.add(new BuyerRequest(requestId,buyerId, title, author, date, category, comment, preferredPrice));

        }

        System.out.println("5555");

        return buyReqs;
    }

    public int getAllBuyerRequestsNumberOfRows(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM `buyerRequests` WHERE (buyerRequests.title LIKE ? OR buyerRequests.author LIKE ?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");
        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getInt(1);
        }
        else{
            return 0;
        }
    }

    public BuyerRequest getBuyerRequestById(int buyReqId) throws SQLException, ClassNotFoundException {


        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `buyerRequests` WHERE `requestId` = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, buyReqId);
        ResultSet result = stmt.executeQuery();

        System.out.println("4444");

        if(result.next()) {

            int requestId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);
            Timestamp date = result.getTimestamp(4);
            String buyerId = result.getString(5);
            String category = result.getString(6);
            String comment = result.getString(7);
            int preferredPrice = result.getInt(8);

            BuyerRequest buyReq = new BuyerRequest(requestId, buyerId, title, author, date, category, comment, preferredPrice);


            System.out.println("5555");

            return buyReq;
        }
        else {
            return null;
        }
    }


    public void updateBuyerRequest(BuyerRequest buyerRequest) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `buyerRequests` SET title = ?, author = ?, date = ?, category = ?, comment = ?, preferredPrice = ? WHERE buyerID = ? AND requestId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerRequest.getTitle());
        stmt.setString(2, buyerRequest.getAuthor());
        stmt.setTimestamp(3, buyerRequest.getDate());
        stmt.setString(4, buyerRequest.getCategory());
        stmt.setString(5, buyerRequest.getComment());
        stmt.setInt(6, buyerRequest.getPreferredPrice());
        stmt.setString(7, buyerRequest.getBuyerId());
        stmt.setInt(8, (int) buyerRequest.getRequestId());

        stmt.executeUpdate();

    }

    public ArrayList<BuyerRequest> getBuyerRequestsOfBuyer(String aBuyerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `buyerRequests` WHERE buyerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1,aBuyerId);

        ResultSet result = stmt.executeQuery();

        ArrayList<BuyerRequest> buyReqs = new ArrayList<BuyerRequest>();

        while(result.next()){

            int requestId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);

            Timestamp date = result.getTimestamp(4);
            String buyerId = result.getString(5);
            String category = result.getString(6);
            String comment = result.getString(7);
            int preferredPrice = result.getInt(8);

            buyReqs.add(new BuyerRequest(requestId,buyerId, title, author, date, category, comment, preferredPrice));

        }

        System.out.println("5555");

        return buyReqs;
    }

    public BuyerRequest getBuyerRequestByIdOfBuyer(String aBuyerId, int buyerRequestId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `buyerRequests` WHERE `requestId` = ? AND `buyerId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, buyerRequestId);
        stmt.setString(2, aBuyerId);
        ResultSet result = stmt.executeQuery();

        if(result.next()) {

            int requestId = result.getInt(1);
            String title = result.getString(2);
            String author = result.getString(3);
            Timestamp date = result.getTimestamp(4);
            String buyerId = result.getString(5);
            String category = result.getString(6);
            String comment = result.getString(7);
            int preferredPrice = result.getInt(8);

            BuyerRequest buyReq = new BuyerRequest(requestId, buyerId, title, author, date, category, comment, preferredPrice);

            return buyReq;
        }
        else {
            return null;
        }
    }

    public void removeBuyerRequestByBuyer(String buyerId, int buyerRequestId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM `buyerRequests` WHERE buyerID = ? AND requestId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        stmt.setInt(2, buyerRequestId);


        stmt.executeUpdate();
    }
}
