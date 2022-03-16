package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.SellerApplicationDAO;
import com.example.checkRevision.dao.SellerDAO;
import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "rejectSellerAppServlet", value = "/admin/rejectSellerApp")
public class rejectSellerAppServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sellerAppId = request.getParameter("sellerAppId");

        SellerApplicationDAO sellerAppDao = new SellerApplicationDAO();



        try {
            sellerAppDao.respondApplication(sellerAppId, false);


            response.sendRedirect("viewSellerApplications");

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
