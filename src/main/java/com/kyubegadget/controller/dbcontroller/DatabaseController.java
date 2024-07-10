package com.kyubegadget.controller.dbcontroller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


// this methods creates connection with database
public class DatabaseController {
    public static Connection getConn() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = ("jdbc:mysql://localhost:3306/kyube");
        String username = "root";
        String password = "";
        System.out.println("Connected to database");
        return DriverManager.getConnection(url, username, password);
    }
	
}