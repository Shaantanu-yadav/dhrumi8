package com.gulbrandsen.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gulbrandsen.ProductMasterDao;
import com.gulbrandsen.Productmaster;

 
@WebServlet("/SelectAll")
public class SelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public SelectAll() {
        super();
       
    }

  	
    public void displayTable(HttpServletRequest request, HttpServletResponse response)
                          throws ServletExeption, IOException {
    	try {
    		ProductMasterDao productDao =new ProductMasterDao (null);
    		List<Productmaster>displayTable = productDao.selectAll();  
    		request.setAttribute("displaytable", displayTable);
    		RequestDispatcher rd = request.getRequestDispatcher("Product_mst.jsp");
    		rd.forward(request, response);
    	} catch (Exception e) {
    		e.printStackTrace();
    	
    	}
    }
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
