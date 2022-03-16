package com.example.checkRevision.controller.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "verifyAccountServlet", value = "/verifyAccount")
public class verifyAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/verification/verifyAccount.jsp");
        dispatcher.forward(request, response);
    }

}
