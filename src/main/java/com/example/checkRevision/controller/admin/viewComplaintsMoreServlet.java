package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.ComplaintsDAO;
import com.example.checkRevision.model.Complaint;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewComplaintsMoreServlet", value = "/admin/viewComplaintsMore")
public class viewComplaintsMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int complaintId = Integer.parseInt(request.getParameter("complaintId"));
        ComplaintsDAO dao = new ComplaintsDAO();
        try {
            Complaint complaint = dao.getComplaintDetails(complaintId);
            request.setAttribute("complaint", complaint);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_complain_pg.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
