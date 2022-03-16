package com.example.checkRevision.database;

import java.sql.*;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //singleton pattern
        if(connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/shelfs", "root","");


//            String url ="jdbc:mysql://shelfsserver12.mysql.database.azure.com:3306/shelfs?useSSL=false&requireSSL=false";
//            connection = DriverManager.getConnection(url, "shelfsAdmin@shelfsserver12", "UCSCgroup12");


        }
        return connection;
    }
}
