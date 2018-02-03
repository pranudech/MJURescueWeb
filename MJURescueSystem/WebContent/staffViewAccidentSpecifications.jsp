<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="com.itsci.mjurescue.staff.web.listspecifications.*"%>
<%@ page import="com.itsci.mjurescue.login.*"%>
<%
	SpecificationsBean spBean = (SpecificationsBean) session.getAttribute("spBean");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if(spBean == null || staff == null){
		response.sendRedirect("login.jsp");
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STAFF VIEW ACCIDENT SPECIFICATIONS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/statistics.css">
<link rel="stylesheet" type="text/css" href="css/viewSpecifications.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/statistics.js"></script>
<link rel="stylesheet" type="text/css" href="css/searchStu.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="SpecificationsServlet" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;Back</a> 
	<a href="SpecificationsServlet" class="w3-padding"><i class="fa fa-sort-amount-desc" aria-hidden="true"></i>&nbsp;&nbsp;แสดงรายการอุบัติเหตุ</a>
	<a href="staffViewAccidentSpecifications.jsp" class="w3-padding w3-text-teal"><i class="fa fa-file" aria-hidden="true"></i>&nbsp;&nbsp;รายละเอียดของอุบัติเหตุ</a>

	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Accident Specification&nbsp;&nbsp;<i class="fa fa-stack-overflow" aria-hidden="true"></i></b></font>
		</h2>

		<a href="staffIndex.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="SpecificationsServlet"><font color="#336600">รายการของอุบัติเหตุ</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="staffViewAccidentSpecifications.jsp"><font color="#800000"><b>รายละเอียดของอุบัติเหตุ</b></font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System => ข้อมูลรายละเอียดการเกิดอุบัติเหตุ</h6>
			</legend>
<div class="container-fluid"><br><br>
    <section class="container">

		<div class="container-page">
			<div class="col-md-4">
				<h3 class="dark-grey">Specifications</h3><br>
				<p>
					รหัสแบบฟอร์ม <i class="fa fa-hand-o-right" aria-hidden="true"></i> <font color="#29A469"><b><%= spBean.getFormStaffID() %></b></font>
				</p>
				<p>
					หมายเลขแบบฟอร์ม  <i class="fa fa-hand-o-right" aria-hidden="true"></i> <font color="#29A469"><b><%= spBean.getNumberOperations() %></b></font>
				</p>
				<p>
				สถานะการแจ้งเตือน <i class="fa fa-hand-o-right" aria-hidden="true"></i> <font color="#29A469"><b><%= spBean.getStatusCase() %></b></font>
					</p>
				<p>
				วันที่  <i class="fa fa-hand-o-right" aria-hidden="true"></i> <font color="#29A469"><b><%= spBean.getDate() %></b></font>
					</p>
				
				
			</div>				
			<div class="col-md-6"  style="margin-left: 70px">
				<h3 class="dark-grey">Accident information</h3><br>
				
				<div class="form-group col-lg-6">
					<p>สถานะอุบัติเหตุ <i class="fa fa-hand-o-down" aria-hidden="true"></i></p>
					<font color="#29A469"><b><%= spBean.getReceiveNotification() %></b></font>
				</div>
				<div class="form-group col-lg-6">
					<p>สถานที่เกิดเหตุ <i class="fa fa-hand-o-down" aria-hidden="true"></i></p>
					<font color="#29A469"><b><%= spBean.getAccidentLocation() %></b></font>
				</div>
				<div class="form-group col-lg-6">
					<p>หมายเลขป้ายทะเบียน <i class="fa fa-hand-o-down" aria-hidden="true"></i></p>
					<font color="#29A469"><b><%= spBean.getLicensePlate() %></b></font>
				</div>
				<div class="form-group col-lg-6">
					<p>ชื่อเจ้าหน้าที่ปฏิบัติงาน <i class="fa fa-hand-o-down" aria-hidden="true"></i></p>
					<font color="#29A469"><b><%= spBean.getListOperationsOfficer() %></b></font>
				</div>
				
				
				
			<br>	

                   
                    
			</div>
			
			<div style="width: 75%">
			
                        <span class="pull-right"><br><br>
                        <a href="${pageContext.request.contextPath}/EditSpecificationsServlet?editID=<%= spBean.getFormStaffID() %>">
                            <button class="btn btn-warning" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Edit this Accident"><i class="fa fa-pencil" aria-hidden="true"></i></button></a>
                       <a href="${pageContext.request.contextPath}/RemoveSpecificationsServlet?removeID=<%= spBean.getFormStaffID() %>" onclick="return confirm('Are you sure you want to delete this Record?')">
                        
                            <button class="btn btn-danger" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Remove this Accident"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                    </a>
                                    <br><br>
                        </span>
		</div>
</div>

	</section>
	<br><br>
</div>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




