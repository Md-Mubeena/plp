package com.cg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cg.exception.ICRException;
import com.cg.utiliy.JdbcUtility;

public class AdminDAO implements IAdminDAO{
	
	static Connection connection = null;
	
	@Override
	public int addAdmin(String username, String password, String rolecode) throws ICRException {
		
		int rows= 0;
		try {
			
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.ADDROLE);
			ps.setString(1,username);
			ps.setString(2, password);
			ps.setString(3, rolecode);
//			System.out.println("after ps.setString");
			 rows = ps.executeUpdate();
		
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in addagent DAO");
	}
		return rows;
	}

	@Override
	public String validate(String name, String pass) throws ICRException {
		boolean status = false;
		String roleCode ="";
		try {
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.VALIDATE);
			ps.setString(1, name);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
				roleCode = rs.getString(1);
		} catch (ICRException | SQLException e) {
			throw new ICRException(e.getMessage()+"Problem Occured in AdminDAO during login");
		}
		return roleCode;
	}

	@Override
	public int addPolicy(String userName, String policy, int premAmount, int policyNo) throws ICRException {
		int rows= 0;
		try {
			
			connection = JdbcUtility.getConnection();
			PreparedStatement ps = null;
			
			ps = connection.prepareStatement(QueryConstants.GETACCOUNTNO);
			ps.setString(1,userName);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int accountNo = rs.getInt("accountno");
			ps = connection.prepareStatement(QueryConstants.ADDPOLICY1);
			ps.setInt(1, policyNo);
			ps.setInt(2, premAmount);
			ps.setInt(3, accountNo);
			ps.setString(4, policy);
			rows = ps.executeUpdate();
			
			System.out.println("after add policy1"+rows);
			ps = connection.prepareStatement(QueryConstants.ADDPOLICY);
			ps.setString(1,userName);
			ps.setInt(2,policyNo);
			rows = ps.executeUpdate();

			System.out.println("after add policy"+rows);
			
			
		
	}catch(ICRException | SQLException e) {
		throw new ICRException(e.getMessage()+"problem occured in addagent DAO");
	}
		return rows;
	}
		
	
}

