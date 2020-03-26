<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.cg.dto.User"%>
<%@page import="com.cg.utiliy.JdbcUtility"%>
<%@page import="com.cg.exception.ICRException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%
    if(session.getAttribute("username")==null){
    	response.sendRedirect("index.jsp");
    	
    }
    else{
    	if(session.getAttribute("rolecode").equals("agnt")){
    		response.sendRedirect("agentHomePage.jsp");
    	}
    	else if(session.getAttribute("rolecode").equals("adm")){
    		response.sendRedirect("adminHomePage.jsp");
    	}
    }
    
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  width: 70%;
  height: 20%
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}

</style>
</head>
<body>
<form action="viewclaims" method = "post">
<h2 align = "center">CREATE CLAIMS</h2>
	<table align = "center">
		<tr>

			<th>Policy Number</th>
			<th>policy Name</th>
			<th>Premium Amount</center></th>
			<th>Claim Policy</center></th>
		</tr>

		<%!
	 	Connection connection = null;
		PreparedStatement statement = null;
		%>
		<%
		//String userName = request.getParameter("uname");
		//session.setAttribute("policyName",policy_name")
		try {
			connection = JdbcUtility.getConnection();
			String uname = (String)session.getAttribute("username");
			//System.out.println(uname);
			statement = connection.prepareStatement(QueryConstants.VIEWPOLICY); 
			statement.setString(1, uname);
	 		ResultSet rs = statement.executeQuery(); 
			System.out.println(rs.getRow());
			while(rs.next()){%>
		<tr>
			<td><%=rs.getInt("policyno")%></td>
			<td><%=rs.getString("policy_name")%></td>
			<td><%=rs.getInt("policyprem")%></td>
			<td><a href="createClaim.jsp?type=<%=rs.getString("policy_name") %>&pno=<%=rs.getString("policyno") %>">Claim</a>
		</tr>-
		<%		
			}			
		}catch(ICRException e){
			out.println(e.getMessage());	
			} 	
		finally {	
				statement.close();
				connection.close();	
		}
	%>
	</table>
	</form>
</body>
</html>