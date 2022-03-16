package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "checkUsernameServlet", value = "/checkUsername")
public class checkUsernameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("IN GET PART");

        String username = request.getParameter("username");

//        Just checking
        System.out.println("Received username for checking is...");
        System.out.println(username);

        if (username == null || !validateInput(username)){
            response.sendRedirect("../inputError.html");
            return;
        }

        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setContentType("text/plain");

        UserDAO dao = new UserDAO();
        try {
            if (dao.isUsernameExist(username)){
                response.getWriter().write("false");
            }
            else{
                response.getWriter().write("true");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        System.out.println("IN POST PART");
//        String username = request.getParameter("username");
//
////        Just checking
//        System.out.println("Received username for checking is...");
//        System.out.println(username);
//
//        if (username == null || !validateInput(username)){
//            response.sendRedirect("../inputError.html");
//            return;
//        }
//
//        String clientOrigin = request.getHeader("origin");
//        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
//        response.setContentType("text/plain");
//
//        UserDAO dao = new UserDAO();
//        try {
//            if (dao.isUsernameExist(username)){
//                response.getWriter().write("false");
//            }
//            else{
//                response.getWriter().write("true");
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//    }

    public boolean validateInput(String username){
        if (!username.matches("\\w{3,20}")) {
            System.out.println(1);
            return false;
        }
        return true;
    }
}
