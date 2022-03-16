package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Order;
import com.example.checkRevision.model.OrderAdCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "viewOrdersMoreServlet", value = "/buyer/viewOrdersMore")
public class viewOrdersMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String buyerId = (String) request.getSession().getAttribute("username");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrdersDAO dao = new OrdersDAO();
        try {
            OrderAdCombined orderAd = dao.getOrderByIdForBuyer(orderId, buyerId);

            if (orderAd == null){
                response.getWriter().println("Resource doesn't Exist");
                return;
            }

            request.setAttribute("orderAd", orderAd);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/my-orders-more.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
