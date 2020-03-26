
<%@page import="com.cg.exception.ICRException"%>
<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cg.utiliy.JdbcUtility"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script>
	function pageRedirect(){
		 var delay = 3000; // time in milliseconds

		 // Display message
		 document.getElementById("message").innerHTML = "Please wait while redirecting, you can check your status in the home page";
		 
		 setTimeout(function(){
		  window.location = "agentHomePage.jsp";
		 },delay);
		 
		}
	</script>
</head>
<style>
input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 20%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border-radius: 4px;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 60%;
	align-self: center;
}

body {
	background-color: black;
	align-self: center;
	text-align: center;
	padding-left: 380px;
}

form {
	align: "center";
}
</style>
<body>
	<div class="container">
		<form action="agentAnswers.jsp" method="post">
			<table>

				<%!
	 	Connection connection = null;
		PreparedStatement statement = null;
		%>
				<%
					try {
					connection = JdbcUtility.getConnection();
					String policyName = (String)session.getAttribute("policyName");
					//System.out.println(session.getAttribute("policyNo"));
					//out.println(policyName);
					statement = connection.prepareStatement(QueryConstants.GETQUESTIONS); 
					statement.setString(1, policyName);
					ResultSet rs = statement.executeQuery(); 
				
					String str = "";
					int count = 1;
						while (rs.next()) {
							str = "";
							//count = 1;
							str = "q" + count;
							//System.out.println("key : "+str+" value : "+rs.getString("qid"));
							session.setAttribute(str, rs.getString("qid"));
				%>
				<tr>
					<td><%=count %></td>
					<td><%=rs.getString("questions")%></td>
					<td><input type="radio" name="<%=count%>" value="yes">Yes</td>
					<td><input type="radio" name="<%=count%>" value="no">No</td>
				</tr>

				<%
					count++;
						}
					} catch (ICRException e) {
						out.println(e.getMessage());
					} finally {
						statement.close();
						connection.close();
					}
				%>
			</table>
				<input type="submit" value="Submit" > <br>

			
		</form>
	</div>
	<!-- Message -->
			<div id="message"></div>
</body>