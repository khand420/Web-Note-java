 package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DbConn;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer noteid= Integer.parseInt(request.getParameter("note_id"));
		
//		create post dao object for deleting notes
		PostDAO dao = new PostDAO(DbConn.getConn());
		
		boolean f= dao.DeleteNotes(noteid);
		HttpSession session= null;
		
		if(f) {
		    session= request.getSession();
			session.setAttribute("DeleteMsg", "Notes Deleted Successufully..");
			response.sendRedirect("ShowNotes.jsp");
		}
		else {
			session =request.getSession();
			session.setAttribute("wrong", "Something Went Wrong On Server :( ");
			response.sendRedirect("ShowNotes.jsp");
		}
		

	}


}
