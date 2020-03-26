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

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.button {
  display: inline-block;
  padding: 5px 5px;
  font-size: 15px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: black;
  border: none;
  border-radius: 5px;
  box-shadow: 0 5px #999;
}

.button:hover {background-color: grey}

.button:active {
  background-color: grey;
  box-shadow: 0 5px grey;
  transform: translateY(4px);
}

#myTable {
  border-collapse: collapse;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

input[type="text"] {
    width: 300px;
    height: 25px;

}


</style>
</head>
<body> 
<h2 align = "center"><b>ASSIGNING USER TO AGENT</b></h2><hr>
<br><br>
<form action = "addUserToAgent" method = "post">
<table align ="center"  id="myTable">
<tr><td><font size="4"><b>Enter Agent Name </b></font></td><td>:<input type="text" name="agentId" placeholder="agentname"><br></td></tr>
<tr><td></td><td></td></tr>

<tr><td><font size="4"><b>Enter User Name </b></font></td><td>:<input type = "text" name = "uname" placeholder = "username"><br></td></tr>

<tr><td></td><td></td></tr>

<tr><td></td><td><input class = "button" type = "submit" value = "submit"><b>Submit</b></td></tr>
</table>
</form>	
</body>
</html>