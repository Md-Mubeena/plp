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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="myUsers.jsp"><button class="button">My Users</button></a>
	<a href = "agentViewClaims.jsp"><button type="button" value="view claims">view claims</button></a>
	<jsp:include page="logoutPage.jsp" />
</body>
</html>