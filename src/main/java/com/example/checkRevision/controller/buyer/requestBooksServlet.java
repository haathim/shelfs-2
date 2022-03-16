package com.example.checkRevision.controller.buyer;

import com.example.checkRevision.dao.BuyerRequestDAO;
import com.example.checkRevision.model.BuyerRequest;
import com.example.checkRevision.variables.MyVariables;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "requestBooksServlet", value = "/buyer/requestBooks")
public class requestBooksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/allPages/buyer/request-book-form.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        int preferredPrice = Integer.parseInt(request.getParameter("preferredPrice"));
        String comment = request.getParameter("comment");

        if(!validateInput(title,author,category,preferredPrice,comment)){
            response.sendRedirect("../inputError.html");
            System.out.println("ENTERING IF BLOCK");
            return;
        }

        BuyerRequest buyerRequest = new BuyerRequest(-1, username, title, author, new Timestamp(System.currentTimeMillis()), category, comment, preferredPrice);

        BuyerRequestDAO dao = new BuyerRequestDAO();

        try {
            dao.addBuyerRequest(buyerRequest);
            response.sendRedirect("requestBooks?username="+username);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    public boolean validateInput(String title, String author, String category, int preferredPrice, String comment){

        System.out.println("ENTERING REQUEST BOOK VALIDATION");

        if (!title.matches("[\\w\\s\\.,!&\\?]{1,50}")) {
            System.out.println(1);
            return false;
        }

        if (!(author.matches("([a-zA-Z]|\\s|\\.){3,50}") )) {
            System.out.println(2);
            return false;
        }

        if (!MyVariables.getCategories().contains(category)) {
            System.out.println(3);
            return false;
        }

        if (preferredPrice < 0 || preferredPrice > 10000) {
            System.out.println(4);
            return false;
        }

        if (!comment.matches("[\\w\\s\\.,!&\\?]{1,500}")) {
            System.out.println(5);
            return false;
        }

        return true;
    }
}
