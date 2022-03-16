package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.SellerApplications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SellerDAO {

    public void addSeller(String sellerAppId) throws SQLException, ClassNotFoundException {

        SellerApplicationDAO sellerAppDao = new SellerApplicationDAO();
        SellerApplications sellerApp = sellerAppDao.viewSellerApplicationById(sellerAppId);

        System.out.println("FROM SELLERDAO--->");
        System.out.println(sellerApp.getBuyerId());
        System.out.println(sellerApp.getNic());
        System.out.println(sellerApp.getNicPhotoFront());
        System.out.println(sellerApp.getNicPhotoBack());

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO `sellers`  (`username`,`nic`, `nicPhotoFront`, `nicPhotoBack`, `bankAccountNo`, `bankName`, `bankBranch`) VALUES (?,?,?,?,?,?,?);";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, sellerApp.getBuyerId());
        stmt.setString(2,sellerApp.getNic());
        stmt.setString(3,sellerApp.getNicPhotoFront());
        stmt.setString(4, sellerApp.getNicPhotoBack());

        stmt.setString(5,sellerApp.getBankAccountNo());
        stmt.setString(6,sellerApp.getBankName());
        stmt.setString(7, sellerApp.getBankBranch());

        int result = stmt.executeUpdate();
    }
}
