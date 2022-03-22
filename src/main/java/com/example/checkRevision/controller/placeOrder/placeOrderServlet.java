package com.example.checkRevision.controller.placeOrder;

import com.example.checkRevision.dao.*;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.model.NewOrder;

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

//@WebServlet(name = "placeOrderServlet", urlPatterns ={"/buyer/placeOrder", "/seller/placeOrder"})
@WebServlet(name = "placeOrderServlet", value = "/placeOrder")

public class placeOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//      PLACING ORDER ONCE EVERYTHING IS CONFIRMED

//        HttpSession session = request.getSession();


//        here should get the username of the buyer but for testing purposes for now using a hardcoded value
//        String buyerId = (String) session.getAttribute("username");
        String buyerId = "buyer2";

        AdvertisementDAO advertisementDAO = new AdvertisementDAO();


        //imagine get all the cart details from the session or some request
        ArrayList<Advertisement> cartAds = new ArrayList<>();

        try {
//            cartAds.add(advertisementDAO.getAdById(4));
//            cartAds.add(advertisementDAO.getAdById(5));
//            cartAds.add(advertisementDAO.getAdById(6));
//            cartAds.add(advertisementDAO.getAdById(7));
//
//            cartAds.add(advertisementDAO.getAdById(20));
//            cartAds.add(advertisementDAO.getAdById(21));
//            cartAds.add(advertisementDAO.getAdById(22));
            cartAds.add(advertisementDAO.getAdById(44));
            cartAds.add(advertisementDAO.getAdById(69));
            cartAds.add(advertisementDAO.getAdById(76));
            cartAds.add(advertisementDAO.getAdById(80));


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
//        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//        ASSIGNING DELIVERIES

//        just to test assigning deliverer
//        try {
//            newOrderPickupsDAO.assignDelivererForPickup(13, "delivery1");
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }

//        get order id of pickup
//        int orderIdOfPickup = -1;
//        try {
//            orderIdOfPickup = newOrderPickupsDAO.getOrderIdOfPickup(13);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }

//        code to check if all pickups are 2
//        ArrayList<Integer> allPickupsStatusOfOrderId = null;
//        try {
//            allPickupsStatusOfOrderId = newOrderPickupsDAO.getAllPickupsStatusOfOrderId(orderIdOfPickup);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
//        boolean allDone = true;
//        for (int pickupStatus: allPickupsStatusOfOrderId){
//            if (pickupStatus != 2){
//                System.out.println("All Pickups are not yet complete");
//                allDone = false;
//                break;
//            }
//        }

//        if (allDone){
//            System.out.println("All the pickups are done.");
//
////            now have to change order table status to 1
//            try {
//                newOrdersDAO.updateOrderStatus(orderId, 1);
//            } catch (SQLException | ClassNotFoundException throwables) {
//                throwables.printStackTrace();
//            }
//        }


//        find all courier orders
//        What details do we get about the couriers? is it all the details?

//        try {
//            ArrayList<NewOrder> courierOrders = newOrdersDAO.getCourierOrders();
//            for (NewOrder courOrd: courierOrders){
//                System.out.println(courOrd);
//            }
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }




    }
}
