<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="com.itsci.mjurescue.staff.web.listspecifications.*"%>
<%@ page import="com.itsci.mjurescue.login.*"%>
<%
	SpecificationsBean spBean = (SpecificationsBean) session.getAttribute("spBean");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if(spBean == null || staff == null){
		spBean = new SpecificationsBean();
		response.sendRedirect("login.jsp");
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EDIT SPECIFICATIONS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" type="text/css" href="css/changestatusstu.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/buttonliststudent.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
		<a href="${pageContext.request.contextPath}/ViewAccidentSpecificationsServlet?specificationID=<%= spBean.getFormStaffID() %>" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;Back</a> 
		<a href="#" class="w3-padding w3-text-teal"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp; แก้ไขรายละเอียดของอุบัติเหตุ</a>
	
	<jsp:include page="common/social.jsp"></jsp:include> </nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> <span
			class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"> <i class="fa fa-bars"></i>
		</span>
		<h2>
			<font color="#2F4F4F"><b>Edit Specifications Accident&nbsp;&nbsp;<i class="fa fa-wrench"></i></b></font>
		</h2>

		<a href="staffIndex.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="#"><font color="#336600"><b>แก้ไขรายละเอียดของอุบัติเหตุ</b></font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Staff => แก้ไข /เพิ่มข้อมูลของรายละเอียดในแต่ละอุบัติเหตุ</h6>
			</legend>
<form name="frmEditSpecifications" action="EditSpecificationsServlet" method="post">
<div class="container-fluid">
    <section class="container">

		<div class="container-page">
			<div class="col-md-4">
				<h3 class="dark-grey">Specifications</h3>
				<p>
					รหัสแบบฟอร์ม : <font color="#29A469"><b><%= spBean.getFormStaffID() %></b></font>
				</p>
				<p>
					หมายเลขแบบฟอร์มของเจ้าหน้าที่ :  
					<input type="text" name="numberOperations" class="form-control" id="" value="<%= spBean.getNumberOperations() %>">
				</p>
				<p>
				สถานะการแจ้งเตือน : <font color="#29A469"><b><%= spBean.getStatusCase() %></b></font>
					</p>
				<p>
				วันที่ : <font color="#29A469"><b><%= spBean.getDate() %></b></font>
					</p>
				
				
			</div>				
			<div class="col-md-6">
				<h3 class="dark-grey">Edit Specifications</h3>
				<input type="hidden" name="hidden" value="<%= spBean.getFormStaffID() %>">
				<div class="form-group col-lg-12">
					<label>สถานะอุบัติเหตุ</label>
					<input type="text" name="receiveNotification" class="form-control" id="" value="<%= spBean.getReceiveNotification() %>">
				</div>
				<div class="form-group col-lg-6">
					<label>สถานที่เกิดเหตุ </label>
					<input type="text" name="location" class="form-control" id="" value="<%= spBean.getAccidentLocation() %>">
				</div>
				<div class="form-group col-lg-6">
					<label>หมายเลขป้ายทะเบียน</label>
					<input type="text" name="license" class="form-control" id="" value="<%= spBean.getLicensePlate() %>">
				</div>
				
				
								<div class="form-group col-lg-6">
					<label>.</label>
					<p></p>
				</div>			
				<div class="form-group col-lg-6">
					<label>ชื่อเจ้าหน้าที่ปฏิบัติงาน</label>
					<input type="text" name="namestaff" class="form-control" id="" value="<%= spBean.getListOperationsOfficer() %>">
				</div>
				
				
				
			<br>	
			<button type="submit" class="btn btn-warning" style="margin-left: 380px">
			<i class="fa fa-pencil" aria-hidden="true"></i> Confirm Edit</button>
			</div>
			
		
		
</div>

	</section>
</div>
		</form>
			<br>			
			<br>	
		</fieldset>


		<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>

</html>




