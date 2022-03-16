package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.PendingJobsDAO;
import com.example.checkRevision.model.PenDelOrderCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "deliveryPendingPickupsServlet", value = "/delivery/pendingPickups")
public class deliveryPendingPickupsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deliverer = (String) request.getSession().getAttribute("username");
//        String deliverer = "delivery1";

        PendingJobsDAO dao = new PendingJobsDAO();
        try {
            ArrayList<PenDelOrderCombined> pendingPickupsOfDeliverer = dao.getPendingPickupsOfDeliverer(deliverer);
            request.setAttribute("pendingPickups", pendingPickupsOfDeliverer);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/pending_Pickups.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
