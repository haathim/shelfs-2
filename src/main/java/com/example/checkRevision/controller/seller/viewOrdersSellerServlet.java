//package com.example.checkRevision.controller.seller;
//
//import com.example.checkRevision.dao.OrdersDAO;
//import com.example.checkRevision.model.Order;
//import com.example.checkRevision.model.OrderAdCombined;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//@WebServlet(name = "viewOrdersSellerServlet", value = "/seller/viewOrders")
//public class viewOrdersSellerServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String username = (String) request.getParameter("username");
//        OrdersDAO dao = new OrdersDAO();
//        try {
//            ArrayList<OrderAdCombined> orders = dao.getAllOrdersOfBuyer(username);
//
//            System.out.println("1111");
//
//
//            System.out.println("2222");
//
//            request.setAttribute("orders", orders);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/my-orders.jsp");
//            dispatcher.forward(request, response);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
//    }
//
//}
