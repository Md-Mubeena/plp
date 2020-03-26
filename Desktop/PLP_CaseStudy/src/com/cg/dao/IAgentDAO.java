package com.cg.dao;

import com.cg.exception.ICRException;

public interface IAgentDAO {

	public int addAgent(String userName, String password, String rollCode) throws ICRException;

	public int createClaim(String reason, String location, String city, String state, int zip, String claimType,
			int policyNo) throws ICRException;
	
	public int addUserToAgent(String agentId,String userName) throws ICRException;
}
