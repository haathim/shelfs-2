package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.ComplaintsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "replyToComplaintServlet", value = "/admin/replyToComplaint")
public class replyToComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int complaintId = Integer.parseInt(request.getParameter("complaintId"));
        String replyDescription = request.getParameter("replyDescription");

        ComplaintsDAO dao = new ComplaintsDAO();
        try {
            dao.replyToComplaint(complaintId, replyDescription);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("viewComplaints");

    }
}
