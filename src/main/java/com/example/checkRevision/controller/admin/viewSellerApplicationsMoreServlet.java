package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.SellerApplicationDAO;
import com.example.checkRevision.model.SellerApplications;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "viewSellerApplicationsMoreServlet", value = "/admin/viewSellerApplicationsMore")
public class viewSellerApplicationsMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sellAppId = request.getParameter("sellerAppId");

        SellerApplicationDAO dao = new SellerApplicationDAO();
        SellerApplications sellApp = null;
        try {
            sellApp = dao.viewSellerApplicationById(sellAppId);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        if (sellApp == null){

            response.getWriter().println("Resource doesn't Exist");
            return;
        }

        request.setAttribute("sellApp", sellApp);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-seller-applications-more.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
