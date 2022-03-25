package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Complaint;
import com.mysql.cj.protocol.PacketReceivedTimeHolder;

import java.awt.geom.RectangularShape;
import java.sql.*;
import java.util.ArrayList;

public class ComplaintsDAO {

    public void addComplaint(String buyerId, String title, String description) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO `complaints` (`title`, `description`, `readByAdmin`, `buyerId`) VALUES (?,?,0,?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, buyerId);

        stmt.executeUpdate();

    }

    public ArrayList<Complaint> getComplaints() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT complaints.*, buyers.firstName, buyers.lastName FROM complaints INNER JOIN buyers ON complaints.buyerId = buyers.username WHERE complaints.reply IS NULL;";
        PreparedStatement stmt = con.prepareStatement(sql);
        ArrayList<Complaint> complaints = new ArrayList<>();

        ResultSet result = stmt.executeQuery();
        while(result.next()){
            int complaintId = result.getInt(1);
            String title = result.getString(2);
            String description = result.getString(3);
            String buyerId = result.getString(5);
            String firstName = result.getString(7);
            String lastName = result.getString(8);

            complaints.add(new Complaint(complaintId, title, description, false, buyerId, "", firstName+" "+lastName));

        }

        return complaints;
    }

    public Complaint getComplaintDetails(int aComplaintId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT complaints.*, buyers.firstName, buyers.lastName FROM complaints INNER JOIN buyers ON complaints.buyerId = buyers.username WHERE complaintId = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, aComplaintId);
        ArrayList<Complaint> complaints = new ArrayList<>();

        ResultSet result = stmt.executeQuery();
        if(result.next()){
            int complaintId = result.getInt(1);
            String title = result.getString(2);
            String description = result.getString(3);
            String buyerId = result.getString(5);
            String firstName = result.getString(7);
            String lastName = result.getString(8);

            return new Complaint(complaintId, title, description, false, buyerId, "", firstName+" "+lastName);

        }

        return null;
    }

    public void replyToComplaint(int complaintId, String replyDescription) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE `complaints` SET reply = ? , readByAdmin = 1 WHERE complaintId = ?;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, replyDescription);
        stmt.setInt(2, complaintId);

        stmt.executeUpdate();


    }

    public ArrayList<Complaint> buyersComplaintReplies(String buyerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM `complaints` WHERE buyerId = ? AND reply IS NOT NULL;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, buyerId);
        ResultSet result = stmt.executeQuery();

        ArrayList<Complaint> buyerComplaintReplies = new ArrayList<>();

        while(result.next()){

            int complaintId = result.getInt(1);
            String title = result.getString(2);
            String description = result.getString(3);
            String reply = result.getString(6);

            buyerComplaintReplies.add(new Complaint(complaintId, title, description, true, buyerId, reply, ""));
        }

        return buyerComplaintReplies;


    }
}
