package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "pendingDeliveryAllDetailsServlet", value = "/delivery/pendingDeliveryAllDetailsNew")
public class pendingDeliveryAllDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<Advertisement> newOrderAds = deliveryDAO.getPendingDeliveryDetails(orderId,deliverer);
            request.setAttribute("newOrderAds", newOrderAds);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pendingDeliveriesAllDetails.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
