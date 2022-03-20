package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.ComplaintsDAO;
import com.example.checkRevision.model.Complaint;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "viewComplaintsServlet", value = "/admin/viewComplaints")
public class viewComplaintsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ComplaintsDAO dao = new ComplaintsDAO();
        try {
            ArrayList<Complaint> complaints = dao.getComplaints();
            request.setAttribute("complaints", complaints);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_complain_home.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
