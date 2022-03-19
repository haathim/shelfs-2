package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.OrderPickupSeller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "pendingPickupAllDetailsServlet", value = "/delivery/pendingPickupAllDetailsNew")
public class pendingPickupAllDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        int pickupId = Integer.parseInt(request.getParameter("pickupId"));
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<Advertisement> pickupAds = deliveryDAO.getPendingPickupsDetails(pickupId,deliverer);
            request.setAttribute("pickupAds", pickupAds);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pendingPickupsAllDetails.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
