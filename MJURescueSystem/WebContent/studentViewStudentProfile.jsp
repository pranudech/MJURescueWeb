<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%
	LoginBean login = (LoginBean) session.getAttribute("login");
	StudentBean student = (StudentBean) session.getAttribute("student");
	if(login == null || student == null){
		login = new LoginBean();
		student = new StudentBean();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STUDENT VIEW STUDENT PROFILE</title>
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
<link rel="stylesheet" type="text/css" href="css/studentProfile.css">
<link rel="stylesheet" type="text/css" href="css/searchStu.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="studentIndex.jsp" class="w3-padding"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;หน้าหลัก</a> 
	<a href="studentViewStudentProfile.jsp" class="w3-padding w3-text-teal"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;ข้อมูลนักศึกษา</a> 
	<a href="studentChangePassword.jsp" class="w3-padding"><i class="fa fa-text-width" aria-hidden="true"></i>&nbsp;&nbsp;เปลี่ยนรหัสผ่าน</a>
	<a href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;ออกจากระบบ</a> 
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>
	
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Profile&nbsp;&nbsp;<i class="fa fa-user"></i></b></font>
		</h2>

		<a href="studentIndex.jsp"><font color="#336600">หน้าหลัก</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="studentViewStudentProfile.jsp"><font color="#800000"><b>ข้อมูลนักศึกษา</b></font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="studentChangePassword.jsp"><font color="#339966">เปลี่ยนรหัสผ่าน</font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System => ข้อมูลส่วนตัว</h6>
			</legend>

			<div class="container">
				<div class="row">
					<div class="col-md-7 ">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="box box-info">
									<div class="box-body">
										<div class="col-sm-6">
											<div align="center">
												<img alt="User Pic" src="img/user.ico" id="profile-image1" class="img-circle img-responsive"> 
												<input id="profile-image-upload" class="hidden" type="file"><br>
												<div style="color: black;">
													<font size="4"> <i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp; <%=student.getStudentName()%></font>
												</div>				
											</div>
											<br>
										</div>
										<div class="col-sm-6">
											<h4 style="color: #00b1b1;">Personal Profile You can look & Edit</h4>
											<span>
												<a href="studentEditStudentProfile.jsp?studentID=<%=login.getUsername()%>">
													<h5><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp;แก้ไขข้อมูลส่วนตัว</h5>
												</a>
											</span>
										</div>
										<div class="clearfix"></div>
										<hr style="margin: 5px 0 5px 0;">

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-list-ol" aria-hidden="true"></i>&nbsp;&nbsp;รหัสนักศึกษา :
										</div>
										<div class="col-sm-7"><%=student.getStudentID()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;&nbsp;คณะ :
										</div>
										<div class="col-sm-7"><%=student.getFaculty()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-book" aria-hidden="true"></i>&nbsp;&nbsp;สาขา :
										</div>
										<div class="col-sm-7"><%=student.getDepartment()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-barcode" aria-hidden="true"></i>&nbsp;&nbsp;รหัสบัตรประจำตัวประชาชน :
										</div>
										<div class="col-sm-7"><%=student.getStudentIdCode()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;ที่อยู่ :
										</div>
										<div class="col-sm-7"><%=student.getAddress()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-mobile" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;เบอร์โทรศัพท์ :
										</div>
										<div class="col-sm-7"><%=student.getPhoneNumber()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-phone" aria-hidden="true"></i>&nbsp;&nbsp;เบอร์โทรศัพท์ติดต่อ (กรณีฉุกเฉิน) :
										</div>
										<div class="col-sm-7"><%=student.getPhoneReserve()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-tint" aria-hidden="true"> </i>&nbsp;&nbsp;&nbsp;หมู่โลหิต :
										</div>
										<div class="col-sm-7"><%=student.getBloodGroup()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-medkit" aria-hidden="true"> </i>&nbsp;&nbsp;โรคประจำตัว :
										</div>
										<div class="col-sm-7"><%=student.getDisease()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<script>
						$(function() {
							$('#profile-image1').on('click', function() {
								$('#profile-image-upload').click();
							});
						});
					</script>
				</div>
			</div>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>