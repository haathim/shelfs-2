package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.OrderBuyer;
import com.example.checkRevision.model.OrderPickupSeller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "pendingDeliveryServlet", value = "/delivery/pendingDeliveryNew")
public class pendingDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<OrderBuyer> pendingDeliveries = deliveryDAO.getPendingDeliveries(deliverer);
            request.setAttribute("pendingDeliveries", pendingDeliveries);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pendingDeliveries.jsp").forward(request, response);


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
