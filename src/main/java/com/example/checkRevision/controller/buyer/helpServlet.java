package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.ComplaintsDAO;
import com.example.checkRevision.model.Complaint;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "helpServlet", value = "/buyer/help")
public class helpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        ComplaintsDAO dao = new ComplaintsDAO();
        try {
            ArrayList<Complaint> buyersComplaintReplies = dao.buyersComplaintReplies(buyerId);
            request.setAttribute("buyersComplaintReplies", buyersComplaintReplies);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/help.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String buyerId = (String) request.getSession().getAttribute("username");
        String complaintTitle = request.getParameter("complaintTitle");
        String complaintDescription = request.getParameter("complaintDescription");

        ComplaintsDAO dao = new ComplaintsDAO();
        try {
            dao.addComplaint(buyerId, complaintTitle, complaintDescription);
            response.sendRedirect("help");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
