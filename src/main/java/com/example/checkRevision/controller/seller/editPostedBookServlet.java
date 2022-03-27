package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.model.Advertisement;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "editPostedBookServlet", value = "/seller/editPostedBook")
@MultipartConfig(maxFileSize=1024*1024*2, maxRequestSize=1024*1024*10)
public class editPostedBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String sellerId = (String) request.getSession().getAttribute("username");

        int adId = Integer.parseInt(request.getParameter("adId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int price = Integer.parseInt(request.getParameter("price"));
        String isbn = request.getParameter("isbn");
        String language = request.getParameter("language");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        Part frontPhoto = request.getPart("frontPhoto");
        Part backPhoto = request.getPart("backPhoto");

        boolean validateFrontPhoto = frontPhoto.getSize() > 0;
        boolean validateBackPhoto = backPhoto.getSize() > 0;

//
        //check if input satisfies conditions --> if any errors show error page (shouldn't be able to do from front end anyway)
        if(!validateInput(title, author, price, isbn, language, description, category, frontPhoto, backPhoto,validateFrontPhoto,validateBackPhoto)){
            System.out.println("Didn't pass validation.");
            response.sendRedirect("../inputError.html");
            return;
        }

        Advertisement newAd = new Advertisement(-1, sellerId, title, author, price, isbn, language, 1, description, "", "", category, new Timestamp(System.currentTimeMillis()));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {

            dao.updateAdvertisement(adId, sellerId, newAd, frontPhoto, backPhoto, validateFrontPhoto, validateBackPhoto);
            response.sendRedirect("viewPostedAdsMore?adId="+adId);
            return;
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
            System.out.println("Error - 1");
            response.sendRedirect("../error.html");
            return;
        }



    }

    public boolean validateInput(String title, String author, int price, String isbn, String language, String description, String category, Part frontPhoto, Part backPhoto, boolean validateFrontPhoto, boolean validateBackPhoto){
        System.out.println("Entering Validation....");

        if (!title.matches("[\\w\\s?!,.]{1,40}")) {
            System.out.println(1);
            return false;
        }
        if(!author.matches("[a-zA-Z.\\s]{1,30}")) {
            System.out.println(2);
            return false;
        }
        if(price > 10000) {
            System.out.println(3);
            return false;
        }
        if(!isbn.matches("\\d{13}")) {
            System.out.println(4);
            return false;
        }
        if(!MyVariables.getLanguages().contains(language)) {
            System.out.println(5);
            return false;
        }
        if(!description.matches("[\\w\\s.,!&?]{1,500}")) {
            System.out.println(6);
            return false;
        }
        if(!MyVariables.getCategories().contains(category)) {
            System.out.println(7);
            return false;
        }

//        check if image files are images
        MyFileHandler fileHandler = new MyFileHandler();
        if (validateFrontPhoto){
            if (!fileHandler.validateImage(frontPhoto)) {
                System.out.println(8);
                return false;
            }
        }
        if (validateBackPhoto){
            if (!fileHandler.validateImage(frontPhoto)) {
                System.out.println(9);
                return false;
            }
        }
        return true;
    }
}
