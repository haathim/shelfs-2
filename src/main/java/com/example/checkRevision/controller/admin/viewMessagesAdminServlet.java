package com.example.checkRevision.controller.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "viewMessagesAdminServlet", value = "/admin/messages")
public class viewMessagesAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-messages.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_messages.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
