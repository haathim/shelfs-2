package com.example.checkRevision.controller.login;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "checkUsernamePasswordServlet", urlPatterns ={"/admin/checkUsernamePassword", "/buyer/checkUsernamePassword","/seller/checkUsernamePassword","/delivery/checkUsernamePassword",})
public class checkUsernamePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("IN CHECK USERNAME-PASSWORD POST PART");

        String username = (String) request.getSession().getAttribute("username");
        String password = (String) request.getParameter("currentPassword");

//        Just checking
        System.out.println("Received username for checking is...");
        System.out.println(username);
        System.out.println("Received password for checking is...");
        System.out.println(password);
//
        if (username == null || !validateInput(username)){
            response.sendRedirect("../inputError.html");
            return;
        }
//
        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setContentType("text/plain");
//
        UserDAO dao = new UserDAO();
        try {
            if (dao.isWho(username, password) == 0){
                response.getWriter().write("false");
            }
            else{
                response.getWriter().write("true");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validateInput(String username){
        if (!username.matches("\\w{3,20}")) {
            System.out.println(1);
            return false;
        }
        return true;
    }
}

