package com.example.checkRevision.controller.unregistered;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "testPayHereServlet", value = "/testPayHereServlet")
public class testPayHereServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Payhere request came.");
        System.out.println(request.getParameter("payhere_amount"));
    }
}
