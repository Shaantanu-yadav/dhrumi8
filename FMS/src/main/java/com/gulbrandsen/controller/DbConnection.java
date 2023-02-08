package com.gulbrandsen.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
     private static Connection conn;
     
     
     public static  Connection getconn() {
    	 try {
    		 Class.forName("com.mysql.cj.jdbc.Driver");
    		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1234");
    	    }catch (Exception e) {
    	    	e.printStackTrace();
    	    }
    	     return conn;
    	  }
     }

