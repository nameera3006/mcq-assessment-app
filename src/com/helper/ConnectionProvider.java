package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
	
		try {

			if(con==null) {
			//driver class load
			Class.forName("com.mysql.jdbc.Driver");
			
			
			String url = "jdbc:mysql://34.93.32.54/mcq_app_db?useSSL=false";
			String username = "nameera";
			String pwd = "dsag@3443DD@%jcskdl";
			
			con = DriverManager.getConnection(url, username, pwd);

			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
				
	}
}
