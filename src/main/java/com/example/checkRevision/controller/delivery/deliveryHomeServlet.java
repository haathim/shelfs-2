package com.example.checkRevision.controller.delivery;


import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.PendingJobsDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.PenDelOrderCombined;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "deliveryHomeServlet", value = "/delivery/home1")
public class deliveryHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        PendingJobsDAO dao = new PendingJobsDAO();
//        try {
//            ArrayList<PenDelOrderCombined> penDelOrders = dao.getUnacceptedJobs();
//            request.setAttribute("penDelOrders", penDelOrders);
//            request.getRequestDispatcher("/WEB-INF/allPages/delivery/over_view.jsp").forward(request, response);
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
        PendingJobsDAO dao = new PendingJobsDAO();
        try {
            ArrayList<PenDelOrderCombined> penDelOrders = dao.getUnacceptedJobs(query, currentPage);
            int rows = dao.getUnacceptedJobsNumberOfRows(query);
            int recordsPerPage = MyVariables.resultsPerPage;
            int nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage > 0) {
                nOfPages++;
            }
            request.setAttribute("noOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("penDelOrders", penDelOrders);
            request.setAttribute("query", query);
            request.getRequestDispatcher("/WEB-INF/allPages/delivery/over_view.jsp").forward(request, response);


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
