    //package com.example.checkRevision.controller.unregistered;
//
//import com.example.checkRevision.dao.AdvertisementDAO;
//import com.example.checkRevision.model.Advertisement;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//@WebServlet(name = "searchResults2Servlet", value = "/public/searchResults")
//public class searchResults2Servlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String query = request.getParameter("query");
//
//
//
////        create dao
//        AdvertisementDAO dao = new AdvertisementDAO();
//        try {
//            ArrayList<Advertisement> resultAds = dao.viewAdvertisements(query);
//
//            for (Advertisement ad: resultAds) {
//                System.out.println(ad.getTitle());
//            }
//            request.setAttribute("resultAds", resultAds);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/unregistered/search-results.jsp");
//            dispatcher.forward(request, response);
//
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
//    }
//
//}
