package com.dao;


import java.util.List;
import java.sql.Connection;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.users.Post;

public class PostDAO {
	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddNotes(String ti, String con, int ui) {

		boolean f = false;
		try {

			String q = "insert into post(title, content, uid) values(?,?,?)";

			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(q);
			ps.setString(1, ti);
			ps.setString(2, con);
			ps.setInt(3, ui);
			ps.executeUpdate();
			
			f = true;
			

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;
	}

	public List<Post> getData(int id) {
		List<Post> list = new ArrayList<Post>();
		Post po = null;
		try {
			String q = "select * from post where uid=? ORDER BY id DESC";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(q);
			ps.setInt(1, id);

			ResultSet rs = (ResultSet) ps.executeQuery();
			while (rs.next()) { 
				po = new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);

			}
		} catch (Exception e) {

		}
		return list;
	}
	
	
//fetch data by id
	
	public Post getDataById(int noteId) {
		Post p = null;
		try {
			String q = "select * from post where id =?";
			
			PreparedStatement ps= (PreparedStatement) conn.prepareStatement(q);
			ps.setInt(1, noteId);
			
			ResultSet rs = (ResultSet) ps.executeQuery();
			if(rs.next()) {
				p = new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	
	
//	 UPDATE EDIT NOTES
	public boolean PostUpdate(int nid, String ti, String co)
	{
		boolean f = false;
		
		try {
			String q = "update post set title=?, content=? where id= ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(q);
		
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, nid);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f= true;
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
//	funtion for deleting notes
	
	public boolean DeleteNotes(int nid) {
		
		boolean f= false;
		try {
			
			String q = "delete from post where id=?";
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(q);
			ps.setInt(1, nid);
			int x = ps.executeUpdate();
			if(x==1)
			{
				f= true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}





