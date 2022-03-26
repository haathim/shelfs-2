package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.OrderPickupSeller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "pendingPickupServlet", urlPatterns = {"/delivery/pendingPickupsNew", "/delivery/home"})
public class pendingPickupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<OrderPickupSeller> pendingPickups = deliveryDAO.getPendingPickups(deliverer);
            request.setAttribute("pendingPickups", pendingPickups);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pendingPickups.jsp").forward(request, response);


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
