package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Buyer;
import com.example.checkRevision.variables.MyVariables;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "adminViewUsersServlet", value = "/admin/viewUsers")
public class adminViewUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


//        BuyerDAO dao = new BuyerDAO();
//        try {
//            ArrayList<Buyer> allBuyers = dao.getAllBuyers();
//            for (Buyer buyer:allBuyers) {
//                System.out.println(buyer.getUsername());
//            }
//
//            request.setAttribute("allBuyers", allBuyers);
////            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/view-buyers.jsp");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_manage_users.jsp");
//            dispatcher.forward(request, response);
//
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }


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

//        create dao
        BuyerDAO dao = new BuyerDAO();
        try {
            ArrayList<Buyer> resultBuyers = dao.getAllBuyers(query, currentPage);
            int rows = dao.getNumberOfRows(query);
            int recordsPerPage = MyVariables.resultsPerPage;
            int nOfPages = rows / recordsPerPage;
            if (nOfPages % recordsPerPage > 0) {
                nOfPages++;
            }
            request.setAttribute("noOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("resultBuyers", resultBuyers);
            request.setAttribute("query", query);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_manage_users.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

}
