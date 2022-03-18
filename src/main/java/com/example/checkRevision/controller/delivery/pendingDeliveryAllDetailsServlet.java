package com.example.checkRevision.controller.delivery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "pendingDeliveryAllDetailsServlet", value = "/delivery/pendingDeliveryAllDetailsNew")
public class pendingDeliveryAllDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/pendingDeliveriesAllDetails.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
