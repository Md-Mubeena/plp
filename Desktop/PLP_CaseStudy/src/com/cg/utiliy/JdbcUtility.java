package com.cg.utiliy;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.cg.exception.ICRException;

import oracle.jdbc.driver.OracleDriver;

public class JdbcUtility {
	
	static Connection connection = null;
	
	public static Connection getConnection() throws ICRException {
		Driver driver = new OracleDriver();
		//PrintWriter writer = response.getWriter();
		try {
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Capgemini123");
		} catch(SQLException e) {
			throw new ICRException("DB error");
			
		}
		return connection;
	}
}
