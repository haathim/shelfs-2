package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.model.Buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "changeAccountDetailsBuyer", value = "/buyer/changeAccountDetailsBuyer")
public class changeAccountDetailsBuyer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        System.out.println("step 1");
        String houseNo = request.getParameter("houseNo");
        System.out.println("hNo"+ houseNo);
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String phoneNo = request.getParameter("phoneNo");
        String district = request.getParameter("district");
        String province = request.getParameter("province");

        Buyer buyer = new Buyer(username, "", "", 0, null, "", "", houseNo, street, city, district, "", false, phoneNo, "");

        BuyerDAO dao = new BuyerDAO();
        try {
            System.out.println("step 2");
            dao.updateBuyer(username, houseNo, street, city, phoneNo, district, province);
            response.sendRedirect("settings");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
