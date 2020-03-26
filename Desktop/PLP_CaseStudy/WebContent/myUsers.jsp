<%@page import="com.cg.exception.ICRException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cg.dao.QueryConstants"%>
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
</head>
<body>
<table border="2">
		<tr>

			<th><center>My Users</center></th>
			<th><center>View Policies</center></th>
		</tr>
		<%!
	 	Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		%>
		<%
		//String userName = request.getParameter("uname");
		//session.setAttribute("policyName",policy_name")
		try {
			connection = JdbcUtility.getConnection();
			String agentUserName = (String)session.getAttribute("username");
			statement = connection.prepareStatement(QueryConstants.GETUSERS); 
			statement.setString(1, agentUserName);
	 		rs = statement.executeQuery(); 
			System.out.println(rs.getRow());
			while(rs.next()){%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><a href="viewAgentPolicy.jsp?uname=<%=rs.getString("username")%>&accno=<%=rs.getInt("accountno")%>"><button type = "button" value = "View Policies">View Policies</button></a>
		</tr>
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
</body>
</html>