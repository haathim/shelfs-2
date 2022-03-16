package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;

import com.example.checkRevision.model.SellerApplications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellerApplicationDAO {

    public SellerApplicationDAO() {
    }
    public boolean isSellerApplied(String buyerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT sellerApplied FROM `buyers` WHERE username = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        ResultSet result = stmt.executeQuery();
        result.next();
        return result.getBoolean(1);

    }
    public void addSellerApplication(SellerApplications sellApp) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String addSellerAppSQL = "INSERT INTO `sellerApplications`  (`buyerId`,`nic`, `nicPhotoFront`, `nicPhotoBack`, `isAccepted`, `isRejected`, `bankAccountNo`, `bankName`, `bankBranch`) VALUES (?,?,?,?,?,?,?,?,?);";
        PreparedStatement addSellerAppStmt = con.prepareStatement(addSellerAppSQL);

        System.out.println(sellApp.getBuyerId());
        System.out.println(sellApp.getNic());
        System.out.println(sellApp.getNicPhotoFront());
        System.out.println(sellApp.getNicPhotoBack());
        System.out.println(sellApp.isAccepted());
        System.out.println(sellApp.isRejected());

        addSellerAppStmt.setString(1, sellApp.getBuyerId());
        addSellerAppStmt.setString(2,sellApp.getNic());
        addSellerAppStmt.setString(3,sellApp.getNicPhotoFrontForSaveInDB());
        addSellerAppStmt.setString(4, sellApp.getNicPhotoBackForSaveInDB());
        addSellerAppStmt.setBoolean(5, sellApp.isAccepted());
        addSellerAppStmt.setBoolean(6, sellApp.isRejected());

        addSellerAppStmt.setString(7,sellApp.getBankAccountNo());
        addSellerAppStmt.setString(8,sellApp.getBankName());
        addSellerAppStmt.setString(9, sellApp.getBankBranch());

        int result = addSellerAppStmt.executeUpdate();

    }

    public ArrayList<SellerApplications> viewAllSellerApplications() throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `sellerApplications` INNER JOIN `buyers`ON sellerApplications.buyerId = buyers.username WHERE `isAccepted` = false AND `isRejected` = false;";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        ArrayList<SellerApplications> sellerApplications = new ArrayList<SellerApplications>();

        while(result.next()){

            String buyerId = result.getString(1);
            String nic = result.getString(2);
            String nicPhotoFront = result.getString(3);
            String nicPhotoBack = result.getString(4);
            boolean isAccepted = result.getBoolean(5);
            boolean isRejected = result.getBoolean(6);
            String bankAccountNo = result.getString(7);
            String bankName = result.getString(8);
            String bankBranch = result.getString(9);


            String buyerFirstName = result.getString(11);
            String buyerLastName = result.getString(12);
            sellerApplications.add(new SellerApplications(buyerFirstName, buyerLastName, buyerId, nic, nicPhotoFront, nicPhotoBack, isAccepted, isRejected, bankAccountNo, bankName, bankBranch));

        }

        return sellerApplications;
    }

    public SellerApplications viewSellerApplicationById(String sellAppId) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT  * FROM `sellerApplications` INNER JOIN `buyers`ON sellerApplications.buyerId = buyers.username WHERE `buyerId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, sellAppId);
        ResultSet result = stmt.executeQuery();


        if (result.next()){

            String buyerId = result.getString(1);
            String nic = result.getString(2);
            String nicPhotoFront = result.getString(3);
            String nicPhotoBack = result.getString(4);
            boolean isAccepted = result.getBoolean(5);
            boolean isRejected = result.getBoolean(6);
            String bankAccountNo = result.getString(7);
            String bankName = result.getString(8);
            String bankBranch = result.getString(9);


            String buyerFirstName = result.getString(11);
            String buyerLastName = result.getString(12);
            return new SellerApplications(buyerFirstName, buyerLastName, buyerId, nic, nicPhotoFront, nicPhotoBack, isAccepted, isRejected, bankAccountNo, bankName, bankBranch);

        }
        else {
            return null;
        }

    }

    public void respondApplication(String sellerAppId, boolean isAccepted) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `sellerApplications` SET `isAccepted` = ? AND `isRejected` = ? WHERE `buyerId` = ?;";
        PreparedStatement updateStmt = con.prepareStatement(sql);
        updateStmt.setBoolean(1, isAccepted);
        updateStmt.setBoolean(2, !isAccepted);
        updateStmt.setString(3, sellerAppId);
        int updateResult = updateStmt.executeUpdate();

    }
}
