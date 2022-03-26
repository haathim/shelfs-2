package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "removeDelivererServlet", value = "/admin/removeDeliverer")
public class removeDelivererServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        UserDAO dao = new UserDAO();
        try {
            dao.removeDeliverer(username);
            response.sendRedirect("manageDeliveryPersons");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
