package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.model.OrderBuyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "assignCourierServlet", value = "/admin/assignCourier")
public class assignCourierServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewOrdersDAO dao = new NewOrdersDAO();
        try {
            ArrayList<OrderBuyer> courierOrders = dao.getCourierOrders();
            request.setAttribute("courierOrders", courierOrders);
            request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_courier_orders.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int status = Integer.parseInt(request.getParameter("status"));
        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        try {
            newOrdersDAO.assignCourierForOrder(orderId, status);
            response.sendRedirect("assignCourier");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
