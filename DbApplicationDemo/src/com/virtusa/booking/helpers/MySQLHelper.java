package com.virtusa.booking.helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class MySQLHelper {
public static Connection getConnection()
{
	ResourceBundle rb=ResourceBundle.getBundle("com/virtusa/resources/db");
	String UserName=rb.getString("user");
	String password=rb.getString("password");
	String url=rb.getString("url");
	String driverName=rb.getString("driver");
	Connection conn = null;
	try {
		Class.forName(driverName);
		conn=DriverManager.getConnection(url,UserName,password);
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
     return conn;
}

}
