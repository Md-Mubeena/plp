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
<title>Claim creation by user</title>
</head>

<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  height: 25px;
}


body{
	 align-self: center;
	 text-align: center;
	 padding-left: 380px;
	 padding-top:100px;
}


.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 10px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: white;
  background-color: black;
  border: none;
  border-radius: 10px;
  box-shadow: 0 5px #999;
  float:right;
  height:5vh;
  width:10vh;
}

.button:hover {background-color:grey}

.button:active {
  background-color:#857F7F;
  box-shadow: 0 5px grey;
  transform: translateY(4px);
}

</style>
<body>
<h2 align="left"><b>Claim Your Policy</b></h2>

			
 			 <form action="createclaim" method="post">
 			 	<table align="left">
   			 	
   			 	<tr>
   			 	
   			 	<td align="left"><b>Reason </b></td>
   			 	<td align="right" width = "70%"><input  type="text" tabindex="1" name="reason" required autofocus></td>
   			 	</tr>
   			 	
   			 	<tr>
   		
   			 	<td align="left"><b>Accident location</b></td>
   			 	<td align="right"><input type="text" tabindex="2" name="location" required></td>
   			 	</tr>
   			 	
				<tr>
				
				<td align="left"><b>Accident City</b></td>
				<td align="right"><input type="text" tabindex="3" name="city" required></td>
				</tr>
				
				<tr>
				
				<td align="left"><b>Accident State</b></td>
				<td align="right"><input type="text" tabindex="4" name="state" required></td>
				</tr>
				
				<tr>
				
				<td align="left"><b>Accident Zip</b></td>
				<td align="right"><input type="text" tabindex="5" name="zip" required></td>
				</tr>
				
   				<%session.setAttribute("policyName", request.getParameter("type")); %>
				<tr>
				
				<td align="left"><b>Claim Type</b></td>
				<td align="right"><input type="text" tabindex="6" name="type" value=<%=request.getParameter("type") %> readonly></td>
				</tr>
				
				<%session.setAttribute("policyNo", request.getParameter("pno")); %>
				<tr>
				
				<td align="left"><b>Policy Number</b></td>
				<td align="right"><input type="text" tabindex="7" name="policyNo" value=<%=request.getParameter("pno")%> readonly></td>
				</tr>
				
   				<tr><td></td></tr>
   				<tr><td align="left"><button class="button" onclick="goBack()">Back</button></td>
				<td align="center"><input style="margin:5px;" class ="button" type="submit" value="Submit"><input style="margin:5px;"  class ="button" type ="reset" value ="reset"></td>
    			</tr>
   				
    		</table>
          </form>
   	
<script>
function goBack() {
  window.history.back();
}
</script>
 </body>

</html>