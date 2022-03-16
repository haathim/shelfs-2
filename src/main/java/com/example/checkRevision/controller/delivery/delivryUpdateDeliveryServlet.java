package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.PendingJobsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "delivryUpdateDeliveryServlet", value = "/delivery/updateDelivery")
public class delivryUpdateDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String deliverer = (String) request.getSession().getAttribute("username");
        PendingJobsDAO dao = new PendingJobsDAO();

        try {
            dao.updateDelivery(orderId, deliverer);
            response.sendRedirect("deliveryHistory");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
