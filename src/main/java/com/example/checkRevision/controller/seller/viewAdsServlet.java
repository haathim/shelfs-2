//package com.example.checkRevision.controller.seller;
//
//import com.example.checkRevision.dao.AdvertisementDAO;
//import com.example.checkRevision.model.Advertisement;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//@WebServlet(name = "viewAdsServlet", value = "/seller/viewAds")
//public class viewAdsServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//
//        if(session.getAttribute("userType") == null){
//            response.sendRedirect("loginForm.html");
//            return;
//        }
//        else if((session.getAttribute("userType") != "buyer") && (session.getAttribute("userType") != "seller")){
//            response.sendRedirect("error.html");
//            return;
//
//        }
//
////        get input data
//        String query = request.getParameter("query");
//
////        create dao
//        AdvertisementDAO dao = new AdvertisementDAO();
//
//        try {
//            ArrayList<Advertisement> adResults = dao.viewAdvertisements(query);
//
//            for (Advertisement ad: adResults) {
//                System.out.println(ad.getTitle());
//            }
//            request.setAttribute("adResults", adResults);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAds.jsp");
//            dispatcher.forward(request, response);
//
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
//
//    }
//
//}
