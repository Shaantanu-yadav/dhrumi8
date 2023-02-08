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

import com.gulbrandsen.ProductMasterDao;

@WebServlet("/UpdateData")
public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateData() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productgroup = request.getParameter("productGroup");
		String productcode = request.getParameter("productCode");
		String productname = request.getParameter("productName");
		String sapproductcode = request.getParameter("sap");
		String status = request.getParameter("status");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1234");

			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(
					"update test.product_master set product_group=?, product_abbr=?, product_name=?, status=?, cmp_id=? where product_id=?");

			ps.setString(1, productgroup);
			ps.setString(2, productcode);
			ps.setString(3, productname);
			ps.setString(4, sapproductcode);
			ps.setString(5, status);
			ps.setString(6, productgroup);
			ps.setDate(7, new java.sql.Date( Calender.getInstance() .getTimeInMillis() ));
			ps.executeUpdate();

			RequestDispatcher rd = request.getRequestDispatcher("/productmaster.jsp");
			rd.forward(request, response);

			ps.close();
		}

		catch (Exception e) {
			PrintWriter out = response.getWriter();
			out.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}