package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "searchResPaginationServlet", value = "/public/searchResults")
public class searchResPaginationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        int currentPage;
        if (request.getParameter("Page") == null){
            currentPage = 1;
        }
        else{
            currentPage = Integer.parseInt(request.getParameter("Page"));
            if (currentPage == 0){
                currentPage = 1;
            }
        }

//        create dao
        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            ArrayList<Advertisement> resultAds = dao.viewAdvertisementsPage(query, currentPage);
            int rows = dao.getNumberOfRows(query);
            int recordsPerPage = MyVariables.resultsPerPage;
            int nOfPages = rows / recordsPerPage;
            if (nOfPages % recordsPerPage > 0) {
                nOfPages++;
            }
            request.setAttribute("noOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("resultAds", resultAds);
            request.setAttribute("query", query);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/unregistered/search-results-pages.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
