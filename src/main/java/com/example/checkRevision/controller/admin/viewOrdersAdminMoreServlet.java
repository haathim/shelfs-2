package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewOrdersAdminMoreServlet", value = "/admin/viewOrdersAdminMore")
public class viewOrdersAdminMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        NewOrdersDAO dao = new NewOrdersDAO();
        try {
            ArrayList<Advertisement> orderDetails = dao.getOrderDetailsForAdmin(orderId);
            request.setAttribute("orderDetails", orderDetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-all-orders-more.jsp");
            dispatcher.forward(request, response);        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
