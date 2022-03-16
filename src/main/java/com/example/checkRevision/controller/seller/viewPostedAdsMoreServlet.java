package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.OrderAdCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "viewPostedAdsMoreServlet", value = "/seller/viewPostedAdsMore")
public class viewPostedAdsMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sellerId = (String) request.getSession().getAttribute("username");
        int adId = Integer.parseInt(request.getParameter("adId"));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            Advertisement ad = dao.getPostedAdByIdForSeller(adId, sellerId);
            if (ad == null){
                response.getWriter().println("Resource doesn't Exist");
                return;
            }

            request.setAttribute("ad", ad);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/view-posted-books-more.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
