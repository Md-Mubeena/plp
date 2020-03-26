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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: "Times New Roman", Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: black;
  padding: 20px 10px;
  width:auto;
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
  position:absolute;
  left:90%;
}
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
.nav-bar{
position:fixed;
width: 10%;


}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 10%;
  position: fixed;
  height: 60%;
  overflow: auto;
  }

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: black ;
  color: white;
}

li a:hover:not(.active) {
  background-color: grey;
  color: white;
}
.btn1 {
  border: none;
  outline: none;
  width:100%;
  padding: 10px 16px;
  background-color: #f1f1f1;
  cursor: pointer;
  font-size: 18px;
}

.active, .btn1:hover {
  background-color: black;
  color: white;
}

.logimg{
  height:2vh;
  width:3vh;
}

.useriframe{
width:80%;
margin-left:15%;
margin-top:5%;
height:80vh;
border-style:none;
}

.bgimg {
  background-image: url("user.jpg");
  height:100vh;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

img{
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
  background-color:white;
  border: none;
  border-radius: 10px;
  box-shadow: 0 5px #999;
  float:right;
  height:5vh;
  width:10vh;
}

.button:hover {background-color: #f5f5f5}

.button:active {
  background-color: white;
  box-shadow: 0 5px grey;
  transform: translateY(4px);
}



</style>
<script>
function viewClaims(){

 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="viewClaims.jsp" name="iframe_a" class="useriframe"></iframe>';
}
function createClaims(){

 document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="viewPolicy.jsp" name="iframe_a" class="useriframe"></iframe>';

}

</script>
</head>
<body class="bgimg">
	<div class="header">
		<a class="logo"><b>I-NSURED</b></a>
		 <div class="header-right" ><!-- <a class="button" href="logout">Logout</a> -->
		 <a href = "index.jsp"><jsp:include page="logoutPage.jsp"/></a>
		<!--  <a href = "index.jsp"><jsp:include page="logoutPage.jsp"/></a> -->
	</div></div>

	<!-- side navigation bar -->

	<div class="nav-bar">
		<br> <br> <img src="d.jpg" width="150px">
		<h3 align="center"><b>USER</b></h3>
		<div id="divi">
			<ul>			
				<li><button class="btn1 active"><i class="fa fa-eye"></i><b> View Claims</b></button></li>
				<li><button class="btn1"><i class="fa fa-pencil"></i><b> Create Claims</b></button></li> 
			</ul>
		</div>
	</div> 



<div id="viewClaims"> </div>

<script>
var header = document.getElementById("divi");
var btns = header.getElementsByClassName("btn1");

  btns[0].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="viewClaims.jsp" name="iframe_a" class="useriframe"></iframe>';
  });
  
  btns[1].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  document.getElementById("viewClaims").innerHTML='<iframe height="300px" width="50%" src="viewPolicy.jsp" name="iframe_a" class="useriframe"></iframe>';
  });

</script>

</body>
</html>

