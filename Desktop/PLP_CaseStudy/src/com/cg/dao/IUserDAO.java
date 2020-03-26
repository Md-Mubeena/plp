package com.cg.dao;

import com.cg.exception.ICRException;

public interface IUserDAO {
	
	public int addUser(String username,String password,String rolecode,int accountno) throws ICRException;
	
	public int createClaim(String reason,String location,String city,String state,int zip,String claimType,int policyNo) throws ICRException;
	
}
