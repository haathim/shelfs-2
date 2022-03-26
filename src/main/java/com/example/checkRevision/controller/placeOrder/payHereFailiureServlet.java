package com.example.checkRevision.controller.placeOrder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "payHereFailiureServlet", value = "/payHereFailiure")
public class payHereFailiureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/allPages/buyer/paymentFailiure.jsp");
    }

}
