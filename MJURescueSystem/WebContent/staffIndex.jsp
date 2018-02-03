<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@page import="java.util.*"%>
<%
	LoginBean loging = (LoginBean) session.getAttribute("login");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	
	if(loging == null || staff == null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STAFF INDEX</title>
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
	<a href="staffIndex.jsp" class="w3-padding w3-text-teal"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;หน้าหลัก</a> 
	<a href="staffIndexNews.jsp" class="w3-padding"><i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;&nbsp;ข่าวสาร</a>
	<a href="viewAccidentStatistics.jsp" class="w3-padding"><i class="fa fa-database" aria-hidden="true"></i>&nbsp;&nbsp; สถิติการเกิดอุบัติเหตุ</a>
	<a href="SpecificationsServlet" class="w3-padding"><i class="fa fa-sort-amount-desc" aria-hidden="true"></i>&nbsp;&nbsp;แสดงรายการอุบัติเหตุ</a>
	<a href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;ออกจากระบบ </a> 
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>ID:&nbsp;&nbsp;<%= staff.getStaffID() %></b>&nbsp;&nbsp;<i class="fa fa-life-ring" aria-hidden="true"></i>&nbsp;&nbsp; <%= staff.getName() %></font>
		</h2>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<div>
			<img src="img/IndexStaff.png" style="width: 80%; margin-left: 130px">
		</div>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




