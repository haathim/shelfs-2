package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.WishlistDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "deletefromwishlist", value = "/buyer/deletefromwishlist")
public class deletefromwishlist extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/my-favourites.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        int adId = Integer.parseInt(request.getParameter("adId"));

        WishlistDAO dao = new WishlistDAO();
        try {
            dao.removeFromWishlist(adId, username);
            response.sendRedirect("favourites");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
