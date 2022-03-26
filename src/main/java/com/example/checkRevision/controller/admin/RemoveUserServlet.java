package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.BuyerDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RemoveUserServlet", value = "/admin/removeUser")
public class RemoveUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        BuyerDAO dao = new BuyerDAO();
        try {
            dao.removeUser(username);
            response.sendRedirect("viewUsers");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
