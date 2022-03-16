package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "buyerHomeServlet", value = "/buyer/home")
public class buyerHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        AdvertisementDAO dao = new AdvertisementDAO();

        try {
            ArrayList<Advertisement> fictionAds = dao.getAdsByCategory("Fiction");
            ArrayList<Advertisement> nonFictionAds = dao.getAdsByCategory("Non-Fiction");
            ArrayList<Advertisement> otherAds = dao.getAdsByCategory("Other");

            request.setAttribute("fictionAds", fictionAds);
            request.setAttribute("nonFictionAds", nonFictionAds);
            request.setAttribute("otherAds", otherAds);

//            RequestDispatcher dispatcher = request.getRequestDispatcher("/allPages/buyer/home.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/home.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }


}
