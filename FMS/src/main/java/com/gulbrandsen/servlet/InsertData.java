package com.gulbrandsen.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertData")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
    public InsertData() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			String productgroup = request.getParameter("productGroup");
	    	String productcode = request.getParameter("productCode");
	    	String productname = request.getParameter("productName");
	    	String sap = request.getParameter("sap");
	    	String status = request.getParameter("status"); 
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "1234");
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement("insert into test.product_master(product_group, product_abbr,product_name, Sap,status,creation_date_time) VALUES (?,?,?,?,?)");
			ps.setString(1, productgroup);
			ps.setString(2, productcode);
			ps.setString(3, productname);
			ps.setString(4, sap); 
			ps.setString(5, status);
			ps.setDate(6, new java.sql.Date( Calender.getInstance() .getTimeInMillis() ));
			int x = ps.executeUpdate();
			if(x > 0) {
	
				RequestDispatcher rd =request.getRequestDispatcher("/productmaster.jsp");
				rd.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.print("Not Done");
			}
			ps.close();
		}
		
		catch(Exception e) {
			PrintWriter out = response.getWriter();
			out.print(e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		
	}

}