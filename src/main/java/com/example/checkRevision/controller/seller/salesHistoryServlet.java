package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.model.Order;
import com.example.checkRevision.model.OrderAdCombined;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "salesHistoryServlet", value = "/seller/salesHistory")
public class salesHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query;
        if (request.getParameter("query") == null){
            query = "";
        }
        else{
            query = request.getParameter("query");
        }
        int currentPage;
        if (request.getParameter("Page") == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("Page"));
            if (currentPage == 0) {
                currentPage = 1;
            }
        }

        String username = (String) request.getSession().getAttribute("username");
        OrdersDAO dao = new OrdersDAO();
        try {
            ArrayList<OrderAdCombined> orderAds = dao.getAllOrdersOfSeller(username, query, currentPage);
            int rows = dao.getAllOrdersOfSellerNumberOfRows(username, query);
            int recordsPerPage = MyVariables.resultsPerPage;
            int nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage > 0) {
                nOfPages++;
            }
            request.setAttribute("noOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("query", query);
            request.setAttribute("orderAds", orderAds);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/sales-history.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
