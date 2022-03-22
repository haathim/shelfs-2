package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;
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
            request.getRequestDispatcher("").forward(request, response);
        }else{
//
        }

    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("Payhere request came.");
//        System.out.println(request.getParameter("payhere_amount"));
//    }
}
