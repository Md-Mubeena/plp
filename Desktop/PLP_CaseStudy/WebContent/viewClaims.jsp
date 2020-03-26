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
    	if(session.getAttribute("rolecode").equals("agnt")){
    		response.sendRedirect("agentHomePage.jsp");
    	}
    	else if(session.getAttribute("rolecode").equals("adm")){
    		response.sendRedirect("adminHomePage.jsp");
    	}
    }
    
    	%>
<html>
<head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

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
<h2 align = "center"> VIEW CLAIMS</h2>
		<table align="center" >
			<tr>
				<th>Claim Number
				<th>Policy Number
				<th>Policy Type
				<th>Policy Premium
				<th>Status</th>
				<%!Connection connection = null;
	PreparedStatement statement = null;%>
				<%
					//String userName = request.getParameter("uname");
					String userName = (String) session.getAttribute("username");
					try {
						connection = JdbcUtility.getConnection();
						statement = connection.prepareStatement(QueryConstants.VIEWCLAIMS);
						statement.setString(1, userName);
						ResultSet rs = statement.executeQuery();
						System.out.println(rs.getRow());
						while (rs.next()) {
				%>
			
			<tr>
				<td><%=rs.getInt("claimno")%></td>
				<td><%=rs.getInt("policyno")%></td>
				<td><%=rs.getString("claimtype")%></td>
				<td><%=rs.getInt("policyprem")%></td>
				<td><%=rs.getString("status")%></td>
			</tr>
			<%
				}
				} catch (ICRException e) {
					out.println(e.getMessage());
				} finally {
					statement.close();
					connection.close();
				}
			%>
		</table>
	</form>
</body>
</html>