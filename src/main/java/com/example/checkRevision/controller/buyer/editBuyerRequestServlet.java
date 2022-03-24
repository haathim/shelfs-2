package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerRequestDAO;
import com.example.checkRevision.model.BuyerRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;

@WebServlet(name = "editBuyerRequestServlet", value = "/buyer/editBuyerRequest")
public class editBuyerRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        int buyerRequestId = Integer.parseInt(request.getParameter("buyerRequestId"));
        BuyerRequestDAO dao = new BuyerRequestDAO();
        try {
            BuyerRequest buyerRequestDetails = dao.getBuyerRequestByIdOfBuyer(buyerId, buyerRequestId);
            request.setAttribute("buyerRequestDetails", buyerRequestDetails);
            request.getRequestDispatcher("/WEB-INF/allPages/buyer/editBuyerRequest.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        int buyerRequestId = Integer.parseInt(request.getParameter("buyerRequestId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String comment = request.getParameter("comment");
        String category = request.getParameter("category");
        int preferredPrice = Integer.parseInt(request.getParameter("preferredPrice"));

        BuyerRequest buyerRequest = new BuyerRequest(buyerRequestId, buyerId, title, author,new Timestamp(System.currentTimeMillis()), category, comment, preferredPrice);
        BuyerRequestDAO dao = new BuyerRequestDAO();
        try {
            dao.updateBuyerRequest(buyerRequest);
            response.sendRedirect("requestBooks");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
