package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.model.Delivery;
import com.example.checkRevision.model.OrderBuyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "assignDelivererForDeliveryServlet", value = "/admin/assignDelivererForDelivery")
public class assignDelivererForDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DeliveryDAO dao = new DeliveryDAO();
        try {
            ArrayList<OrderBuyer> orders = dao.getPendingDeliveriesToAssignDeliverer();
            ArrayList<Delivery> deliverers = dao.getDeliveryPersonDetails();
            request.setAttribute("deliverers", deliverers);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_pending_deliveries.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deliverer = request.getParameter("deliverer");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        try {
            newOrdersDAO.assignDelivererForOrder(orderId, deliverer);
            response.sendRedirect("assignDelivererForDelivery");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
