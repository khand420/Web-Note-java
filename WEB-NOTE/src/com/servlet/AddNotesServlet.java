package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDAO;
import com.db.DbConn;

import com.users.Post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		PostDAO dao = new PostDAO(DbConn.getConn());
		boolean f = dao.AddNotes(content, title, uid);

		if (f) {
			System.out.println("insert success");
			response.sendRedirect("ShowNotes.jsp");
			
		} else {
			System.out.println("Data not inserted");
		}

	}

}
