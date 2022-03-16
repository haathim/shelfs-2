package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.NewOrder;

import java.sql.*;
import java.util.ArrayList;

public class NewOrdersDAO {

    public NewOrdersDAO() {
    }


    public void addOrder(String buyerId, Timestamp dateOrdered, boolean isCourier, int totalPrice) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

        String newOrderSQL = "INSERT INTO `newOrders` (buyerId, dateOrdered, status, deliverer, isCourier, totalPrice) VALUES (?,?,?,?,?,?);";
        PreparedStatement newOrderStmt = con.prepareStatement(newOrderSQL);

        newOrderStmt.setString(1, buyerId);
        newOrderStmt.setTimestamp(2, dateOrdered);
        newOrderStmt.setInt(3, 0);
        newOrderStmt.setString(4, null);
        newOrderStmt.setBoolean(5, isCourier);
        newOrderStmt.setInt(6, totalPrice);
        int result = newOrderStmt.executeUpdate();

    }

    public int getOrderId(String buyerId, Timestamp dateOrdered) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();
        String sql = "SELECT `orderId` FROM  `newOrders` WHERE `buyerId` = ? AND dateOrdered = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, buyerId);
        stmt.setTimestamp(2, dateOrdered);

        ResultSet result = stmt.executeQuery();
        result.next();

        return result.getInt(1);

    }

    public void updateOrderStatus(int orderId, int status) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrders` SET `status` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, status);
        stmt.setInt(2, orderId);

        stmt.executeUpdate();
    }

    public void assignDelivererForOrder(int orderId, String deliverer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET `deliverer` = ? AND `status` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, deliverer);
        stmt.setInt(2, 2);
        stmt.setInt(3, orderId);

        stmt.executeUpdate();
    }

    public void completeOrder(int orderId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE `newOrderPickups` SET `status` = ? WHERE `orderId` = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setInt(1, 3);
        stmt.setInt(2, orderId);

        stmt.executeUpdate();
    }


    public ArrayList<NewOrder> getCourierOrders() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM  `newOrders` WHERE `status` = ? AND isCourier = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, 1);
        stmt.setBoolean(2, true);

        ResultSet result = stmt.executeQuery();

        ArrayList<NewOrder> courierOrders = new ArrayList<>();

        while(result.next()){

            NewOrder courierOrder = new NewOrder(result.getInt(1), result.getString(2), result.getTimestamp(3), result.getInt(4), result.getString(5), true, result.getInt(7));

            courierOrders.add(courierOrder);

        }

        return courierOrders;
    }

}
