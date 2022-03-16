package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.EmailSMTP.Email;
import com.example.checkRevision.dao.BuyerDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "forgotPasswordServlet", value = "/forgotPassword")
public class forgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        Get users email
        String username = request.getParameter("username");
        BuyerDAO buyerDAO = new BuyerDAO();
        try {
            String email = buyerDAO.getEmail(username);

//        Send OTP code to buyers email
            Email emailObject = new Email();
            int forgotPwdVerCode = (int)(Math.random() * 1000000);
            HttpSession session = request.getSession();
            session.setAttribute("forgotPwdVerCodeUsername", username);
            session.setAttribute("forgotPwdVerCode", forgotPwdVerCode);
            emailObject.sendMail(email,"Forgot Password code from SHELFS", String.valueOf(forgotPwdVerCode));

            response.sendRedirect("newPasswordFormServlet");

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
