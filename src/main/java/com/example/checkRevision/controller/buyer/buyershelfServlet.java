package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "buyershelfServlet", value = "/buyer/myshelf")
public class buyershelfServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();

        ArrayList<Advertisement> myShelfAds = null;
        try {
            myShelfAds = newOrdersDAO.getMyShelfAds(buyerId);
            request.setAttribute("myShelfAds", myShelfAds);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/myshelf.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
