package com.example.checkRevision.controller;

import com.example.checkRevision.EmailSMTP.Email;
import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "resendVerCodeServlet", value = "/resendVerCode")
public class resendVerCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("username1");

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


        BuyerDAO buyerDAO = new BuyerDAO();
        String email = null;
        try {
            email = buyerDAO.getEmail(username);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        System.out.println("In resendVerCode servlet. the email is " + email + " username is " + username);


        Email emailObject = new Email();
        int verCode = (int)(Math.random() * 1000000);
        session.setAttribute("verCode", verCode);
        emailObject.sendMail(email,"Verification code from SHELFS", String.valueOf(verCode));


        request.setAttribute("username", username);
        request.setAttribute("email", email);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/verification/newCodeSent.jsp");
        dispatcher.forward(request, response);
//        response.sendRedirect("newCodeSent.jsp");


    }
}
