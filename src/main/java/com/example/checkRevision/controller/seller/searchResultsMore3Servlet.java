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
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet(name = "searchResultsMore3Servlet", value = "/seller/searchResultsMore")
//public class searchResultsMore3Servlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int adId = Integer.parseInt(request.getParameter("adId"));
//
//        AdvertisementDAO dao = new AdvertisementDAO();
//        try {
//            Advertisement ad = dao.getAdById(adId);
//            request.setAttribute("ad", ad);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/search-results-more.jsp");
//            dispatcher.forward(request, response);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
//
//
//    }
//
//}
