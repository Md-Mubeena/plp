<%@page import="com.cg.exception.ICRException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cg.utiliy.JdbcUtility"%>
<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<%
	System.out.println("Inside answers.jsp");
		try {
		int count = 0,index = 0;
		
		
		connection = JdbcUtility.getConnection();
		System.out.println("connection establised");
		String answer[] = new String[2];
		answer[0] = request.getParameter("1");
		answer[1] = request.getParameter("2");	
		System.out.println("before session attribute answers "+answer[0]+" "+answer[1]);
		String question[] = new String[2];
		question[0] = (String)session.getAttribute("q1");
		question[1] = (String)session.getAttribute("q2");
		System.out.println("after session attribute questions "+question[0]+" "+question[1]);
		/* String uname = (String)session.getAttribute("q1");
		String uname = (String)session.getAttribute("q1");
		String uname = (String)session.getAttribute("q1"); */
		String policyNo =(String)(session.getAttribute("policyNo"));
		
		
		 while (count < 2) {
				System.out.println("inside while");
				statement = connection.prepareStatement(QueryConstants.SAVEANSWER);
				System.out.println("after query");
				System.out.println(question[count]+" "+answer[count]);
				statement.setInt(1, Integer.parseInt(policyNo));
				statement.setString(2, question[count]);
				statement.setString(3, answer[count]);
				count++;
				System.out.println(statement.executeUpdate());
			} 
		} catch (ICRException e) {
			out.println(e.getMessage());
		} finally {
			statement.close();
			connection.close();
		}
		//response.sendRedirect("userHomePage.jsp");
		 response.setHeader("Refresh", "3;url=agentHomePage.jsp");
		
	%>
	 <h2> Please Wait While we redirect you to home page</h2>
</body>
</html>