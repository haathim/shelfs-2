package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.User;
import com.example.checkRevision.variables.MyVariables;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {

    public int isWho(String uname, String pass) throws ClassNotFoundException, SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users WHERE username=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,uname);
        ResultSet result = stmt.executeQuery();


        if(result.next()){
            int salt = result.getInt("salt");
            if (!result.getString("password").equals(MyVariables.doHash(pass+salt))){
               return 0;
            }

//            check if verified
            if (!result.getBoolean("verified")){
                return 5;
            }

            switch (result.getString("userType")) {
                case "admin":
                    return 1;
                case "buyer":
                    return 2;
                case "seller":
                    return 3;
                case "delivery":
                    return 4;
                case "deleted":
                    return 0;

            }
        }

        return 0;
    }

    public boolean isUsernameExist(String uname) throws ClassNotFoundException, SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users WHERE username=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,uname);
        ResultSet result = stmt.executeQuery();

        return result.next();
    }

    public void changeToSeller(String sellerAppId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `users` SET `userType` = 'seller' WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, sellerAppId);
        int updateResult = stmt.executeUpdate();
    }

    public void changePassword(String username, String newPassword) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `users` SET `password` = ?, `salt` = ? WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

//        get new salt value
        int salt = MyVariables.getRandomSalt();

        stmt.setString(1, MyVariables.doHash(newPassword+salt));
        stmt.setInt(2, salt);
        stmt.setString(3, username);

        int updateResult = stmt.executeUpdate();
    }

    public void verifyAccount(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `users` SET `verified` = true WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);
        int updateResult = stmt.executeUpdate();
    }

    public boolean isVerified(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `verified` FROM users WHERE username=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,username);
        ResultSet result = stmt.executeQuery();
        if(result.next()){
            boolean isVerified = result.getBoolean(1);
            System.out.println("Account is verified ? : " + isVerified);
            return isVerified;
        }else{
//            not sure about this pls check
            return false;
        }



    }

    public int isWhatType(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users WHERE username=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,username);
        ResultSet result = stmt.executeQuery();

        if (result.next()){
            switch (result.getString("userType")) {
                case "buyer":
                    return 2;
                case "seller":
                    return 3;
                default:
                    return 0;

            }
        }
        return 0;
    }
}
