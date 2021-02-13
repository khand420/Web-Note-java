package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UsersDAO;
import com.db.DbConn;
import com.users.UsersDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UsersDetails us = new UsersDetails();
		us.setEmail(email);
		us.setPassword(password);

		UsersDAO dao = new UsersDAO(DbConn.getConn());
		UsersDetails user = dao.loginUser(us);

		if (user != null) {
			HttpSession session= request.getSession();
			session.setAttribute("userD", user);
			
			response.sendRedirect("home.jsp");
		} 
		else {
//			System.out.print("Something went wrong");
			HttpSession session = request.getSession();
			session.setAttribute("login-failed", "Invalid UserName and Password");
			response.sendRedirect("login.jsp");

		}
	}

}
