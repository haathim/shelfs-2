package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "adminManageAdsMoreServlet", value = "/admin/manageAdsMore")
public class adminManageAdsMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adId = Integer.parseInt(request.getParameter("adId"));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            Advertisement ad = dao.getAdById(adId);

            if (ad == null){
                response.getWriter().println("Resource doesn't Exist");
                return;
            }

            request.setAttribute("ad", ad);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_manage_ads_more.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
