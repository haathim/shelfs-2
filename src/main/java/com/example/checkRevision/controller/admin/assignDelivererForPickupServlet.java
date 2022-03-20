package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.model.Delivery;
import com.example.checkRevision.model.OrderBuyer;
import com.example.checkRevision.model.OrderPickupSeller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "assignDelivererForPickupServlet", value = "/admin/assignDelivererForPickup")
public class assignDelivererForPickupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        DeliveryDAO dao = new DeliveryDAO();
//        try {
//            ArrayList<OrderBuyer> orders = dao.getPendingDeliveriesToAssignDeliverer();
//            ArrayList<Delivery> deliverers = dao.getDeliveryPersonDetails();
//            request.setAttribute("orders", orders);
//            request.setAttribute("deliverers", deliverers);
//            request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_pending_deliveries.jsp").forward(request, response);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }


        DeliveryDAO dao = new DeliveryDAO();
        try {
            ArrayList<OrderPickupSeller> pendingPickups = dao.getPendingPickupsToAssignDeliverer();
            ArrayList<Delivery> deliverers = dao.getDeliveryPersonDetails();
            request.setAttribute("deliverers", deliverers);
            request.setAttribute("pendingPickups", pendingPickups);
            request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_pending_pickups.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deliverer = request.getParameter("deliverer");
        int pickupId = Integer.parseInt(request.getParameter("pickupId"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();

        try {
            newOrderPickupsDAO.assignDelivererForPickup(pickupId, deliverer);
            response.sendRedirect("assignDelivererForPickup");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
