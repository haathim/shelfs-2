package com.example.checkRevision.controller.chat;

import com.example.checkRevision.dao.MessagesDAO;
import com.example.checkRevision.model.Message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "insertChatServlet", urlPatterns = {"/buyer/insertChatMessages","/seller/insertChatMessages", "/admin/insertChatMessages", "/delivery/insertChatMessages" })
public class insertChatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String otherUser = request.getParameter("otherUser");
        String message = request.getParameter("message");

        MessagesDAO messagesDAO = new MessagesDAO();
        try {
            messagesDAO.insertChat(username, otherUser, message);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
