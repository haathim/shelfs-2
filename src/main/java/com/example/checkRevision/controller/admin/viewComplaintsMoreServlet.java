package com.example.checkRevision.controller.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "viewComplaintsMoreServlet", value = "/admin/viewComplaintsMore")
public class viewComplaintsMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-complaints-more.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_complain_pg.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
