package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.Buyer;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "testPayHereServlet", value = "/buyer/testPayHereServlet")
public class testPayHereServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        BuyerDAO buyerDAO = new BuyerDAO();
        Buyer buyer = null;

        String adIds = request.getParameter("checkoutValues");
//        System.out.println(adIds);
//        get Adids
//        String adIds = "[38,39,40]";
        Gson gson = new Gson();
        int[] ads = gson.fromJson(adIds, int[].class);
//        for (int ad:ads){
//            System.out.println(ad);
//        }
        AdvertisementDAO dao = new AdvertisementDAO();

//        create array to store unavaible ads, if any
        ArrayList<Advertisement> unavailableAds = new ArrayList<>();
        for (int adId: ads){
            Advertisement unavailableAd = null;
            try {
                unavailableAd = dao.isAvailable(adId);
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }

            if (unavailableAd != null){
                unavailableAds.add(unavailableAd);
            }
        }

        if (!unavailableAds.isEmpty()){
//            there are ads that are not available
            request.setAttribute("unavailableAds", unavailableAds);
            request.getRequestDispatcher("/WEB-INF/allPages/buyer/checkoutFailedUnavailableAds.jsp").forward(request, response);
        }else{

//            all ads are available
            ArrayList<Advertisement> checkoutAds = new ArrayList<>();
            for (int ad:ads){
                try {
                    checkoutAds.add(dao.getAdById(ad));
                } catch (SQLException | ClassNotFoundException throwables) {
                    throwables.printStackTrace();
                }
            }
            try {
                buyer = buyerDAO.getOnlyBuyerDetails(buyerId);
                request.setAttribute("buyer", buyer);
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }
            request.setAttribute("checkoutAds", checkoutAds);
            request.getRequestDispatcher("/WEB-INF/allPages/buyer/checkout.jsp").forward(request, response);

        }

    }

}
