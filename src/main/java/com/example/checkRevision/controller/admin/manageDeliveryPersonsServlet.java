package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.DeliveryDAO;
import com.example.checkRevision.model.Delivery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "manageDeliveryPersonsServlet", value = "/admin/manageDeliveryPersons")
public class manageDeliveryPersonsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DeliveryDAO dao = new DeliveryDAO();
        try {
            ArrayList<Delivery> deliveryPersons = dao.getDeliveryPersonDetails();
            request.setAttribute("deliveryPersons", deliveryPersons);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/manage-delivery-persons.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
