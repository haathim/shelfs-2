package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.dao.WishlistDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.NewOrder;
import com.example.checkRevision.model.Order;
import com.example.checkRevision.model.OrderAdCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewOrdersServlet", value = "/buyer/viewOrders")
public class viewOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();
        try {
            ArrayList<NewOrder> orders = newOrdersDAO.getAllOrdersOfBuyer(username);

            request.setAttribute("orders", orders);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/my-orders.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

}
