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
import java.util.ArrayList;

@WebServlet(name = "viewOrdersMoreServlet", value = "/buyer/viewOrdersMore")
public class viewOrdersMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String buyerId = (String) request.getSession().getAttribute("username");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            ArrayList<Advertisement> adsInOrder = dao.getAdsOfNewOrder(buyerId, orderId);
            request.setAttribute("adsInOrder", adsInOrder);
            request.getRequestDispatcher("/WEB-INF/allPages/buyer/my-orders-more.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
