<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itsci.mjurescue.admin.web.importstudentdata.*"%>
<%  String studentMessage = (String) session.getAttribute("studentMessage");
	String checkLogin = (String) session.getAttribute("admin");
	session.removeAttribute("studentMessage");
	if(studentMessage == null){
		studentMessage = "-";
	}
	if(checkLogin == null){
		response.sendRedirect("login.jsp");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN IMPORT STUDENT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="adminIndexStudent.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="adminViewStudentProfile.jsp" class="w3-padding"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ข้อมูลนักศึกษา</a> 
	<a href="adminImportStudent.jsp" class="w3-padding w3-text-teal"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูลนักศึกษา</a> 
	<a href="adminChangeStudentStatus.jsp" class="w3-padding"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;เปลี่ยนสถานะนักศึกษา</a> 
	<jsp:include page="common/social.jsp"></jsp:include>
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i>
		</span>
		<h2>
			<font color="#2F4F4F"><b>Import Student Data&nbsp;&nbsp;<i class="fa fa-upload" aria-hidden="true"></i></b></font>
		</h2>

		<a href="adminIndex.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="adminViewStudentProfile.jsp"><font color="#336600">ข้อมูลนักศึกษา</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="adminImportStudent.jsp"><font color="#800000"><b>นำเข้าข้อมูลนักศึกษา</b></font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="adminChangeStudentStatus.jsp"><font color="#336600">เปลี่ยนสถานะนักศึกษา</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
<form name="frmImportStudent" action="ImportStudentDataServlet" method="post" enctype="multipart/form-data">
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => นำเข้าข้อมูลนักศึกษาปีการศึกษาใหม่</h6>
			</legend>

<!-- File Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="filebutton">Upload file</label>
				<div class="col-md-4">
					<input id="filetoupload" name="filetoupload" type="file">
				</div>
			</div>
			<br>
<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="singlebutton"></label>
				<div class="col-md-4">
					<input type="submit" class="btn btn-primary" value="นำเข้าข้อมูลนักศึกษา">
				</div>
			</div>
			<img alt="" src="img/ImportStudent.png" style="width: 800px; height: 350px; margin-left: 120px; margin-top: -45px">
			<br>
			<br>
			<label class="col-md-12 control-label" ><font color="red">Status Upload file : <%= studentMessage %></font></label>
		</fieldset>
</form>
<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




