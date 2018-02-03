<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@page import="java.util.*"%>
<%
	LoginBean login = (LoginBean) session.getAttribute("login");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if(login == null || staff == null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STAFF INDEX NEWS</title>
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
	<a href="staffIndex.jsp" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>กลับสู่หน้าหลักหน้าหลัก</b></a>
	<a href="staffAddNews.jsp" class="w3-padding"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; นำเข้าข้อมูลข่าวสาร</a> 
	<a href="ListNewsServlet" class="w3-padding"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูลข่าวสาร</a> 
	
	<jsp:include page="common/social.jsp"></jsp:include>
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>&nbsp;&nbsp;News Management</b>&nbsp;&nbsp;<i class="fa fa-newspaper-o" aria-hidden="true"></i></font>
		</h2>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
<br><br><br>
		<div>
			<img src="img/news01.png" style="width: 70%; margin-left: 180px">
		</div>
<br><br><br>
<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




