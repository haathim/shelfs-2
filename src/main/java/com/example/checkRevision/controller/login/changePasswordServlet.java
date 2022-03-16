package com.example.checkRevision.controller.login;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "changePasswordServlet", urlPatterns ={"/admin/changePassword", "/buyer/changePassword","/seller/changePassword","/delivery/changePassword",} )
public class changePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String newPassword2 = request.getParameter("newPassword2");

        UserDAO dao = new UserDAO();
        try {
            if(dao.isWho(username, currentPassword) == 0){
                response.sendRedirect("failedPasswordChange.html");
            }
            else{
                dao.changePassword(username, newPassword);
                response.sendRedirect("home");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}
