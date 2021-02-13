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


@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String Title = request.getParameter("title");
			String Content = request.getParameter("content");
			
			PostDAO dao = new PostDAO(DbConn.getConn());
			boolean f= dao.PostUpdate(noteid, Title, Content);
			
			if(f) {
				System.out.println("Data Updated Successfully!");	
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg","Notes Updated Successfully!");
				response.sendRedirect("ShowNotes.jsp");
			}
			else {
				System.out.println("Data not Updated :)!");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	   
	}
    

}
