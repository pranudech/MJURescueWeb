<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itsci.mjurescue.web.statistics.*" %>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@page import="java.util.*"%>
<%
	LoginBean loging = (LoginBean) session.getAttribute("login");
	if(loging == null){
		loging = new LoginBean();
		response.sendRedirect("login.jsp");
	}
	 StatisticsBean statisticsBean = (StatisticsBean) session.getAttribute("statisticsBean");
	String checklogin = (String) session.getAttribute("board");
	if(checklogin == null){
		checklogin = " ";
	}
	if(statisticsBean == null){
		statisticsBean = new StatisticsBean();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STAFF VIEW ACCIDENT STATISTICS</title>
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
<link rel="stylesheet" type="text/css" href="css/statistics.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/statistics.js"></script>
<link rel="stylesheet" type="text/css" href="css/searchStu.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
</head>
<script type="text/javascript">
function printTable(tableprint) {
	var printContents = document.getElementById(tableprint).innerHTML;
	var originalContents = document.body.innerHTML;
	document.body.innerHTML = printContents;
	window.print();
	document.body.innerHTML = originalContents;
}
</script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left"
		style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include>
	<% if(checklogin.equals("board")){ %>
	<a href="boardIndex.jsp" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;กลับสู่หน้าหลักหน้าหลัก</a>
	<% }else{ %> 
	<a href="staffIndex.jsp" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;กลับสู่หน้าหลักหน้าหลัก</a>
	<% } %>
	<a href="#" class="w3-padding w3-text-teal"><i
		class="fa fa-database" aria-hidden="true"></i>&nbsp;&nbsp;สถิติการเกิดอุบัติเหตุ</a>

	<jsp:include page="common/social.jsp"></jsp:include> </nav>

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
			<font color="#2F4F4F"><b>Accident Statistics&nbsp;&nbsp;<i
					class="fa fa-stack-overflow" aria-hidden="true"></i></b></font>
		</h2>
		<a href="staffIndex.jsp"><font color="#336600">หน้าหลัก</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="#"><font color="#800000"><b>ข้อมูลสถิติการเกิดอุบัติเหตุ</b></font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System => ข้อมูลสถิติการเกิดอุบัติเหตุ</h6>
			</legend>
			<div class="container">
				<div class="row">
					<div class="col-md-7 ">
						<div class="panel panel-default">
							<form name="frmstatistics" action="StatisticsServlet"
								method="post">
								<div class="panel-heading">
									<div class="col-md-4">
										<select id="selectbasic" name="statistics"
											class="form-control">
											<option value="1">ไตรมาสที่ 1 ธันวา - กุมภา</option>
											<option value="2">ไตรมาสที่ 2 มีนา - พฤษภา</option>
											<option value="3">ไตรมาสที่ 3 มิถุนา - สิงหา</option>
											<option value="4">ไตรมาสที่ 4 กันยา - พฤศจิกา</option>
										</select>
									</div>
									<div class="col-md-2">
									<input type="text" class="form-control" maxlength="4" name="year">
									</div>
									<div class="container">
										<div class="col-md-4">
											<input type="submit" value="View" class="btn btn-sm btn-hover btn-primary">
										</div>
									</div>
								</div>
							</form>
							<br>
						<div id="print_table">	
							<div class="container">
								<div class="row">
									<div class="col-md-7">
										<h3>
											<span class="semi-bold">สถิติการเกิดอุบัติเหตุ  <%= statisticsBean.getYear() %></span>
										</h3>
										<p>แบ่งตาม สถานะการเกิดอุบัติเหตุ ของผู้ประสบเหตุ  <%= statisticsBean.getQuarter() %></p>
										<br>

										<!-- graph 1 -->
										<div class="col-md-11">
											<div class="progress" style="height: 20px">
												<div data-percentage="0%" style="width: <%= statisticsBean.getGreen() %>0%;"
													class="progress-bar progress-bar-success"
													role="progressbar" aria-valuemin="0" aria-valuemax="100">
													<span><%= statisticsBean.getGreen() %> ครั้ง</span>
												</div>
												<span class="progress-completed pull-right">Status Green</span>
											</div>

											<!-- graph 2 -->
											<div class="progress" style="height: 20px">
												<div data-percentage="0%" style="width: <%= statisticsBean.getYellow() %>0%;"
													class="progress-bar progress-bar-warning"
													role="progressbar" aria-valuemin="0" aria-valuemax="100">
													<span><%= statisticsBean.getYellow() %> ครั้ง</span>
												</div>
												<span class="progress-completed pull-right">Status Yellow</span>
											</div>

											<!-- graph 3 -->
											<div class="progress" style="height: 20px">
												<div data-percentage="0%" style="width: <%= statisticsBean.getRed() %>0%;"
													class="progress-bar progress-bar-danger" role="progressbar"
													aria-valuemin="0" aria-valuemax="100">
													<span><%= statisticsBean.getRed() %> ครั้ง</span>
												</div>
												<span class="progress-completed pull-right">Status Red</span>
											</div>
											<br> <br>
										</div>

									</div>

								</div>
							</div>
						</div>
						<button type="button" class="btn btn-primary btn-sm wow fadeInRightBig animated" OnClick="printTable('print_table');">Print</button>
					</div>
				</div>
			</div>
	</div>

	</fieldset>


	<!-- Footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>


	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




