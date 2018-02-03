<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@page import="java.util.*"%>
<%
	String studentMessage = (String) session.getAttribute("studentMessage");
	session.removeAttribute("studentMessage");
	if(studentMessage == null){
		studentMessage = " ";
	}
	LoginBean login = (LoginBean) session.getAttribute("login");
	StudentBean student = (StudentBean) session.getAttribute("student");
	if(login == null || student == null){
		login = new LoginBean();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STUDENT CHANGE PASSWORD</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstraptheme.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/changePassword.css">
</head>

<script language="Javascript">
	function validate(changePassword) {
		if (changePassword.studentid.value == "") {
			alert("กรุณากรอก รหัสนักศึกษา");
			changePassword.studentid.focus();
			return false;
		}
		if (changePassword.oldpassword.value == "") {
			alert("กรุณากรอก รหัสผ่านเก่า");
			changePassword.oldpassword.focus();
			return false;
		}
		if (changePassword.newpassword.value == "") {
			alert("กรุณากรอก รหัสผ่านใหม่");
			changePassword.newpassword.focus();
			return false;
		}
	}
</script>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="studentIndex.jsp" class="w3-padding"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;หน้าหลัก</a> 
	<a href="studentViewStudentProfile.jsp" class="w3-padding"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;ข้อมูลนักศึกษา</a>
	<a href="studentChangePassword.jsp" class="w3-padding w3-text-teal"><i class="fa fa-text-width" aria-hidden="true"></i>&nbsp;&nbsp;เปลี่ยนรหัสผ่าน</a>
	<a href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;ออกจากระบบ</a> 
	
<!-- Social -->
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>
	
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Change Password&nbsp;&nbsp;<i class="fa fa-cog"></i></b></font>
		</h2>

		<a href="studentIndex.jsp"><font color="#336600">หน้าหลัก</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="studentViewStudentProfile.jsp"><font color="#339933">ข้อมูลนักศึกษา</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="studentChangePassword.jsp"><font color="#800000"><b>เปลี่ยนรหัสผ่าน</b></font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System => เปลี่ยนรหัสผ่าน</h6>
			</legend>
			<div class="container" style="margin-left: -80px; margin-top: -35px">
				<div class="wrapper">
<!-- Form -->
					<form name="frmChangePassword" class="form-signin" action="ChangePasswordServlet" method="get">
						<div class="row text-center bol">
							<i class="fa fa-circle"></i>
						</div>
						<img src="img/ChangePassword.png" style="width: 290px; height: 120px" align="center">
						<hr class="spartan">
						<center><font color="red"><%= studentMessage %></font></center>
						<div class="input-group">
							<input type="text" class="form-control" name="studentid" placeholder="ระบุรหัสนักศึกษา " style="width: 300px">
						</div>
						<div class="input-group">
							<input type="password" class="form-control" name="oldpassword" placeholder="ระบุรหัสผ่านเก่า " style="width: 300px">
						</div>
						<div class="input-group">
							<input type="password" class="form-control" name="newpassword" placeholder="ระบุรหัสผ่านใหม่  " style="width: 300px">
						</div>
						<br> 
						<input type="submit" class="btn btn-custom btn-lg btn-block" value="Change Password" onclick="return validate(frmChangePassword)">
					</form>
				</div>
			</div>
			<br>
		</fieldset>
<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>
	
</body>
</html>