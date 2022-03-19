package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.NewOrderPickups;
import com.example.checkRevision.model.OrderPickupSeller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "pickupHistoryServlet", value = "/delivery/pickupHistoryNew")
public class pickupHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<NewOrderPickups> historyPickups = deliveryDAO.getPickupHistory(deliverer);
            request.setAttribute("historyPickups", historyPickups);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pickupHistory.jsp").forward(request, response);


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
