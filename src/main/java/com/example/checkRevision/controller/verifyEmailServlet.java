package com.example.checkRevision.controller;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "verifyEmailServlet", value = "/verifyEmail")
public class verifyEmailServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        int verCode = Integer.parseInt(request.getParameter("verCode"));

        UserDAO userDAO = new UserDAO();

//        check if account is already verified
        try {
            if (userDAO.isVerified(username)){
                response.sendRedirect("alreadyVerified.html");
                return;
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


        //if session value is expired or not set
        if (session.getAttribute("verCode") == null){
            response.sendRedirect("verifyAccount");
            return;
        }

        if (verCode == (int)session.getAttribute("verCode")){
            System.out.println("Verification Code okay");

            try {
                userDAO.verifyAccount(username);
                response.sendRedirect("correctVerificationCode.html");
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }
        }
        else {
            System.out.println("Verification Code not okay");
            response.sendRedirect("incorrectVerificationCode.html");
        }



    }
}
