package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "removePostedBookServlet", value = "/seller/removePostedBook")
public class removePostedBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sellerId = (String) request.getSession().getAttribute("username");
        int adId = Integer.parseInt(request.getParameter("adId"));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {
            dao.deletePostedAdByIdForSeller(adId, sellerId);
            response.sendRedirect("viewPostedAds");

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

}
