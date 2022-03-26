package com.example.checkRevision.controller.chat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "chatUsersPageServlet", urlPatterns = {"/buyer/chatUsersPage", "/seller/chatUsersPage", "/admin/chatUsersPage", "/delivery/chatUsersPage" })
public class chatUsersPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String userType = (String) request.getSession().getAttribute("userType");

        request.setAttribute("username", username);

        switch (userType){
            case "buyer":

            case "seller":
                request.getRequestDispatcher("/WEB-INF/allPages/buyer/chat/chatUsersPage.jsp").forward(request, response);
                break;

            case "admin":
                request.getRequestDispatcher("/WEB-INF/allPages/admin/chat/chatUsersPage.jsp").forward(request, response);
                break;

            case "delivery":
                request.getRequestDispatcher("/WEB-INF/allPages/delivery/chat/chatUsersPage.jsp").forward(request, response);
                break;

            default:
//                redirect to login page

                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
