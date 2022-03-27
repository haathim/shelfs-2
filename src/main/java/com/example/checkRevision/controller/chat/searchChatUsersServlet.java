package com.example.checkRevision.controller.chat;

import com.example.checkRevision.dao.MessagesDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "searchChatUsersServlet", urlPatterns = {"/buyer/searchChatUsers","/seller/searchChatUsers", "/admin/searchChatUsers", "/delivery/searchChatUsers" })
public class searchChatUsersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("searchTerm");
        System.out.println("Search term is : " + query);
        MessagesDAO messagesDAO = new MessagesDAO();
        StringBuilder output = new StringBuilder();

        try {
            ArrayList<String> chatUsers = messagesDAO.getSearchChatUsers(query);

            for(String chatUser: chatUsers){
                System.out.println("Chat User: "+chatUser);
                output.append("<a href=\"chatPage?otherUser=").append(chatUser).append("\"><div class=\"content\"><div class=\"details\"><span>@").append(chatUser).append(" ").append("</span><p></p></div></div></a>");

            }
            response.getWriter().write(output.toString());
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

}
