package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "searchResultsMore2Servlet", value = "/public/searchResultsMore")
public class searchResultsMore2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adId = Integer.parseInt(request.getParameter("adId"));

        System.out.println("kdhfjd gfgfdhjjdh jh KAKK");

        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            Advertisement ad = dao.getAdById(adId);
            request.setAttribute("ad", ad);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/unregistered/search-results-more.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

}
