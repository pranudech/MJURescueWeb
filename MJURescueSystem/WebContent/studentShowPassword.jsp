<%@page import="java.util.Vector"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String password = (String) session.getAttribute("password");
	if(password != null){
		session.removeAttribute("password");	
	}else{
		password = "-";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SHOW PASSWORD</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="Index.jsp" class="w3-padding"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp;&nbsp;หน้าเริ่มต้น</a>
	<a href="Login.jsp" class="w3-padding"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;&nbsp;เข้าสู่ระบบ</a> 
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>
	
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h3>
			<b>Mju Rescue System &nbsp;&nbsp;<i class="fa fa-key"></i></b>
		</h3>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System >> รหัสผ่าน</h6>
			</legend>

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
			<div class="container" style="margin-left: -75px">
				<div class="wrapper">
				
<!-- Form -->
				<form name="frmForgetPassword" action="ForgetPasswordServlet"  method="post" class="form-signin">
					<div class="row text-center bol">
						<i class="fa fa-circle"></i>
					</div>
					<h3 class="form-signin-heading text-center"><br> 
						<img src="img/ps3.png" style="width: 65%">
					</h3>
					<br>

					<hr class="spartan">
					<div class="input-group">
						<font size="5"><i class="fa fa-key" aria-hidden="true"></i>
							Your Password is : <%=password%>
						</font>
					</div>
				</form>
			</div>
		</div>
		<br> <br>
	</fieldset>

<!-- Footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>