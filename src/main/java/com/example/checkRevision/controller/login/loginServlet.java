package com.example.checkRevision.controller.login;

import com.example.checkRevision.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@WebServlet(name = "loginServlet", value = "/login")
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("isError", false);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/common/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        UserDAO dao = new UserDAO();

        int is = 0;
        try {
            is = dao.isWho(username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        if (is > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            switch (is) {
                case 1:

                    session.setAttribute("userType", "admin");

                    System.out.println("ADMIN");

                    response.sendRedirect("admin/home");
                    break;
                case 2:

                    session.setAttribute("userType", "buyer");

                    System.out.println("BUYER");

                    response.sendRedirect("buyer/home");
                    break;
                case 3:

                    session.setAttribute("userType", "seller");

                    System.out.println("SELLER");

                    response.sendRedirect("buyer/home");
                    break;

                case 4:
                    session.setAttribute("userType", "delivery");

                    System.out.println("DELIVERY");

                    response.sendRedirect("delivery/pendingPickupsNew");
                    break;

                case 5:
                    response.sendRedirect("verifyAccount");
                    break;

            }
        } else {
            request.setAttribute("isError", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/common/login.jsp");
            dispatcher.forward(request, response);
        }


    }

}
