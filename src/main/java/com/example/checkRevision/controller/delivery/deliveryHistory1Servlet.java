package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.NewOrder;
import com.example.checkRevision.model.NewOrderPickups;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "deliveryHistory1Servlet", value = "/delivery/deliveryHistory1New")
public class deliveryHistory1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String deliverer = (String) session.getAttribute("username");
        DeliveryDAO deliveryDAO = new DeliveryDAO();
        try {
            ArrayList<NewOrder> historyDeliveries = deliveryDAO.getDeliveryHistory(deliverer);
            request.setAttribute("historyDeliveries", historyDeliveries);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/New/deliveryHistory.jsp").forward(request, response);


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
