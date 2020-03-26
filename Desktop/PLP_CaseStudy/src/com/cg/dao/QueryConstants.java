package com.cg.dao;

public interface QueryConstants {
	
	String ADDROLE = "insert into userrole(username,pwd,rolecode) values(?,?,?)";
	String ADDACCOUNTNUMBER = "insert into accountno_user values(?,?)";
	String VALIDATE = "select rolecode from userrole where username=? and pwd=?";
	String VIEWPOLICY = "select policyno,policy_name,policyprem from policy where policyno in (select policyno from policy_user where username = ?)";
	String GETQUESTIONS = "select qid,questions from question where policy_name = ?";
	String SAVEANSWER = "insert into policydetails values(?,?,?)";
	String VIEWCLAIMS = "select c.claimno,c.policyno,c.claimtype,p.policyprem,cs.status from claim c,policy_user pu,policy p,check_status cs where c.policyno = pu.policyno and pu.policyno = p.policyno and c.claimno = cs.claimno and pu.username = ?";
	String VIEWCLAIMSADMIN = "select pu.username,c.policyno,c.claimno,c.claimtype,p.policyprem,cs.status from claim c,policy_user pu,policy p,check_status cs where c.policyno = pu.policyno and pu.policyno = p.policyno and c.claimno = cs.claimno and cs.status=?";
	String ADDPOLICY = "insert into policy_user values(?,?)";
	String GETACCOUNTNO = "select accountno from accountno_user where username = ?";
	String ADDPOLICY1 = "insert into policy values(?,?,?,?)";
	String GETUSERS = "select u.username,a.accountno from userrole u,accountno_user a where u.username = a.username and u.agentid = ?";
	String ADDCLAIM = "insert into claim values(claimseq.NEXTVAL,?,?,?,?,?,?,?)";
	String ADDUSERTOAGENT = "update userrole set agentid = ? where username = ?";
	String ADDSTATUS = "insert into check_status values(?,?)";
	String GETCLAIMNO = "select claimno from claim where policyno = ?";
	String ACCEPTSTATUS = "update check_status set status='approved' where claimno=(select claimno from claim where policyno=?)";
	String REJECTSTATUS = "update check_status set status='rejected' where claimno=(select claimno from claim where policyno=?)";
	String VIEWMANAGEDCLAIMS ="select pu.username,c.policyno,c.claimno,c.claimtype,p.policyprem,cs.status from claim c,policy_user pu,policy p,check_status cs where c.policyno = pu.policyno and pu.policyno = p.policyno and c.claimno = cs.claimno and cs.status!=?";

}
