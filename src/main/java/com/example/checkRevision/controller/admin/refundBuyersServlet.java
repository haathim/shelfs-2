package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.NewOrderPickupsDAO;
import com.example.checkRevision.model.NewOrderNewOrderPickups;
import com.example.checkRevision.model.NewOrderPickups;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "refundBuyersServlet", value = "/admin/refundBuyers")
public class refundBuyersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("dsfkdfkjdfhdkjshfdkjshfkdsjhfkdjshfdkjshfdkjshfdkjshfdkjshfdkjshfdkjshfkjdshfdkjshfdkjhf");
        NewOrderPickupsDAO dao = new NewOrderPickupsDAO();
        try {
            ArrayList<NewOrderNewOrderPickups> refundDetails = dao.getRefundPickupsDetails();
            request.setAttribute("refundDetails", refundDetails);
            request.getRequestDispatcher("/WEB-INF/allPages/admin/view-refund-buyers.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adId = Integer.parseInt(request.getParameter("adId"));
        NewOrderPickupsDAO dao = new NewOrderPickupsDAO();
        try {
            dao.updateRefundAsRefunded(adId);
            response.sendRedirect("refundBuyers");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
