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

@WebServlet(name = "postAdvertisementServlet", value = "/seller/postAd")
@MultipartConfig(maxFileSize=1024*1024*2, maxRequestSize=1024*1024*10)
public class postAdvertisementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("1111");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/post-book.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String sellerId = (String) request.getSession().getAttribute("username");

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        System.out.println("Before");
        int price = Integer.parseInt(request.getParameter("price"));
        System.out.println("After");
        String isbn = request.getParameter("isbn");
        String language = request.getParameter("language");
        String description = request.getParameter("description");
        Part frontPhoto = request.getPart("frontPhoto");
        Part backPhoto = request.getPart("backPhoto");
        String category = request.getParameter("category");

        //check if input satisfies conditions --> if any errors show error page (shouldn't be able to do from front end anyway)
        if(!validateInput(title, author, price, isbn, language, description, category, frontPhoto, backPhoto)){
            System.out.println("Didn't pass validation.");
            response.sendRedirect("../inputError.html");
            return;
        }

//      create advertisement object to hold data
        Advertisement newAd = new Advertisement(-1, sellerId, title, author, price, isbn, language, 1, description, "", "", category, new Timestamp(System.currentTimeMillis()));

        AdvertisementDAO dao = new AdvertisementDAO();
        try {

            dao.addAdvertisement(newAd, frontPhoto, backPhoto);
            response.sendRedirect("home");
            return;
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
            System.out.println("Error - 1");
            response.sendRedirect("../error.html");
            return;
        }



    }

    public boolean validateInput(String title, String author, int price, String isbn, String language, String description, String category, Part frontPhoto, Part backPhoto){
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
        if(!fileHandler.validateImage(frontPhoto)){
            return false;
        }
        if(!fileHandler.validateImage(frontPhoto)){
            return false;
        }
        return true;
    }
}
