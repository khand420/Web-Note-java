package com.dao;

import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.users.UsersDetails;

public class UsersDAO {

	private Connection conn;

	public UsersDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UsersDetails us) {
		boolean f = false;
		try {
			String query = "insert into users(fname, email, password) value(?,?,?)";

			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public UsersDetails loginUser(UsersDetails us) {

		UsersDetails user = null;
		try {
			String query = "select * from users where email=? and password =?";

			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
		    ResultSet rs = (ResultSet) ps.executeQuery();

			if (rs.next()) {
				
				user = new UsersDetails();    
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("fname"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");		
				}

		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return  user;
		

	}

}
