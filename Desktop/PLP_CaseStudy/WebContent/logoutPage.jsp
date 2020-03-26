<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
    if(session.getAttribute("username")==null){
    	response.sendRedirect("index.jsp");
    }
    	%>
<!DOCTYPE html>
<html>
<head>
<style>

.button{
float:right;
}
</style>
<meta charset="ISO-8859-1">
<title>Logout page</title>
</head>

<body>
<form action="logout" method="get">
		<button class = "button" type="submit"><b>LOGOUT</b></button>
</form>	
</body>
</html>