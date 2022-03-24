package com.example.checkRevision.controller.delivery;

import com.example.checkRevision.dao.NewOrderPickupsDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "rejectPickupAdServlet", value = "/delivery/rejectPickupAd")
public class rejectPickupAdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adId = Integer.parseInt(request.getParameter("adId"));
        String deliverer = (String) request.getSession().getAttribute("username");
        NewOrderPickupsDAO dao = new NewOrderPickupsDAO();
        try {
            dao.rejectPickupAd(adId,deliverer);
            response.sendRedirect("pendingPickupsNew");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

}
