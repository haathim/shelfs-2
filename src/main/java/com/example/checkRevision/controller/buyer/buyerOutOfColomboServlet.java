package com.example.checkRevision.controller.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "buyerOutOfColomboServlet", value = "/buyer/buyerOutOfColombo")
public class buyerOutOfColomboServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/allPages/buyer/buyerOutOfColombo.jsp").forward(request, response);
    }

}
