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
<script>
	function pageRedirect(){
		 var delay = 3000; // time in milliseconds

		 // Display message
		 document.getElementById("message").innerHTML = "Please wait while redirecting, you can check your status in the home page";
		 
		 setTimeout(function(){
		  window.location = "userHomePage.jsp";
		 },delay);
		 
		}
	</script>
<style>

body { 
  margin: 0;
  font-family: "Times New Roman", Helvetica, sans-serif;
}
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
<h2 align= "center" >CREATING PROFILE TO USER</h2><hr>
<br><br>
<form align="center" action="add" method="post">
<table align ="center" id="myTable">

<tr><td align="left"><font size="4"><b>User Name </b></font></td>
<td>:<input type="text" placeholder="User name" name="uname" required> </td></tr>



<tr><td align="left"><font size="4"><b>Password </b></font></td>
<td>:<input type="password" placeholder="Enter Password" name="pwd" required></td></tr>



<tr><td align="left"><font size="4"><b>Roll Code </b></font></td>
<td>:<input type="rolecode" placeholder="Role Code" name="rolecode"  value=<%=request.getParameter("type")%> readonly></td></tr>

		
<tr><td align="left"><font size="4"><b>Account Number </b></font></td>
<td>:<input type="text" placeholder="Account Number" name="accountno" required> </td></tr>
    

    
<tr><td></td><td><button type="submit" class="button" onclick='pageRedirect()'><b>Submit</b></button></td></tr>  
</table>
</form>

</body>
</html>
