package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.model.OrderBuyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewOrdersAdminServlet", value = "/admin/viewOrdersAdmin")
public class viewOrdersAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-all-orders.jsp");
        String query = request.getParameter("query");
        if (query == null){
            query = "";
        }
        NewOrdersDAO dao = new NewOrdersDAO();
        try {
            ArrayList<OrderBuyer> orders = dao.getOrdersForAdmin(query);
            request.setAttribute("orders", orders);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_view_orders.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
