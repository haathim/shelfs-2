package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrderPickupsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "newDeliveryUndoPickupServlet", value = "/delivery/undoPendingPickup")
public class newDeliveryUndoPickupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        int pickupId = Integer.parseInt(request.getParameter("pickupId"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        try {
            newOrderPickupsDAO.undoPendingPickupForDeliverer(deliverer, pickupId);
            response.sendRedirect("pendingPickupsNew");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
