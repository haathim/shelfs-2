package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.model.Buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "settingsServlet", value = "/buyer/settings")
public class settingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        System.out.println("1");
        BuyerDAO dao = new BuyerDAO();

        try {
            System.out.println("2");
            Buyer buyer = dao.getBuyer(username);
            System.out.println(buyer);
            if (username == null) {
                System.out.println("3");
                response.getWriter().println("Resource doesn't Exist");
                return;
            }
            System.out.println("4");
            request.setAttribute("usernamex", buyer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/settings.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            System.out.println("5");
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
