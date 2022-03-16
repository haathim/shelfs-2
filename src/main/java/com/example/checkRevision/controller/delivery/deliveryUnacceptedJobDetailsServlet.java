package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.PendingJobsDAO;
import com.example.checkRevision.model.PenDelOrderCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deliveryUnacceptedJobDetailsServlet", value = "/delivery/unacceptedDetails")
public class deliveryUnacceptedJobDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        PendingJobsDAO dao = new PendingJobsDAO();
        try {
            PenDelOrderCombined penDelOrder = dao.getUnacceptedJobsDetails(orderId);

            request.setAttribute("penDelOrder", penDelOrder);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/view-unaccepted-details.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
