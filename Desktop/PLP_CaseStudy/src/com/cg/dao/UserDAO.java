package com.cg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cg.exception.ICRException;
import com.cg.utiliy.JdbcUtility;

public class UserDAO implements IUserDAO{

	@Override
	public int addUser(String userName, String password, String roleCode,int accountNo) throws ICRException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		int rows= 0;
		try {
			connection = JdbcUtility.getConnection();
			
			ps = connection.prepareStatement(QueryConstants.ADDROLE);
			ps.setString(1,userName);
			ps.setString(2, password);
			ps.setString(3, roleCode);
			ps.executeUpdate();
			System.out.println("rows"+rows);
			
			ps = connection.prepareStatement(QueryConstants.ADDACCOUNTNUMBER);
			ps.setInt(1, accountNo);
			ps.setString(2, userName);
			rows = ps.executeUpdate();
			System.out.println("rows"+rows);
			
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in adduser DAO");
	}
		return rows;
}

	@Override
	public int createClaim(String reason, String location, String city, String state, int zip, String claimType,int policyNo) throws ICRException {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int rows= 0;
		try {
			connection = JdbcUtility.getConnection();
			ps = connection.prepareStatement(QueryConstants.ADDCLAIM);
			ps.setString(1,reason);
			ps.setString(2,location);
			ps.setString(3, city);
			ps.setString(4, state);
			ps.setInt(5,zip);
			ps.setString(6,claimType);
			ps.setInt(7,policyNo);
			 rows = ps.executeUpdate();
			System.out.println("rows"+rows);
			
			
			ps = connection.prepareStatement(QueryConstants.GETCLAIMNO);
			ps.setInt(1,policyNo);
			rs = ps.executeQuery();
			rs.next();
			int claimNo = rs.getInt("claimno");
			
			ps = connection.prepareStatement(QueryConstants.ADDSTATUS);
			ps.setInt(1,claimNo);
			ps.setString(2,"pending");
			rows = ps.executeUpdate();
			System.out.println("rows"+rows);
			
		
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in creating claim , userDao");
	}
		return rows;
}

	
	
}