package com.example.checkRevision.controller.chat;

import com.example.checkRevision.dao.MessagesDAO;
import com.example.checkRevision.model.Message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "getChatServlet", urlPatterns = {"/buyer/getChatMessages", "/seller/getChatMessages", "/admin/getChatMessages", "/delivery/getChatMessages" })
public class getChatServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String otherUser = request.getParameter("otherUser");
        StringBuilder output = new StringBuilder();
        MessagesDAO messagesDAO = new MessagesDAO();
        try {
            ArrayList<Message> messages = messagesDAO.getChat(username, otherUser);
            if (messages.size() > 0){
                for (Message message : messages) {
                    if (message.getOutgoingUserId().equals(username)) {
                        output.append("<div class=\"chat outgoing\"> <div class=\"details\"> <p>").append(message.getMessageContent()).append("</p> </div> </div>");

                    } else {
                        output.append("<div class=\"chat incoming\"> <div class=\"details\"> <p>").append(message.getMessageContent()).append("</p> </div> </div>");
                    }
                }
            }else{
                output.append("<div class=\"text\">No messages are available. Once you send message they will appear here.</div>");
            }
            response.getWriter().write(output.toString());
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
