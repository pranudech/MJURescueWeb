<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itsci.mjurescue.login.*"%>
<%  String statusMessage = (String) session.getAttribute("statusMessage");
	session.removeAttribute("statusMessage");
	if(statusMessage == null){
		statusMessage = null;
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LOG IN</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left"
		style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include> <a
		href="index.jsp" class="w3-padding"><i class="fa fa-home"
		aria-hidden="true"></i>&nbsp;&nbsp;หน้าแรกเว็บไซต์</a> <a
		href="login.jsp" class="w3-padding w3-text-teal"><i
		class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;&nbsp;เข้าสู่ระบบ</a> <jsp:include
		page="common/social.jsp"></jsp:include> </nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> <span
			class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i> </span>
		<h3>
			<b>Mju Rescue System &nbsp;&nbsp;<i class="fa fa-expeditedssl"></i></b>
		</h3>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System >> เข้าสู่ระบบ</h6>
			</legend>

			<div class="container" style="margin-left: -75px">
				<div class="wrapper">

					<!-- Form -->
					<form name="login" action="LoginServlet" method="post"
						class="form-signin">
						<div class="row text-center bol">
							<i class="fa fa-circle"></i>
						</div>
						<h3 class="form-signin-heading text-center">
							<img src="img/login.png" style="width: 25%">
						</h3>
						<hr class="spartan">
						<% if(statusMessage != null) { %>
						 	<center><font color="red"><%= statusMessage %></font></center>
						 <% } %>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <i
								class="fa fa-user"></i></span> <input type="text" class="form-control"
								name="username" placeholder="ระบุ Username" required=""
								autofocus="">
						</div>

						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"> <i
								class="fa fa-lock"></i></span> <input type="password"
								class="form-control" name="password" placeholder="ระบุ Password"
								required="">
						</div>

						<br> 
						<input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="SIGN IN">

						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Forget Password ! <a href="studentForgetPassword.jsp"
									onClick="$('#loginbox').hide(); $('#signupbox').show()">ลืมรหัสผ่าน</a>
									
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<br> <br> <br> <br>
		</fieldset>
		
		

		<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>