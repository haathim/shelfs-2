package com.example.checkRevision.controller.seller;

import com.example.checkRevision.dao.BuyerRequestDAO;
import com.example.checkRevision.dao.OrdersDAO;
import com.example.checkRevision.model.BuyerRequest;
import com.example.checkRevision.model.OrderAdCombined;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "viewBuyerRequestsMore2Servlet", value = "/seller/viewBuyerRequestsMore2")
public class viewBuyerRequestsMore2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int buyReqId = Integer.parseInt(request.getParameter("buyReqId"));

        BuyerRequestDAO dao = new BuyerRequestDAO();
        try {
            BuyerRequest buyReq = dao.getBuyerRequestById(buyReqId);

            System.out.println(buyReq);

            request.setAttribute("buyReq", buyReq);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/seller/view-buyer-requests-more.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}