package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.model.SellerSale;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "newSalesServlet", value = "/seller/newSales")
public class newSalesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        ArrayList<SellerSale> sellerNewSales = null;
        try {
            sellerNewSales = newOrderPickupsDAO.getNewSellerSales(username);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("newlySoldAds", sellerNewSales);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/new-sales.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
