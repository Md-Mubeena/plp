package com.cg.dao;

import com.cg.exception.ICRException;

public interface IAdminDAO {

	int addAdmin(String username, String password, String rolecode) throws ICRException;
	String validate(String name, String pass) throws ICRException;
	int addPolicy(String userName, String policy, int premAmount, int policyNo) throws ICRException;
}
