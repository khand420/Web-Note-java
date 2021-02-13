package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConn {
	
	
	private static Connection conn;
	public static  Connection getConn()
	{
		try {
			if(conn == null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_webnote","root","");
			}
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;

	}

}
