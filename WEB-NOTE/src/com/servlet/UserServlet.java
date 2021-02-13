package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UsersDAO;
import com.db.DbConn;
import com.users.UsersDetails; 



@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	 String name = request.getParameter("fname");
	 String email = request.getParameter("email");
	 String password = request.getParameter("password");
	 
	 UsersDetails us = new UsersDetails();
	 us.setName(name);
	 us.setEmail(email);
	 us.setPassword(password);  
	 
	 UsersDAO dao = new UsersDAO(DbConn.getConn());
	 boolean f = dao.addUser(us);
//	 PrintWriter out = response.getWriter();
	 HttpSession session;

	 
	 if(f){
		 session = request.getSession();
	     session.setAttribute("reg-success", "Registration Successfully..");
		 response.sendRedirect("register.jsp");	 
        }
	 else {
	     session = request.getSession();
		 session.setAttribute("Failed-msg", "Something went Wrong :)");
		 response.sendRedirect("register.jsp");
	 }
	
		
	}
	
	

}
