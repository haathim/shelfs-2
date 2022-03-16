package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.PendingJobsDAO;
import com.example.checkRevision.model.PenDelOrderCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deliveryAcceptedJobDetailsServlet", value = "/deliveryAcceptedJobDetailsServlet")
public class deliveryAcceptedJobDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deliverer = (String) request.getSession().getAttribute("username");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        PendingJobsDAO dao = new PendingJobsDAO();
        try {
            PenDelOrderCombined penDelOrder = dao.getAcceptedJobsDetails(orderId, deliverer);

            request.setAttribute("penDelOrder", penDelOrder);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/view-accepted-details.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
