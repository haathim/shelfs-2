package com.example.checkRevision.controller.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "helpServlet", value = "/buyer/help")
public class helpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String username = (String) request.getParameter("username");
//        WishlistDAO dao = new WishlistDAO();
//        try {
//            ArrayList<Advertisement> wishlistAds = dao.getWishlist(username);

//        System.out.println("1111");

//            for (Advertisement wishlistAd: wishlistAds) {
//                System.out.println(wishlistAd.getAdId());
//            }

//            System.out.println("2222");

//            request.setAttribute("wishlistAds", wishlistAds);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/help.jsp");
        dispatcher.forward(request, response);
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
