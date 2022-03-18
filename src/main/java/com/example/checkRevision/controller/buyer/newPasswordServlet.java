package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "newPasswordServlet", value = "/newPassword")
public class newPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");


        System.out.println("Username is " + username + "--");
        System.out.println("forgotPwdVerCodeUsername is " + session.getAttribute("forgotPwdVerCodeUsername"));

        if(!validate(username, password1, password2)){
            System.out.println("Forgot Password: Validation Failed");
            response.sendRedirect("inputError.html");
            return;
        }

        int otpCode = Integer.parseInt(request.getParameter("otpCode"));

        if (username.equals((String) session.getAttribute("forgotPwdVerCodeUsername"))){
            System.out.println("Forgot Password : Username is okay");
        }else{
            System.out.println("Forgot Password : Username is not okay");
            response.sendRedirect("wrongCredentials.html");
            return;
        }
        if (otpCode == (int)session.getAttribute("forgotPwdVerCode")){
            System.out.println("Forgot Password code is okay");
        }else{
            System.out.println("Forgot Password code is not okay");
            response.sendRedirect("wrongCredentials.html");
            return;
        }

//        change the password
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.changePassword(username, password1);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        response.sendRedirect("login");

    }

    public boolean validate(String username, String password1, String password2){
        return true;
    }
}
