package com.example.checkRevision.controller.chat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "chatPageServlet", urlPatterns = {"/buyer/chatPage", "/seller/chatPage", "/admin/chatPage", "/delivery/chatPage" })
public class chatPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String userType = (String) request.getSession().getAttribute("userType");
        String otherUser = request.getParameter("otherUser");
        request.setAttribute("otherUser", otherUser);

        switch (userType){
            case "buyer":

            case "seller":
                request.getRequestDispatcher("/WEB-INF/allPages/buyer/chat/chatPage.jsp").forward(request, response);
                break;

            case "admin":
                request.getRequestDispatcher("/WEB-INF/allPages/admin/chat/chatPage.jsp").forward(request, response);
                break;

            case "delivery":
                request.getRequestDispatcher("/WEB-INF/allPages/delivery/chat/chatPage.jsp").forward(request, response);
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
