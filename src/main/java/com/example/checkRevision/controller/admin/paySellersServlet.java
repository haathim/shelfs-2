package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.model.SellersPayment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "paySellersServlet", value = "/admin/paySellers")
public class paySellersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        NewOrderPickupsDAO dao = new NewOrderPickupsDAO();
        try {
            ArrayList<SellersPayment> sellersPayments = dao.getToBePayedSellers();
            request.setAttribute("sellersPayments", sellersPayments);
            request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_manage_sellers.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pickupId = Integer.parseInt(request.getParameter("pickupId"));
        NewOrderPickupsDAO dao = new NewOrderPickupsDAO();
        try {
            dao.updatePickupPaymentStatus(pickupId);
            response.sendRedirect("paySellers");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }
}
