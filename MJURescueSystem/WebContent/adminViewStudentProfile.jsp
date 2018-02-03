<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
 <%
	StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
 	String checkLogin = (String) session.getAttribute("admin");
	if (studentBean == null) {
		studentBean = new StudentBean();
		if(checkLogin == null){
			response.sendRedirect("login.jsp");
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN VIEW STUDENT PROFILE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/aaa.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<script src="https://maps.googleapis.com/maps/api/js?signed_in=true&libraries=places&callback=initAutocomplete" async defer></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script src="js/stuprofile.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/searchStu.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="adminIndexStudent.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="adminViewStudentProfile.jsp" class="w3-padding  w3-text-teal"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ข้อมูลนักศึกษา</a> 
	<a href="adminImportStudent.jsp" class="w3-padding"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูลนักศึกษา</a>
	<a href="adminChangeStudentStatus.jsp" class="w3-padding"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;เปลี่ยนสถานะนักศึกษา</a> 
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Student Profile&nbsp;&nbsp;<i class="fa fa-users" aria-hidden="true"></i></b></font>
		</h2>

		<a href="adminIndex.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="adminViewStudentProfile.jsp"><font color="#800000"><b>ข้อมูลนักศึกษา</b></font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="adminImportStudent.jsp"><font color="#339966">นำเข้าข้อมูลนักศึกษา</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="adminChangeStudentStatus.jsp"><font color="#336600">เปลี่ยนสถานะนักศึกษา</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => ดูข้อมูลส่วนตัวนักศึกษา</h6>
			</legend>

			<div class="container">
				<div class="row">
					<div class="col-md-7 ">
						<div class="panel panel-default">
							<div class="panel-heading">
<!-- Form -->
								<form name="frmSearch" action="AdminViewStudentProfileServlet" method="post">
									<div class="input-group input-datepicker">
										<div class="input-group" style="margin-left: 480px">
											<input class="form-control" type="text" name="search" placeholder="ระบุรหัสนักศึกษา 10 ตัว" required /> 
											<span class="input-group-btn">
												<button class="btn btn-success" type="submit">
													<i class="fa fa-search" aria-hidden="true"></i> 
													<span style="margin-left: 10px;">Search</span>
												</button>
											</span>
										</div>
									</div>
								</form>
								
							</div>
							<div class="panel-body">
								<div class="box box-info">
									<div class="box-body">
									
										<div class="clearfix"></div>
										<hr style="margin: 5px 0 5px 0;">
										
										 <div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-list-ol" aria-hidden="true"></i>&nbsp;&nbsp;รหัสนักศึกษา :</div>
										<div class="col-sm-7 col-xs-6 "><%=studentBean.getStudentID() %></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
										
										 <div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;ชื่อ - นามสกุล :</div>
										<div class="col-sm-7 col-xs-6 "><%=studentBean.getStudentName()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
										
										 <div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;&nbsp;คณะ :</div>
										<div class="col-sm-7 col-xs-6 "><%=studentBean.getFaculty() %></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
										
										 <div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-book" aria-hidden="true"></i>&nbsp;&nbsp;สาขา:</div>
										<div class="col-sm-7 col-xs-6 "><%=studentBean.getDepartment() %></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-barcode" aria-hidden="true"> </i>&nbsp;&nbsp;รหัสบัตรประจำตัวประชาชน :</div>
										<div class="col-sm-7"><%=studentBean.getStudentIdCode()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-home" aria-hidden="true"> </i>&nbsp;&nbsp;ที่อยู่ :</div>
										<div class="col-sm-7"><%= studentBean.getAddress() %></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-mobile" aria-hidden="true"> </i>&nbsp;&nbsp;&nbsp;&nbsp;เบอร์โทรศัพท์ :</div>
										<div class="col-sm-7"><%=studentBean.getPhoneNumber()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-phone" aria-hidden="true"> </i>&nbsp;&nbsp;เบอร์โทรศัพท์ติดต่อ (กรณีฉุกเฉิน):</div>
										<div class="col-sm-7"><%=studentBean.getPhoneReserve()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-tint" aria-hidden="true"> </i>&nbsp;&nbsp;&nbsp;หมู่โลหิต :</div>
										<div class="col-sm-7"><%=studentBean.getBloodGroup()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-5 col-xs-6 tital ">
											<i class="fa fa-medkit" aria-hidden="true"> </i>&nbsp;&nbsp;โรคประจำตัว :</div>
										<div class="col-sm-7"><%=studentBean.getDisease()%></div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
									</div> 
								</div>
							</div>
						</div>
					</div>
					<!-- <script>
						$(function() {
							$('#profile-image1').on('click', function() {
								$('#profile-image-upload').click();
							});
						});
					</script> -->
				</div>
			</div>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>

<!-- Script -->
		<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




