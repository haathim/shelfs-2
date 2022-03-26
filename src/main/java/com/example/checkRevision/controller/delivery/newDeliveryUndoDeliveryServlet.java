package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrderPickupsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "newDeliveryUndoDeliveryServlet", value = "/delivery/undoPendingDelivery")
public class newDeliveryUndoDeliveryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        try {
            newOrderPickupsDAO.undoPendingDeliveryForDeliverer(deliverer, orderId);
            response.sendRedirect("pendingPickupsNew");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

}
