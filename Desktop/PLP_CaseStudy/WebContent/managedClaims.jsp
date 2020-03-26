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
    	else if(session.getAttribute("rolecode").equals("agnt")){
    		response.sendRedirect("agentHomePage.jsp");
    	}
    }
    
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Managed claims</title>
<style>

body { 
  margin: 0;
  font-family: "Times New Roman", Helvetica, sans-serif;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}

#myInput {
 
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 80%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}


</style>
</head>
<body>

<h2 align = "center"><b>MANAGING CLAIMS</b></h2>
	<center><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search " title="Type in a name"></center>


		<table align="center" border=1 id="myTable">
			<tr>
				<th>User Name
				<th>Policy Number
				<th>Claim Number
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
						statement = connection.prepareStatement(QueryConstants.VIEWMANAGEDCLAIMS);
						statement.setString(1,"pending");
						
						ResultSet rs = statement.executeQuery();
						System.out.println("managedclaim"+rs.getRow());
						while (rs.next()) {
				%>
			
			<tr>
				<td><%=rs.getString("username")%></td>
				<td><%=rs.getInt("policyno")%></td>
				<td><%=rs.getInt("claimno")%></td>
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
	
	<script>
	
	
		function myFunction() {
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
		}
	
			
	</script>
</body>
</html>