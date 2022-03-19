package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.mysql.cj.protocol.PacketReceivedTimeHolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

}
