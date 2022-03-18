package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrderPickupsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "assignDelivererForPickupServlet", value = "/assignDelivererForPickupServlet")
public class assignDelivererForPickupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deliverer = request.getParameter("deliverer");
        int pickupId = Integer.parseInt(request.getParameter("pickupId"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();

        try {
            newOrderPickupsDAO.assignDelivererForPickup(pickupId, deliverer);
            response.getWriter().println("Done");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
