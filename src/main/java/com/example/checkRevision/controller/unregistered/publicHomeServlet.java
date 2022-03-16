package com.example.checkRevision.controller.unregistered;

import com.example.checkRevision.EmailSMTP.Email;
import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.fileSystem.AzureUpload;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;

@WebServlet(name = "publicHomeServlet", value = "/public/home")
public class publicHomeServlet extends HttpServlet {
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

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/unregistered/home.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }



    }


}
