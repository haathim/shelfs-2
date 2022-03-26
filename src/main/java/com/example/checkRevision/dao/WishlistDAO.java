package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Wishlist;

import java.sql.*;
import java.util.ArrayList;

public class WishlistDAO {
    public WishlistDAO() {
    }

    public ArrayList<Advertisement> getWishlist(String username) throws SQLException, ClassNotFoundException {

        System.out.println("3333");

        Connection con = DBConnection.getConnection();
//        String sql = "SELECT * FROM `wishlist` WHERE `buyerId` = ?;";
        String sql = "SELECT  * FROM wishlist INNER JOIN advertisements ON wishlist.adId = advertisements.adId WHERE wishlist.buyerId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet result = stmt.executeQuery();

        System.out.println("4444");

        ArrayList<Advertisement> wishlistAds = new ArrayList<Advertisement>();

        while(result.next()){

            int adId = result.getInt(5);
            String title = result.getString(6);
            String author = result.getString(7);
            int price = result.getInt(8);
            String isbn = result.getString(9);
            String language = result.getString(10);
            int available = result.getInt(11);
            String description = result.getString(12);
            String bookFrontPhoto = result.getString(13);
            String bookBackPhoto = result.getString(14);
            String category = result.getString(15);
            String sellerId = result.getString(16);
            Timestamp dateAdded = result.getTimestamp(17);

            Advertisement ad = new Advertisement(adId, sellerId, title, author, price, isbn, language, available, description, bookFrontPhoto, bookBackPhoto, category, dateAdded);

            wishlistAds.add(ad);

        }

        System.out.println("5555");

        return wishlistAds;
    }

    public void addToWishlist(String username, int adId) throws SQLException, ClassNotFoundException{
        Connection con = DBConnection.getConnection();
          String sql = "INSERT INTO `wishlist` (`adId`, `buyerId`) VALUES (?,?);";
          PreparedStatement wishliststmt = con.prepareStatement(sql);
          wishliststmt.setInt(1, adId);
          wishliststmt.setString(2, username);
          wishliststmt.executeUpdate();
    }

    public void removeFromWishlist(int adId, String username) throws SQLException, ClassNotFoundException{
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM `wishlist` WHERE `adId` = ? AND `buyerId`=?;";
        PreparedStatement wishliststmt = con.prepareStatement(sql);
        wishliststmt.setInt(1, adId);
        wishliststmt.setString(2, username);
        wishliststmt.executeUpdate();
    }
}
