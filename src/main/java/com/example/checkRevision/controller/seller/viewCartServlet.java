//package com.example.checkRevision.controller.seller;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "viewCartServlet", value = "/seller/viewCart")
//public class viewCartServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
////        String username = (String) request.getParameter("username");
////        WishlistDAO dao = new WishlistDAO();
////        try {
////            ArrayList<Advertisement> wishlistAds = dao.getWishlist(username);
//
////        System.out.println("1111");
//
////            for (Advertisement wishlistAd: wishlistAds) {
////                System.out.println(wishlistAd.getAdId());
////            }
//
////            System.out.println("2222");
//
////            request.setAttribute("wishlistAds", wishlistAds);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/view-cart.jsp");
//        dispatcher.forward(request, response);
////        } catch (SQLException | ClassNotFoundException throwables) {
////            throwables.printStackTrace();
////        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
