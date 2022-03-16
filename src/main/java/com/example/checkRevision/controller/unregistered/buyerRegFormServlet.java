package com.example.checkRevision.controller.unregistered;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "buyerRegFormServlet", value = "/public/buyerRegForm")
public class buyerRegFormServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/unregistered/register-buyer.jsp");
        dispatcher.forward(request, response);
    }


}
