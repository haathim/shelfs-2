package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.dao.NewOrdersDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "assignDelivererForDeliveryServlet", value = "/assignDelivererForDeliveryServlet")
public class assignDelivererForDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deliverer = request.getParameter("deliverer");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        try {
            newOrdersDAO.assignDelivererForOrder(orderId, deliverer);
            response.getWriter().println("Done");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
