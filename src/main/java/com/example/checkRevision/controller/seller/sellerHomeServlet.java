package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "sellerHomeServlet", value = "/seller/home")
public class sellerHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        System.out.println("Beginning");
//
//
//        AdvertisementDAO dao = new AdvertisementDAO();
//
//        try {
//            ArrayList<Advertisement> fictionAds = dao.getAdsByCategory("Fiction");
//            ArrayList<Advertisement> nonFictionAds = dao.getAdsByCategory("Non-Fiction");
//            ArrayList<Advertisement> otherAds = dao.getAdsByCategory("Other");
//
//            System.out.println("Middle");
//
//            request.setAttribute("fictionAds", fictionAds);
//            request.setAttribute("nonFictionAds", nonFictionAds);
//            request.setAttribute("otherAds", otherAds);
//
////            RequestDispatcher dispatcher = request.getRequestDispatcher("/allPages/buyer/home.jsp");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/home.jsp");
//            dispatcher.forward(request, response);
//
//            System.out.println("End");
//
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//
//            System.out.println("Inside Catch");
//        }
        response.sendRedirect("postAd");

    }


}
