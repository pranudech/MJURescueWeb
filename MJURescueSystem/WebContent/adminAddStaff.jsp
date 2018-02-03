<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itsci.mjurescue.admin.web.importstudentdata.*"%>
<%
	String checkLogin = (String) session.getAttribute("admin");
	if(checkLogin == null){
		response.sendRedirect("login.jsp");
	}
	String staffMessage = (String) session.getAttribute("isAddStaffData");
	session.removeAttribute("isAddStaffData");
	if (staffMessage == null) {
		staffMessage = "-";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN ADD STAFF</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/test.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left"
		style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include> <a
		href="adminIndexStaff.jsp" class="w3-padding"><i
		class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Back</a>
	<a href="#" class="w3-padding w3-text-teal"><i class="fa fa-user"
		aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; เพิ่มข้อมูล STAFF</a> <a
		href="ListStaffServlet" class="w3-padding"><i class="fa fa-cog"
		aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูล STAFF</a> <a
		href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out"
		aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ออกจากระบบ</a> <jsp:include
		page="common/social.jsp"></jsp:include> </nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> <span
			class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>&nbsp;&nbsp;ADD STAFF</b>&nbsp;&nbsp;<i
				class="fa fa-plus" aria-hidden="true"></i></font>
		</h2>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->

		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System => เพิ่มข้อมูลเจ้าหน้าที่</h6>
			</legend>
			<br>
			<br>
			<br>
			<div class="container">
				<div class="row">
					<form role="form" class="col-md-12 go-right"
						action="AddStaffDataServlet" method="post">

						<p>Form To Add Staff Data.</p>
						<br>
						<div class="form-group">

							<input id="name" name="staffID" type="text" class="form-control"
								required maxlength="10"> <label for="name">
								Staff ID</label>
						</div>
						<br>
						<div class="form-group">

							<input id="password" name="password" type="password"
								class="form-control" required maxlength="13"> <label
								for="password"> Password</label>
						</div>
						<br>
						<div class="form-group">

							<input id="confirmPassword" name="confirmPassword"
								type="password" class="form-control" required maxlength="13">
							<label for="confirmPassword"> Confirm Password</label>
						</div>
						<br>
						<div class="form-group">
							<input id="phone" name="staffName" type="tel"
								class="form-control" required maxlength="125"> <label
								for="phone">Staff Name</label>
						</div>
						<br>
						<div class="form-group">
						<input type="submit" value="Add"><br>
				
						</div>

					</form>
				</div>
				<label><font color="red">Status is add : <%=staffMessage%></font></label>
			</div>



		</fieldset>



		<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




