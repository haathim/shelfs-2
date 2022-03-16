package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.PendingJobsDAO;
import com.example.checkRevision.model.PenDelOrderCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "deliveryPendingDeliveriesServlet", value = "/delivery/pendingDeliveries")
public class deliveryPendingDeliveriesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deliverer = (String) request.getSession().getAttribute("username");
//        String deliverer = "delivery1";

        PendingJobsDAO dao = new PendingJobsDAO();
        try {
            ArrayList<PenDelOrderCombined> pendingDeliveriesOfDeliverer = dao.getPendingDeliveriesOfDeliverer(deliverer);
            request.setAttribute("pendingDeliveries", pendingDeliveriesOfDeliverer);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/pending_Delivery.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
