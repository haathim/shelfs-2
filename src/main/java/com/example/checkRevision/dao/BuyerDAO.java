package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.model.Seller;
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
    public Buyer getBuyer(String usernamex) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `buyers`  WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, usernamex);
        ResultSet result = stmt.executeQuery();
        System.out.println("Outside");
        if(result.next()){
            System.out.println("Inside if");
            String username = result.getString(1);
            String firstname = result.getString(2);
            String lastname = result.getString(3);
            String houseNo = result.getString(4);
            String street = result.getString(5);
            String city = result.getString(6);
            String district = result.getString(7);
            String province = result.getString(8);
            String phoneNo = result.getString(10);
            String email = result.getString(11);
            System.out.println(email);

            Buyer buyer = new Buyer(username, "", "", 0, null, firstname, lastname, houseNo, street, city, district, province, false, phoneNo, email);
            return buyer;

        }else{
            System.out.println("Inside else");
            return null;
        }
    }

    public void updateBuyer(String username, String houseNo, String street, String city, String phoneNo, String district) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `buyers` SET `houseNo` = ?, `street` =?, `city`=?, `phoneNo`=?, `district`=?  WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, houseNo);
        stmt.setString(2, street);
        stmt.setString(3, city);
        stmt.setString(4, phoneNo);
        stmt.setString(5, district);
        stmt.setString(6, username);
        stmt.executeUpdate();

    }

    public Buyer getBuyer(String usernamex) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT buyers.*, users.userType FROM `buyers` INNER JOIN `users` ON users.username = buyers.username WHERE buyers.username = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, usernamex);
        ResultSet result = stmt.executeQuery();
        System.out.println("Outside");
        if(result.next()){
            System.out.println("Inside if");
            String username = result.getString(1);
            String firstname = result.getString(2);
            String lastname = result.getString(3);
            String houseNo = result.getString(4);
            String street = result.getString(5);
            String city = result.getString(6);
            String district = result.getString(7);
            String province = result.getString(8);
            String phoneNo = result.getString(10);
            String email = result.getString(11);
            String userType = result.getString(12);
            System.out.println(email);

            Buyer buyer = new Buyer(username, "", userType, 0, null, firstname, lastname, houseNo, street, city, district, province, false, phoneNo, email);
            return buyer;

        }else{
            System.out.println("Inside else");
            return null;
        }
    }

    public void updateBuyer(String username, String houseNo, String street, String city, String phoneNo, String district, String province) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `buyers` SET `houseNo` = ?, `street` =?, `city`=?, `phoneNo`=? , district = ?, province = ? WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, houseNo);
        stmt.setString(2, street);
        stmt.setString(3, city);
        stmt.setString(4, phoneNo);
        stmt.setString(5, district);
        stmt.setString(6, province);
        stmt.setString(7, username);

        stmt.executeUpdate();

    }

    public ArrayList<Buyer> getAllBuyers(String query, int currentPage) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT buyers.* FROM users INNER JOIN buyers ON users.username = buyers.username WHERE (users.usertype = 'buyer' OR users.usertype = 'seller') AND (`firstName` LIKE ? OR `lastName` LIKE ? OR buyers.username LIKE ?) LIMIT ?,?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
        stmt.setString(2,"%"+query+"%");
        stmt.setString(3,"%"+query+"%");
        int start = currentPage * MyVariables.resultsPerPage - MyVariables.resultsPerPage;
        stmt.setInt(4,start);
        stmt.setInt(5,MyVariables.resultsPerPage);
        ResultSet result = stmt.executeQuery();

        ArrayList<Buyer> allBuyers = new ArrayList<>();

        while(result.next()){

//            String username = result.getString(1);
//            String password = result.getString(2);
//            String userType = result.getString(3);
//            int salt = result.getInt(4);
//            Timestamp dateJoined = result.getTimestamp(5);
//            String username = result.getString(6);
//            String firstName = result.getString(7);
//            String lastName = result.getString(8);
//            String houseNo = result.getString(9);
//            String street = result.getString(10);
//            String city = result.getString(11);
//            String district = result.getString(12);
//            String province = result.getString(13);
//            boolean sellerApplied = result.getBoolean(14);
//            String phoneNo = result.getString(15);
//            String email = result.getString(16);

            String username = result.getString(1);
            String firstName = result.getString(2);
            String lastName = result.getString(3);
            String houseNo = result.getString(4);
            String street = result.getString(5);
            String city = result.getString(6);
            String district = result.getString(7);
            String province = result.getString(8);
            boolean sellerApplied = result.getBoolean(9);
            String phoneNo = result.getString(10);
            String email = result.getString(11);

            allBuyers.add(new Buyer(username, "password", "userType", 0, null, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email));

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
        String sql = "SELECT COUNT(*) FROM `users` INNER JOIN `buyers` ON users.username = buyers.username WHERE (`firstName` LIKE ? OR `lastName` LIKE ? OR buyers.username LIKE ?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,"%"+query+"%");
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

    public void removeUser(String username) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `users` SET `usertype` = 'deleted' WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);

        stmt.executeUpdate();

    }

    public Seller getBuyerDetails(String aUsername) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT buyers.*, users.usertype, sellers.* FROM users INNER JOIN buyers ON users.username = buyers.username LEFT JOIN sellers ON users.username = sellers.username WHERE users.username = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,aUsername);

        ResultSet result = stmt.executeQuery();

        if(result.next()){

//            String username = result.getString(1);
//            String password = result.getString(2);
//            String userType = result.getString(3);
//            int salt = result.getInt(4);
//            Timestamp dateJoined = result.getTimestamp(5);
//            String username = result.getString(6);
//            String firstName = result.getString(7);
//            String lastName = result.getString(8);
//            String houseNo = result.getString(9);
//            String street = result.getString(10);
//            String city = result.getString(11);
//            String district = result.getString(12);
//            String province = result.getString(13);
//            boolean sellerApplied = result.getBoolean(14);
//            String phoneNo = result.getString(15);
//            String email = result.getString(16);

            String username = result.getString(1);
            String firstName = result.getString(2);
            String lastName = result.getString(3);
            String houseNo = result.getString(4);
            String street = result.getString(5);
            String city = result.getString(6);
            String district = result.getString(7);
            String province = result.getString(8);
            boolean sellerApplied = result.getBoolean(9);
            String phoneNo = result.getString(10);
            String email = result.getString(11);

            String userType = result.getString(12);

            String nic;
            String nicPhotoFront;
            String nicPhotoBack;
            String bankAccountNo;
            String bankName;
            String bankBranch;

            if (userType.equals("seller")) {
                nic = result.getString(14);
                nicPhotoFront = result.getString(15);
                nicPhotoBack = result.getString(16);
                bankAccountNo = result.getString(17);
                bankName = result.getString(18);
                bankBranch = result.getString(19);
                return new Seller(username, "", userType, 0, null, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email,nic, nicPhotoFront,nicPhotoBack, bankAccountNo, bankName, bankBranch);
            }else{
                return new Seller(username, "", userType, 0, null, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email,null, null,null, null, null, null);
            }

        }else{
            System.out.println("000000000000000000000000000000000000000000000");
            return null;
        }

    }

    public Buyer getOnlyBuyerDetails(String aUsername) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT buyers.*, users.usertype FROM users INNER JOIN buyers ON users.username = buyers.username WHERE users.username = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, aUsername);

        ResultSet result = stmt.executeQuery();

        if (result.next()) {

            String username = result.getString(1);
            String firstName = result.getString(2);
            String lastName = result.getString(3);
            String houseNo = result.getString(4);
            String street = result.getString(5);
            String city = result.getString(6);
            String district = result.getString(7);
            String province = result.getString(8);
            boolean sellerApplied = result.getBoolean(9);
            String phoneNo = result.getString(10);
            String email = result.getString(11);

            String userType = result.getString(12);

            return new Buyer(username, "", userType, 0, null, firstName, lastName, houseNo, street, city, district, province, sellerApplied, phoneNo, email);


        }
        return null;

    }

    public String getBuyerDistrict(String buyerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT `district` FROM `buyers` WHERE `username` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, buyerId);
        ResultSet result = stmt.executeQuery();
        if (result.next()){
            return result.getString(1);
        }
        return null;
    }
}
