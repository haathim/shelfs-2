package com.example.checkRevision.controller.placeOrder;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.dao.NewOrdersDAO;
import com.example.checkRevision.dao.NewPickupAdsDAO;
import com.example.checkRevision.model.Advertisement;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "payHereSuccessServlet", value = "/payHereSuccess")
public class payHereSuccessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("WE ARE IN PAYHERESUCCESS SERVLET");

        String checkoutAds = request.getParameter("checkoutAds");
        checkoutAds = "["+checkoutAds+"]";
        String buyerId = (String) request.getSession().getAttribute("username");
        System.out.println("BUYER IS " + buyerId);

        Gson gson = new Gson();
        int[] ads = gson.fromJson(checkoutAds, int[].class);
        System.out.println("PRINTING AD NUMBERS");
        for (int ad: ads){
            System.out.println(ad);
        }
        System.out.println("FINISH PRINTING AD NUMBERS");
        //get all ads details
        ArrayList<Advertisement> cartAds = new ArrayList<>();
        AdvertisementDAO advertisementDAO = new AdvertisementDAO();
        try {
            for (int ad: ads){
                cartAds.add(advertisementDAO.getAdById(ad));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

//        calculating total price for all books
        int total = 0;
        for (Advertisement ad : cartAds){
            total += ad.getPrice();
        }

//        have to add to orders table
        NewOrdersDAO newOrdersDAO = new NewOrdersDAO();
        Timestamp dateOrdered = new Timestamp(System.currentTimeMillis());
        try {
            newOrdersDAO.addOrder(buyerId, dateOrdered , false, total);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

//        have to get the order id of inserted
        int orderId = 0;
        try {
            orderId = newOrdersDAO.getOrderId(buyerId, dateOrdered);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

//        group all according to seller
        Map<String, List<Advertisement>> adListGrouped = cartAds.stream().collect(Collectors.groupingBy(Advertisement::getSellerId));

//        now have to change the availability of all those ads to unavailable
        for(Advertisement ad: cartAds){
            try {
                advertisementDAO.makeUnavailable(ad);
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }
        }

//        now have to add to order-pickups table
        NewOrderPickupsDAO newOrderPickupsDAO = new NewOrderPickupsDAO();
        NewPickupAdsDAO newPickupAdsDAO = new NewPickupAdsDAO();

        for (String seller: adListGrouped.keySet()) {

            try {
                newOrderPickupsDAO.addPickup(orderId, seller);

//                now have to get the pickup id of inserted value
                int pickupId = newOrderPickupsDAO.getPickupId(orderId, seller);

//                add to payment status table with not paid as initial
                newOrderPickupsDAO.addPickupPaymentStatus(pickupId);

//                now have to add all the ads relevant to that pickup
                for (Advertisement ad: (ArrayList<Advertisement>) adListGrouped.get(seller)){
                    newPickupAdsDAO.addPickupAd(pickupId, (int) ad.getAdId());
                }

            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }
        }

        System.out.println("LEAVING PAYHERESUCCESS SERVLET");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
