package com.example.checkRevision.dao;

import com.example.checkRevision.database.DBConnection;
import com.example.checkRevision.model.ChatUser;
import com.example.checkRevision.model.Message;
//

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessagesDAO {

    public MessagesDAO() {
    }

    public ArrayList<Message> getChat(String username, String otherUser) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

//        String sql = "SELECT * FROM messages LEFT JOIN users ON users.username = messages.outgoing_msg_user_id WHERE (outgoing_msg_user_id = ? AND incoming_msg_user_id = ?) OR (outgoing_msg_user_id = ? AND incoming_msg_user_id = ?) ORDER BY msg_id;";
        String sql = "SELECT * FROM messages WHERE (outgoing_msg_user_id = ? AND incoming_msg_user_id = ?) OR (outgoing_msg_user_id = ? AND incoming_msg_user_id = ?) ORDER BY msg_id;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, otherUser);
        stmt.setString(3, otherUser);
        stmt.setString(4, username);

        ResultSet result = stmt.executeQuery();

        ArrayList<Message> messages = new ArrayList<>();

        while(result.next()){

            int messageId = result.getInt(1);
            String incomingUserId = result.getString(2);
            String outgoingUserId = result.getString(3);
            String messageContent = result.getString(4);

            messages.add(new Message(messageId, incomingUserId, outgoingUserId, messageContent));

        }

        return messages;

    }

    public ArrayList<String> getChatUsers(String username) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM messages WHERE outgoing_msg_user_id = ? OR incoming_msg_user_id = ? ORDER BY msg_id DESC;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, username);

        ResultSet result = stmt.executeQuery();

        ArrayList<String> chatUsers = new ArrayList<>();

        while(result.next()){
//            int messageId = result.getInt(1);
            String incomingUser = result.getString(2);
            String outgoingUser = result.getString(3);

            if (incomingUser.equals(username)){
                if (!chatUsers.contains(outgoingUser)){
                    chatUsers.add(outgoingUser);
                }
            }else{
                if (!chatUsers.contains(incomingUser)){
                    chatUsers.add(incomingUser);
                }
            }
        }

        return chatUsers;

    }

    public void insertChat(String username, String otherUser, String message) throws SQLException, ClassNotFoundException {

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO messages (incoming_msg_user_id, outgoing_msg_user_id, msg) VALUES (?,?,?);";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, otherUser);
        stmt.setString(2, username);
        stmt.setString(3, message);

        stmt.executeUpdate();


    }


    public ArrayList<String> getSearchChatUsers(String query) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT username FROM users WHERE username LIKE ?;";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, "%"+query+"%");

        ResultSet result = stmt.executeQuery();

        ArrayList<String> chatUsers = new ArrayList<>();

        while(result.next()){

            String username = result.getString(1);
            chatUsers.add(username);
        }

        return chatUsers;
    }
}
