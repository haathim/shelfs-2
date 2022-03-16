package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class AdvertisementDAO {
    public AdvertisementDAO() {
    }

    public void addAdvertisement(Advertisement newAd, Part bookPhotoFront, Part bookPhotoBack) throws SQLException, ClassNotFoundException, IOException {
        Connection con = DBConnection.getConnection();
        System.out.println("Error - 9");
        //Add advertisement to database without adding bookImage URLs
        String newAdSQL = "INSERT INTO `advertisements` (`title`, `author`, `price`, `ISBN`, `language`, `availableStatus`, `description`, `bookFrontPhoto`, `bookBackPhoto`, `category`, `sellerId`, `dateAdded`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement newAdStmt = con.prepareStatement(newAdSQL);
        System.out.println("Error - 10");
        newAdStmt.setString(1, newAd.getTitle());
        newAdStmt.setString(2, newAd.getAuthor());
        newAdStmt.setInt(3, (int) (newAd.getPrice()*1.1));
        newAdStmt.setString(4, newAd.getIsbn());
        newAdStmt.setString(5, newAd.getLanguage());
        newAdStmt.setBoolean(6, newAd.isAvailable());
        newAdStmt.setString(7, newAd.getDescription());
        newAdStmt.setString(8, "");
        newAdStmt.setString(9, "");
        newAdStmt.setString(10, newAd.getCategory());
        newAdStmt.setString(11, newAd.getSellerId());
        newAdStmt.setTimestamp(12, newAd.getDateAdded());
        System.out.println("Error - 2");
        int userResult = newAdStmt.executeUpdate();
        System.out.println("Error - 1111");

        //Get adId of new Ad
        String getAdIdSQL = "SELECT * FROM `advertisements` WHERE `sellerId` = ? ORDER BY `dateAdded` DESC;";
        PreparedStatement getAdIdStmt = con.prepareStatement(getAdIdSQL);
        getAdIdStmt.setString(1, newAd.getSellerId());
        System.out.println("Error - 112");
        ResultSet result = getAdIdStmt.executeQuery();
        System.out.println("Error - 113");
        result.next();
        int adId = result.getInt(1);

        System.out.println("Ad ID is " + adId);

        System.out.println("Error - 3");

        //save book Images
        MyFileHandler saveFile = new MyFileHandler();
        saveFile.saveBookPhotos(bookPhotoFront, bookPhotoBack, adId);

        System.out.println("Error - 4");

        //update value for url in db
        String port = MyVariables.port;
        String bookPhotoFrontURL = adId+".jpg";
        String bookPhotoBackURL = adId+".jpg";

        String updateBookImageSQL = "UPDATE `advertisements` SET `bookFrontPhoto` = ?, `bookBackPhoto` = ? WHERE `adId` = ?;";
        PreparedStatement updateStmt = con.prepareStatement(updateBookImageSQL);

        updateStmt.setString(1, bookPhotoFrontURL);
        updateStmt.setString(2, bookPhotoBackURL);
        updateStmt.setInt(3, adId);

        int updateResult = updateStmt.executeUpdate();
        System.out.println("Error - 987654321");



    }

    public ArrayList<Advertisement> viewAdvertisements(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE (`title` LIKE ? OR `author` LIKE ?) AND `availableStatus` = true;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();

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

            ads.add(new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded));
        }

        return ads;
    }

    public ArrayList<Advertisement> viewAdvertisementsPage(String query, int currentPage) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE (`title` LIKE ? OR `author` LIKE ?) AND `availableStatus` = true LIMIT ?,?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(3,start);
        stmt.setInt(4,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();

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

            ads.add(new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded));
        }

        return ads;
    }

    public int getNumberOfRows(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM `advertisements` WHERE (`title` LIKE ? OR `author` LIKE ?) AND `availableStatus` = true;";
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

    public ArrayList<Advertisement> getAdsByCategory(String aCategory) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE `category` = ? AND `availableStatus` = true ORDER BY `dateAdded` DESC ;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,aCategory);
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

    public Advertisement getAdById(int queryAdId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE `adId` = ? ;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, queryAdId);
        ResultSet result = stmt.executeQuery();

        if(result.next()) {
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

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);
            return ad;
        }
        else{
            System.out.println("RETURNING NULL....");
            return null;
        }
    }

    public ArrayList<Advertisement> getPostedAds(String aSellerId, String query, int currentPage) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE `sellerId` = ? AND `availableStatus` = true AND advertisements.title LIKE ? LIMIT ?,?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aSellerId);
        stmt.setString(2,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(3,start);
        stmt.setInt(4,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<Advertisement> ads = new ArrayList<Advertisement>();

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

            ads.add(new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded));
        }

        return ads;
    }

    public int getPostedAdsNumberOfRows(String sellerId, String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM `advertisements` WHERE `sellerId` = ? AND `availableStatus` = true AND advertisements.title LIKE ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,sellerId);
        stmt.setString(2,"%"+query+"%");
        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getInt(1);
        }
        else{
            return 0;
        }
    }

    public Advertisement getPostedAdByIdForSeller(int aAdId, String aSellerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `advertisements` WHERE `adId` = ? AND `sellerId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aAdId);
        stmt.setString(2, aSellerId);
        ResultSet result = stmt.executeQuery();

        if(result.next()) {
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

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);
            return ad;
        }
        else{
            System.out.println("RETURNING NULL....");
            return null;
        }
    }

    public void deletePostedAdByIdForSeller(int aAdId, String aSellerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM `advertisements` WHERE `adId` = ? AND `sellerId` = ?;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aAdId);
        stmt.setString(2, aSellerId);
        stmt.executeUpdate();
    }


    public void makeUnavailable(Advertisement ad) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `advertisements` SET `availableStatus` = ? WHERE `adId` = ?;";


        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setBoolean(1, false);
        stmt.setInt(2, (int) ad.getAdId());
        stmt.executeUpdate();

    }
}
