package com.example.checkRevision.controller.admin;

import com.example.checkRevision.dao.BuyerDAO;
import com.example.checkRevision.dao.UserDAO;
import com.example.checkRevision.model.Seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "adminViewUsersMoreServlet", value = "/admin/viewUsersMore")
public class adminViewUsersMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO userDAO = new UserDAO();
        BuyerDAO buyerDAO = new BuyerDAO();
        try {
            int userType = userDAO.isWhatType(username);
            Seller user = buyerDAO.getBuyerDetails(username);
//            if(userType == 2){
//
//            }else if (userType == 3){
//
//            }else{
//                response.getWriter().println("Resourse doesn't exist");
//            }
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/admin/thisura/admin_manage_users_more.jsp");
            dispatcher.forward(request, response);



        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
