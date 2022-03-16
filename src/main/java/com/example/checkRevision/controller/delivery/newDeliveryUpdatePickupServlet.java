package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrderPickupsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "newDeliveryUpdatePickupServlet", value = "/delivery/newDeliveryUpdatePickup")
public class newDeliveryUpdatePickupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");

        int pickupId = Integer.parseInt(request.getParameter("pickupId"));
        int status = Integer.parseInt(request.getParameter("status"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        try {
            newOrderPickupsDAO.updatePickupStatus(deliverer, pickupId, status);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        response.sendRedirect("pendingPickups");

    }
}
