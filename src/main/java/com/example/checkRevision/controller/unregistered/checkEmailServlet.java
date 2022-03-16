package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "checkEmailServlet", value = "/checkEmail")
public class checkEmailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("IN GET PART");

        String email = request.getParameter("email");

//        Just checking
        System.out.println("Received email for checking is...");
        System.out.println(email);

        if (email == null || !validateInput(email)){
            response.sendRedirect("../inputError.html");
            return;
        }

        String clientOrigin = request.getHeader("origin");
        response.setHeader("Access-Control-Allow-Origin", clientOrigin);
        response.setContentType("text/plain");

        BuyerDAO dao = new BuyerDAO();
        try {
            if (dao.isEmailExist(email)){
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
        if (!username.matches("\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+")) {
            System.out.println(1);
            return false;
        }
        return true;
    }
}
