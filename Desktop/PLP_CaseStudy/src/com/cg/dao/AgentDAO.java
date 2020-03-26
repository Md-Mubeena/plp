package com.cg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cg.exception.ICRException;
import com.cg.utiliy.JdbcUtility;

public class AgentDAO implements IAgentDAO{

	@Override
	public int addAgent(String username, String password, String rolecode) throws ICRException {
		
		Connection connection = null;
		PreparedStatement statement = null;
		int rows= 0;
		try {
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.ADDROLE);
			ps.setString(1,username);
			ps.setString(2, password);
			ps.setString(3, rolecode);
			
			 rows = ps.executeUpdate();
			System.out.println("rows"+rows);
		
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in addagent DAO");
	}
		return rows;
}

	@Override
	public int createClaim(String reason, String location, String city, String state, int zip, String claimType,
			int policyNo) throws ICRException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		int rows= 0;
		try {
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.ADDCLAIM);
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
		throw new ICRException(e.getMessage()+"problem occured in creating claim , AGENTdao");
	}
		return rows;
	
	
}

	@Override
	public int addUserToAgent(String agentId, String userName) throws ICRException {
		Connection connection = null;
		PreparedStatement statement = null;
		int rows= 0;
		try {
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.ADDUSERTOAGENT);
			ps.setString(1,agentId);
			ps.setString(2, userName);
			
			 rows = ps.executeUpdate();
			System.out.println("rows"+rows);
		
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in addagent DAO");
	}
		return rows;
	}
}