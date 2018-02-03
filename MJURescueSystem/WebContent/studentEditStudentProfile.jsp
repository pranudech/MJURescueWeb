<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="com.itsci.mjurescue.student.web.viewstudentprofile.*"%> --%>
<%@page import="com.itsci.mjurescue.login.*"%>
 <%
	StudentBean student = (StudentBean) session.getAttribute("student");
	String studentID = request.getParameter("studentID");
	if(student == null || studentID == null){
		student = new StudentBean();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STUDENT EDIT STUDENT PROFILE</title>
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
<link rel="stylesheet" type="text/css" href="css/editStu.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="studentIndex.jsp" class="w3-padding"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;หน้าหลัก</a> 
	<a href="studentViewStudentProfile.jsp" class="w3-padding"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;ข้อมูลนักศึกษา</a>
	<a href="studentChangePassword.jsp" class="w3-padding"><i class="fa fa-text-width" aria-hidden="true"></i>&nbsp;&nbsp;เปลี่ยนรหัสผ่าน</a>
	<a href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;ออกจากระบบ</a> <!-- /Menu Bar --> <!-- Social -->
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>
	
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Edit Profile&nbsp;&nbsp;<i class="fa fa-wrench"></i></b></font>
		</h2>

		<a href="studentIndex.jsp"><font color="#336600">หน้าหลัก</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="studentViewStudentProfile.jsp"><font color="#339933">ข้อมูลนักศึกษา</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="studentChangePassword.jsp"><font color="#339966">เปลี่ยนรหัสผ่าน</font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Form -->
		<form name="frmEditProfile" action="ViewStudentProfileServlet" method="get" class="form-horizontal">
			<input type="hidden" name="studentID" value="<%=studentID%>">
			<fieldset style="margin-left: 20px; margin-bottom: 18px">
				<legend>
					<h6>Mju Rescue System => แก้ไข / เพิ่ม ข้อมูลส่วนตัว</h6>
				</legend>

				<div class="panel panel-default">
					<div class="panel-body">
						<div class="box box-info">

<!-- Text input Address-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="5"><i class="fa fa-home" aria-hidden="true"> </i></font></label>
								<div class="col-md-6">
									<textarea name="address" class="form-control input-md" required=""><%=student.getAddress()%></textarea>
								</div>
							</div>

<!-- Text input PhoneNumber-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="6"><i class="fa fa-mobile" aria-hidden="true"></i></font></label>
								<div class="col-md-6">
									<input name="phone1" type="text" class="form-control input-md" required="" value="<%=student.getPhoneNumber()%>">
								</div>
							</div>

<!-- Text input PhoneReserve-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="5"><i class="fa fa-phone" aria-hidden="true"></i></font></label>
								<div class="col-md-6">
									<input name="phone2" type="text" class="form-control input-md" required="" value="<%=student.getPhoneReserve()%>">
								</div>
							</div>

<!-- Text input BloodGroup-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="5"><i class="fa fa-tint" aria-hidden="true"> </i></font></label>
								<div class="col-md-6">
									<input name="blood" type="text" class="form-control input-md" required="" value="<%=student.getBloodGroup()%>">
								</div>
							</div>

<!-- Text input Disease-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="4"><i class="fa fa-medkit" aria-hidden="true"></i></font></label>
								<div class="col-md-6">
									<textarea name="disease" class="form-control input-md"required=""><%=student.getDisease()%></textarea>
								</div>
							</div>

<!-- Button -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="singlebutton">Edit your profile ?</label>
								<div class="row">
									<div class="col-md-12">
										<div class="ui-group-buttons">
											<input type="submit" class="btn btn-success" value="submit">
											<div class="or"></div>
											<input type="reset" class="btn btn-danger" value="reset">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form> 

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>