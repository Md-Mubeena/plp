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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	box-sizing: border-box;
}
body { 
  margin: 0;
  font-family: "Times New Roman", Helvetica, sans-serif;
}

.header {
	overflow: hidden;
	background-color: black;
	padding: 20px 10px;
	width: auto;
}

.header a {
	float: left;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	font-size: 25px;
	font-weight: bold;
}

.header-right {
	position: absolute;
	left: 90%;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: right;
	}
}

.nav-bar {
	position: fixed;
	width: 10%;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 10%;
	position: fixed;
	height: 100%;
	overflow: auto;
}

.btn1 {
	border: none;
	outline: none;
	width: 100%;
	padding: 10px 16px;
	background-color: white;
	cursor: pointer;
	font-size: 18px;
	color: black;
}

.dropbtn {
	border: none;
	outline: none;
	width: 150%;
	padding: 10px 16px;
	background-color: white;
	cursor: pointer;
	font-size: 18px;
	color: black;
}

.active, .btn1:hover {
	background-color: #69DC4B;
	color: black;
}

.logimg {
	height: 2vh;
	width: 3vh;
}

.useriframe {
	width: 80%;
	margin-left: 15%;
	margin-top: 10%;
	height: 50vh;
	border-style: none;
}

.bgimg {
	background-image: url("bgimg.jpg");
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

img {
	padding-left: 50px;
}

.button {
	display: inline-block;
	padding: 15px 25px;
	font-size: 10px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: solid black;
	background-color: white;
	border: none;
	border-radius: 10px;
	box-shadow: 0 5px #999;
	float: right;
	height: 5vh;
	width: 10vh;
}

.button:hover {
	background-color: #f5f5f5
}

.button:active {
	background-color: white;
	box-shadow: 0 5px grey;
	transform: translateY(4px);
}

.dropbtn::active {
  background-color: #69DC4B;
  transform: translateY(4px);
  color: black;
}
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.active, .btn1:hover {
	background-color: #69DC4B;
	color: black;
}
.dropdown-content a:hover {background-color:#69DC4B}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #69DC4B;
}

h3 {
	color: white;
}
</style>
<script>
function viewClaims(){
 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="vieClaimsAdmin.jsp" name="iframe_a" class="useriframe"></iframe>';
}
function createPolicy(){
 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addPolicyToUser.jsp" name="iframe_a" class="useriframe"></iframe>';
}
function assignAgent(){
 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addUserToAgent.jsp" name="iframe_a" class="useriframe"></iframe>';
}
function managedClaims(){
	 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="managedClaims.jsp" name="iframe_a" class="useriframe"></iframe>';
	}

function createProfile(){
 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addUser.jsp?type=usr" name="iframe_a" class="useriframe"></iframe>';
}

function user(){
	
	 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addUser.jsp?type=usr" name="iframe_a" class="useriframe"></iframe>';
}
function agent(){
	
	 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addAgent.jsp?type=agnt" name="iframe_a" class="useriframe"></iframe>';
}
function admin(){
	
	 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addAdmin.jsp?type=adm" name="iframe_a" class="useriframe"></iframe>';
}
</script>
</head>
<body class="bgimg">
	<div class="header">
		<a class="logo"><b>I-NSURED</b></a>
		 <div class="header-right" ><!-- <a class="button" href="logout">Logout</a> -->
		 <a href = "index.jsp"><jsp:include page="logoutPage.jsp"/></a>
		</div></div>

	<!-- side navigation bar -->

	<div class="nav-bar">
		<br> <br> <img src="d.jpg" width="150px">
		<h3 align="center"><b>ADMIN</b></h3>
		<div id="divi">
			<ul>
				<li><button class="btn1 active"><i class="fa fa-eye"></i><b> View Claims </b>
					</button></li>
				<li><button class="btn1"><i class="fa fa-pencil"></i><b> Create Policy</b></button></li>
				<li><button class="btn1"><i class="fa fa-pencil"></i><b> Assign Agent</b></button></li>
				<li><button class="btn1"><i class="fa fa-tasks"></i><b> Manage Claim</b></button></li>
				<li><div class="dropdown"><button class="dropbtn"><b>Create Profile </b></button>
					<div id="myDropdown" class="dropdown-content">
						<a onclick="user()"><b>User</b></a>
							<a  onclick="agent()"><b>Agent</b></a> 
							<a  onclick="admin()"><b>Admin</b></a>
					</div>
				</div></li>
				
			</ul>
		</div>
	</div>
	<div id="viewClaims"></div>

<script>
  var header = document.getElementById("divi");
  var btns = header.getElementsByClassName("btn1");
  btns[0].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="vieClaimsAdmin.jsp" name="iframe_a" class="useriframe"></iframe>';
  });
   
      btns[1].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addPolicyToUser.jsp" name="iframe_a" class="useriframe"></iframe>';
	  });

	  
	  btns[2].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addUserToAgent.jsp" name="iframe_a" class="useriframe"></iframe>';
	  });
	  

	  btns[3].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
	  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="managedClaims.jsp" name="iframe_a" class="useriframe"></iframe>';
	  });
	  
  var drpbtn = header.getElementsByClassName("dropbtn");	  
  drpbtn[0].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="addUser.jsp?type=usr" name="iframe_a" class="useriframe"></iframe>';
  });
  
  </script>

</body>
</html>