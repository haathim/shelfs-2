package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrdersDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "newDeliveryUpdateDeliveryServlet", value = "/delivery/newDeliveryUpdateDelivery")
public class newDeliveryUpdateDeliveryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int status = Integer.parseInt(request.getParameter("status"));
        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        try {
            newOrdersDAO.updateOrderStatusByDeliverer(orderId, status, deliverer);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        response.sendRedirect("pendingDeliveryNew");
    }
}
