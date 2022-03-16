package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.WishlistDAO;
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

@WebServlet(name = "favouritesSellerServlet", value = "/seller/favourites")
public class favouritesSellerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        1. Get Username from session
//        1. Get favourites from Database using username
//        2. Send data to favourites page to display

//        String username = (String) request.getSession().getAttribute("username");
        String username = (String) request.getParameter("username");
        WishlistDAO dao = new WishlistDAO();
        try {
            ArrayList<Advertisement> wishlistAds = dao.getWishlist(username);

            System.out.println("1111");

            for (Advertisement wishlistAd: wishlistAds) {
//                System.out.println(wishlistAd.getAdId());
            }

            System.out.println("2222");

            request.setAttribute("wishlistAds", wishlistAds);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/my-favourites.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        1. Get adId from post
//        2. Get username from session
//        3. Create dao method and add to favourites using
//        4. send redirect to same page
    }
}
