package com.gulbrandsen.login;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@WebServlet("/GoogleLogin")
public class GoogleLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
		User username = userService.getCurrentUser();
		if (!userService.isUserLoggedIn() || userService.getCurrentUser() == null) {
			response.sendRedirect(userService.createLoginURL("/GoogleLogin"));
		} else {

			request.getSession().setAttribute("username", username);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/header.jsp");
            rd.include(request, response);
		}
	}

}
