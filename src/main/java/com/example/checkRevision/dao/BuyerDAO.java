package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.model.SellerApplications;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class BuyerDAO {

    private ArrayList<String> result = new ArrayList<String>();

    public ArrayList<String> addBuyer(Buyer newBuyer) throws ClassNotFoundException, SQLException {
        if (!result.isEmpty()) return result;

        Connection con = DBConnection.getConnection();

        String userSQL = "INSERT INTO `users`  (`username`,`password`, `userType`, `dateJoined`, `salt`, `verified`) VALUES (?,?,?,?,?,?);";
        String buyerSQL = "INSERT INTO `buyers`  (`username`, `firstName`, `lastName`, `houseNo`, `street`, `city`, `district`, `province`, `sellerApplied`, `phoneNo`, `email`) VALUES (?,?,?,?,?,?,?,?,?,?,?);";

        PreparedStatement userStmt = con.prepareStatement(userSQL);
        userStmt.setString(1,newBuyer.getUsername());
        userStmt.setString(2,newBuyer.getPassword());
        userStmt.setString(3,newBuyer.getUserType());
        userStmt.setTimestamp(4,newBuyer.getDateJoined());
        userStmt.setInt(5,newBuyer.getSalt());
        userStmt.setBoolean(6, false);

        PreparedStatement buyerStmt = con.prepareStatement(buyerSQL);

        buyerStmt.setString(1,newBuyer.getUsername());
        buyerStmt.setString(2,newBuyer.getFirstName());
        buyerStmt.setString(3, newBuyer.getLastName());
        buyerStmt.setString(4,newBuyer.getHouseNo());
        buyerStmt.setString(5, newBuyer.getStreet());
        buyerStmt.setString(6,newBuyer.getCity());
        buyerStmt.setString(7, newBuyer.getDistrict());
        buyerStmt.setString(8,newBuyer.getProvince());
        buyerStmt.setBoolean(9, newBuyer.isSellerApplied());
        buyerStmt.setString(10,newBuyer.getPhoneNo());
        buyerStmt.setString(11,newBuyer.getEmail());

        int userResult = userStmt.executeUpdate();
        int buyerResult = buyerStmt.executeUpdate();

        return result;

    }

    public ArrayList<Buyer> getAllBuyers(String query, int currentPage) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users INNER JOIN buyers ON users.username = buyers.username WHERE (`firstName` LIKE ? OR `lastName` LIKE ?) LIMIT ?,?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(3,start);
        stmt.setInt(4,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<Buyer> allBuyers = new ArrayList<>();

        while(result.next()){

            String username = result.getString(1);
            String password = result.getString(2);
            String userType = result.getString(3);
            int salt = result.getInt(4);
            Timestamp dateJoined = result.getTimestamp(5);
//            String username = result.getString(6);
            String firstName = result.getString(7);
            String lastName = result.getString(8);
            String houseNo = result.getString(9);
            String street = result.getString(10);
            String city = result.getString(11);
            String district = result.getString(12);
            String province = result.getString(13);
            boolean sellerApplied = result.getBoolean(14);
            String phoneNo = result.getString(15);
            String email = result.getString(16);

            allBuyers.add(new Buyer(username, password, userType, salt, dateJoined, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email));

        }
        return allBuyers;
    }

    public void applySeller(String buyerId, Part nicFrontPhoto, Part nicBackPhoto, String nicNo, String bankAccountNo, String bankName, String bankBranch) throws SQLException, ClassNotFoundException, IOException {
        Connection con = DBConnection.getConnection();
        String alreadyAppliedSQL = "SELECT `sellerApplied` FROM `buyers` WHERE `username` = ?;";
        PreparedStatement alreadyAppliedStmt = con.prepareStatement(alreadyAppliedSQL);
        alreadyAppliedStmt.setString(1, buyerId);

        ResultSet result = alreadyAppliedStmt.executeQuery();
        result.next();


//        check if already applied
        if(result.getBoolean(1)){
            System.out.println("Already applied");
            return;
        }
        else{
            String nicPhotoFrontURL = buyerId + java.util.UUID.randomUUID() + ".jpg";
            String nicPhotoBackURL = buyerId + java.util.UUID.randomUUID() + ".jpg";

            String updateSQL =  "UPDATE `buyers` SET `sellerApplied` = ? WHERE `username` = ?;";
            PreparedStatement updateStmt = con.prepareStatement(updateSQL);
            updateStmt.setBoolean(1, true);
            updateStmt.setString(2, buyerId);
            int updateResult = updateStmt.executeUpdate();

            MyFileHandler saveFile = new MyFileHandler();
            saveFile.saveNicPhotos(nicFrontPhoto, nicBackPhoto, nicPhotoFrontURL, nicPhotoBackURL);

            SellerApplications sellerApp = new SellerApplications("", "",buyerId, nicNo, nicPhotoFrontURL, nicPhotoBackURL, false, false, bankAccountNo, bankName, bankBranch);

//            Have to add to SellerApplications table using sellAppDAO
            SellerApplicationDAO sellerApplicationDAO = new SellerApplicationDAO();
            sellerApplicationDAO.addSellerApplication(sellerApp);

        }


    }

    public boolean isEmailExist(String uname) throws ClassNotFoundException, SQLException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM buyers WHERE email=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,uname);
        ResultSet result = stmt.executeQuery();

        return result.next();
    }

    public int getNumberOfRows(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM `users` INNER JOIN `buyers` ON users.username = buyers.username WHERE (`firstName` LIKE ? OR `lastName` LIKE ?);";
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

    public String getEmail(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT `email` FROM `buyers` WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);

        ResultSet result = stmt.executeQuery();
        result.next();
        String email = result.getString(1);
        return email;
    }
}
