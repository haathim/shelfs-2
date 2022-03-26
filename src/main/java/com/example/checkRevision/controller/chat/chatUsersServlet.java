package com.example.checkRevision.controller.chat;

import com.example.checkRevision.dao.MessagesDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "chatUsersServlet", urlPatterns = {"/buyer/chatUsers","/seller/chatUsers", "/admin/chatUsers", "/delivery/chatUsers" })
public class chatUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        MessagesDAO messagesDAO = new MessagesDAO();
        StringBuilder output = new StringBuilder();
        try {
            ArrayList<String> chatUsers = messagesDAO.getChatUsers(username);
            for(String chatUser: chatUsers){
                output.append("<a href=\"chatPage?otherUser=").append(chatUser).append("\"><div class=\"content\"><div class=\"details\"><span>@").append(chatUser).append(" ").append("</span><p></p></div></div></a>");

            }
            response.getWriter().write(output.toString());

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
