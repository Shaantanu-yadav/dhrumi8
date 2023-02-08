package com.gulbrandsen;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;


@WebServlet("/login")
public class Login extends HttpServlet {
	


	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		
		
	    LoginDao dao =new LoginDao();
        if(dao.check(uname, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", uname);
            
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/header.jsp");
            rd.include(request, response);
        }else {
        	request.setAttribute("error", "Invalid Username And Password");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
            rd.include(request, response);
            
        }
		
	}

}
