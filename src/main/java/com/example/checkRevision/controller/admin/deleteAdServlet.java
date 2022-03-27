package com.example.checkRevision.controller.admin;

import com.example.checkRevision.EmailSMTP.Email;
import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.BuyerDAO;

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
        BuyerDAO buyerDAO = new BuyerDAO();
        Email mailSender = new Email();
        try {
            dao.deleteAdvertisementByAdmin(adId);
            String sellerEmail = buyerDAO.getEmailOfSellerOfAd(adId);
            System.out.println("Seller EMail is " + sellerEmail);
            mailSender.sendDeletedAdEmail(sellerEmail, adId);
            response.sendRedirect("manageAds");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
