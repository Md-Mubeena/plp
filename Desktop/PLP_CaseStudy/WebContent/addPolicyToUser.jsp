<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%
   
     if(session.getAttribute("username")==null||session.getAttribute("rolecode") != "adm"){
    		response.sendRedirect("index.jsp");
     }
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add Policy to agent</title>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
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

select[name="policy""] {
    width: 300px;
    height: 25px;

}

</style>

</head>
<body>
<h2 align = "center"><b>CREATE A POLICY</b></h2><hr>
<br><br>
<form action="addPolicy" method="post">
<table align ="center" id="myTable">
<tr><td><font size="4"><b>Enter UserName: </b></font></td><td><input type = "text" name="username" placeholder = "enter name"></td></tr>

<tr><td><font size="4"><b>Select Policy:</b></font></td><td><select name="policy" required>
	<option style="display:none"></option>
		<option value="life">Life</option>
		<option value="medical">Medical</option>
		<option value="house">House</option>
		<option value="Vehicle">Automobile</option>
	</select></td></tr> 

<tr><td><font size="4"><b>Enter Premium Amount: </b></font></td><td><input type="text" name="premamount" placeholder = "enter premium amount"></td></tr>

<tr><td><font size="4"><b>Enter Policy Number: </b></font></td><td><input type="text" name="policyno" placeholder="enter policy number"></td></tr>

<tr><td></td><td> <button class="button" type ="submit" value="submit"><b>Submit</b></button></td></tr>

</table>


</form>

</body>
</html>