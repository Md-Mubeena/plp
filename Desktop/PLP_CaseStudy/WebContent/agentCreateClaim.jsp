<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
    if(session.getAttribute("username")==null||session.getAttribute("rolecode")!="agnt"){
    	response.sendRedirect("index.html");
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
  width:60%;
  align-self: center;
}
body{
	 background-color: black;
	 align-self: center;
	 text-align: center;
	 padding-left: 380px;
	 padding-top:100px;
}

form
{
    align:"center";
}

</style>
<body>
	<%-- <%
	String type = request.getParameter("type");
	%> --%>
	<div class="container" > 
			<h3>Claim Your Policy</h3>
 			 <form action="agentcreateclaim" method="post">
 			 	<table >
   			 	

   			 	<tr>
    			Reason &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: <input  type="text" tabindex="1" name="reason" required autofocus><br>
   				</tr><tr>
   				 Accident location: <input type="text" tabindex="2" name="location" required><br>
   				</tr>
				<tr>
   				 Accident City&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: <input type="text" tabindex="3" name="city" required><br>
   				</tr>
				<tr>
   				 Accident State&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: <input type="text" tabindex="4" name="state" required><br>
   				</tr>
				<tr>
   				 Accident Zip&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: <input type="text" tabindex="5" name="zip" required><br>
   				</tr>
   				<%session.setAttribute("policyName", request.getParameter("type")); %>
				<tr>Claim Type&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<input type="text" tabindex="6" name="type" value=<%=request.getParameter("type") %> readonly>
				<br>
				</tr>
				<%session.setAttribute("policyNo", request.getParameter("pno")); %>
				<tr>Policy Number :&nbsp&nbsp&nbsp&nbsp&nbsp:<input type="text" tabindex="7" name="policyNo" value=<%=request.getParameter("pno")%> readonly>
				
				<br>
				</tr>
   				<tr>
   				<input type="submit" value="Submit">
    			</tr>

    		</table>
 			 </form>
 	</div>
 </body>
</html>