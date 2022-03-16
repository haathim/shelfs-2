package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.SellerApplicationDAO;
import com.example.checkRevision.dao.SellerDAO;
import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "acceptSellerAppServlet", value = "/admin/acceptSellerApp")
public class acceptSellerAppServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sellerAppId = request.getParameter("sellerAppId");

        SellerApplicationDAO sellerAppDao = new SellerApplicationDAO();
        UserDAO userDao = new UserDAO();
        SellerDAO sellerDao = new SellerDAO();

        try {
            sellerAppDao.respondApplication(sellerAppId, true);
            userDao.changeToSeller(sellerAppId);
            sellerDao.addSeller(sellerAppId);
            response.sendRedirect("viewSellerApplications");

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
