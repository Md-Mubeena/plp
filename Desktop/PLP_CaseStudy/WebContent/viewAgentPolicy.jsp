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
User Name : <input type="text" name="uname" value=<%=request.getParameter("uname") %> readonly>
Account Number : <input type="text" name="accno" value=<%=request.getParameter("accno") %> readonly>
<table border="2">
		<tr>

			<th><center>Policy Number</center></th>
			<th><center>Premium Amount</center></th>
			<th><center>policy Name</center></th>
			<th><center>Claim Policy</center></th>
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
			//String agentUserName = (String)session.getAttribute("username");
			//System.out.println(uname);
			statement = connection.prepareStatement(QueryConstants.VIEWPOLICY); 
			statement.setString(1, request.getParameter("uname"));
	 		ResultSet rs = statement.executeQuery(); 
			System.out.println(rs.getRow());
			while(rs.next()){%>
		<tr>
			<td><%=rs.getInt("policyno")%></td>
			<td><%=rs.getString("policy_name")%></td>
			<td><%=rs.getInt("policyprem")%></td>
			<td><a href="agentCreateClaim.jsp?type=<%=rs.getString("policy_name") %>&pno=<%=rs.getString("policyno") %>">Claim</a>
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