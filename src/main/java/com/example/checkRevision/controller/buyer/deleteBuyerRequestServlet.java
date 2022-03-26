package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerRequestDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deleteBuyerRequestServlet", value = "/buyer/deleteBuyerRequest")
public class deleteBuyerRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        int buyerRequestId = Integer.parseInt(request.getParameter("buyerRequestId"));
        BuyerRequestDAO dao = new BuyerRequestDAO();
        try {
            dao.removeBuyerRequestByBuyer(buyerId, buyerRequestId);
            response.sendRedirect("requestBooks");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
