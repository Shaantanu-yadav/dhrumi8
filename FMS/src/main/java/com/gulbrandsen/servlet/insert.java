package com.gulbrandsen.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gulbrandsen.Productmaster;
import com.gulbrandsen.controller.DbConnection;
import com.gulbrandsen.ProductMasterDao;

@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public insert() {
        super();
       
    }
    protected void insertRow(HttpServletRequest request, HttpServletResponse response)
                               throws SQLException, IOException {
    	ProductMasterDao productDao = new ProductMasterDao(DbConnection.getconn());
    	
    	String productgroup = request.getParameter("productgroup");
    	String productcode = request.getParameter("productcode");
    	String productname = request.getParameter("productname");
    	String sapproductcode = request.getParameter("sapproductcode");
    	String status = request.getParameter("status");
    	Productmaster newRow = new Productmaster(productgroup, productcode, productname, sapproductcode, status);
    	
    	productDao.insertRecord(newRow);
    	response.sendRedirect("");
    	response.getWriter().append("").append(request.getContextPath());
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	try {
		insertRow(request, response);
	}catch (SQLException e) {
		e.printStackTrace();
	}catch (IOException e)  {
		e.printStackTrace();
	}
  }

}  





