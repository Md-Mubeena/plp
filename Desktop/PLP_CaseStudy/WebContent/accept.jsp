<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="com.cg.exception.ICRException"%>
<%@page import="com.cg.utiliy.JdbcUtility"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    if(session.getAttribute("username")==null){
    	response.sendRedirect("index.jsp");
    	
    }
    else{
    	if(session.getAttribute("rolecode").equals("usr")){
    		response.sendRedirect("userHomePage.jsp");
    	}
    	else if(session.getAttribute("rolecode").equals("agnt")){
    		response.sendRedirect("agentHomePage.jsp");
    	}
    }
    
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%!Connection connection = null;
		   PreparedStatement statement = null;
	%>
	<%  try{
		
		connection = JdbcUtility.getConnection();
		int policyNo = Integer.parseInt(request.getParameter("policyNo"));
		int claimNo = Integer.parseInt(request.getParameter("claimNo"));
		statement = connection.prepareStatement(QueryConstants.ACCEPTSTATUS);
		statement.setInt(1, policyNo);
		statement.executeUpdate();
		System.out.println("in accept jsp");
		
		response.setHeader("Refresh", "1;url=vieClaimsAdmin.jsp");
		 
	}catch (ICRException e) {
		out.println(e.getMessage());
	} finally {
		statement.close();
		connection.close();
	}
%>
	
</body>
</html>