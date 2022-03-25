package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.dao.SellerApplicationDAO;
import com.example.checkRevision.fileSystem.MyFileHandler;
import com.example.checkRevision.variables.MyVariables;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;

@WebServlet(name = "sellerApplicationServlet", value = "/buyer/sellerApplication")
@MultipartConfig(maxFileSize=1024*1024*2, maxRequestSize=1024*1024*10)
public class sellerApplicationServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        BuyerDAO buyerDAO = new BuyerDAO();
        String district = null;
        try {
            district = buyerDAO.getBuyerDistrict(buyerId);
            if (!district.equals("Colombo")){
                response.sendRedirect("buyerOutOfColombo");
                return;
            }else{
                SellerApplicationDAO dao = new SellerApplicationDAO();
                try {
                    if(dao.isSellerApplied(buyerId)){
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/already-applied.jsp");
                        dispatcher.forward(request, response);
                    }
                    else{
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/seller-application.jsp");
                        dispatcher.forward(request, response);
                    }
                } catch (SQLException | ClassNotFoundException throwables) {
                    throwables.printStackTrace();
                }
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        BuyerDAO buyerDAO = new BuyerDAO();
        String district = null;
        try {
            district = buyerDAO.getBuyerDistrict(buyerId);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        if (!district.equals("Colombo")){
            response.sendRedirect("buyerOutOfColombo");
            return;
        }
        ///
        String nicNo = request.getParameter("nicNo");
        Part nicFront = request.getPart("nicFront");
        Part nicBack = request.getPart("nicBack");

        String bankAccountNo = request.getParameter("bankAccountNo");
        String bankName = request.getParameter("bankName");
        String bankBranch = request.getParameter("bankBranch");


        if(!validateInput(nicNo, nicFront, nicBack, bankAccountNo, bankName, bankBranch)){
                System.out.println("Didn't pass validation.");
                response.sendRedirect("../inputError.html");
                return;
            }

            SellerApplicationDAO sellerAppDao = new SellerApplicationDAO();
            try {
                if (sellerAppDao.isSellerApplied(buyerId)){
                    return;
                }
            } catch (SQLException | ClassNotFoundException throwables) {
                throwables.printStackTrace();
            }

            BuyerDAO dao = new BuyerDAO();
                try {
                    dao.applySeller(buyerId, nicFront, nicBack, nicNo, bankAccountNo, bankName, bankBranch);
                    response.sendRedirect("home");
                } catch (SQLException | ClassNotFoundException throwables) {
                    throwables.printStackTrace();
                }
    }

    public boolean validateInput(String nicNo, Part nicFront, Part nicBack, String bankAccountNo, String bankName, String bankBranch){
        System.out.println("Entering Validation....");

//        checking NIC
        if (!nicNo.matches("([0-9]{12}|[0-9]{9}(v|V|x|X))")) {
            System.out.println(1);
            return false;
        }

//        have to complete regex for bank details
//        if (!bankAccountNo.matches("")) {
//            System.out.println(1);
//            return false;
//        }
//
//        if (!bankName.matches("")) {
//            System.out.println(1);
//            return false;
//        }
//
//        if (!bankBranch.matches("")) {
//            System.out.println(1);
//            return false;
//        }

//        checking if file is really an image
        MyFileHandler fileHandler = new MyFileHandler();
        if(!fileHandler.validateImage(nicFront)){
            return false;
        }
        if(!fileHandler.validateImage(nicBack)){
            return false;
        }

        return true;
    }
}
