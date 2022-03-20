package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.AdvertisementDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deleteAdServlet", value = "/admin/deleteAd")
public class deleteAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int adId = Integer.parseInt(request.getParameter("adId"));
        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            dao.deleteAdvertisementByAdmin(adId);
            response.sendRedirect("manageAds");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
