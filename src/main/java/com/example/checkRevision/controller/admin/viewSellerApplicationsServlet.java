package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.dao.SellerApplicationDAO;
import com.example.checkRevision.model.Order;
import com.example.checkRevision.model.SellerApplications;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewSellerApplicationsServlet", value = "/admin/viewSellerApplications")
public class viewSellerApplicationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SellerApplicationDAO dao = new SellerApplicationDAO();
        try {
            ArrayList<SellerApplications> sellerApplications = dao.viewAllSellerApplications();

            request.setAttribute("sellerApplications", sellerApplications);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-seller-applications.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_seller_application.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
