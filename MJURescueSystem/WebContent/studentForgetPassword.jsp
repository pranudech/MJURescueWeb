<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FORGET PASSWORD</title>
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
	<a href="index.jsp" class="w3-padding"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp;&nbsp;หน้าเริ่มต้น</a>
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<h3>
			<b>Mju Rescue System &nbsp;&nbsp;<i class="fa fa-key"></i></b>
		</h3>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System >> ร้องขอรหัสผ่าน</h6>
			</legend>

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
			<div class="container" style="margin-left: -75px">
				<div class="wrapper">
<!-- Form -->
					<form name="frmForgetPassword" action="ForgetPasswordServlet" method="post" class="form-signin">
						<div class="row text-center bol">
							<i class="fa fa-circle"></i>
						</div>
						<h3 class="form-signin-heading text-center">
							<img src="img/forget-password.png" style="width: 65%">
						</h3>

						<marquee behavior="alternate" scrollamount="1">
							<marquee width="250">
								<font color="#5d684f">F O R G E T P A S S W O R D</font>
							</marquee>
						</marquee>

						<hr class="spartan">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span> 
							<input type="text" class="form-control" name="studentID" placeholder="ระบุรหัสนักศึกษา" required="" autofocus="" />
						</div>

						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span> 
							<input type="text" class="form-control" name="studentIDCode" placeholder="ระบุรหัสบัตรประจำตัวประชาชน" required="" autofocus="" />
						</div>

						<input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Password requests">
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