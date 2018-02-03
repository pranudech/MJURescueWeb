<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.itsci.mjurescue.admin.web.liststaff.*"%>
<%
	Vector<StaffBean> sBeans = (Vector<StaffBean>) session.getAttribute("sBeans");
	String warning = (String) session.getAttribute("Warning");
	String checkLogin = (String) session.getAttribute("admin");
	if (warning != null) {
		session.removeAttribute("Warning");
	}
	if(checkLogin == null || sBeans == null){
		sBeans = new Vector<StaffBean>();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN LIST STAFF</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/liststaff.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="adminIndexStaff.jsp" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Back</a>
	<a href="adminAddStaff.jsp" class="w3-padding"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; เพิ่มข้อมูล STAFF</a> 
	<a href="#" class="w3-padding w3-text-teal"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูล STAFF</a> 
	<a href="LogoutServlet" class="w3-padding"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ออกจากระบบ</a> 
	<jsp:include page="common/social.jsp"></jsp:include>
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>&nbsp;&nbsp;LIST STAFF</b>&nbsp;&nbsp;<i class="fa fa-slideshare" aria-hidden="true"></i></font>
		</h2>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->

			<fieldset style="margin-left: 20px; margin-bottom: 18px">
				<legend>
					<h6>Mju Rescue System => รายชื่อเจ้าหน้าที่กู้ภัย</h6>
				</legend>
				<br>
			<form name="frmStaff" action="ChangeStaffStatusServlet" method="post">
				<div class="container" style="margin-left: 10x">
				<div class="row">
					<div class="col-md-10">
						<div class="table-responsive">
							<table id="mytable" class="table table-bordred table-striped">
								<thead>
									<th></th>
									<th>รหัสเจ้าหน้าที่</th>
									<th></th>
									<th>ชื่อ-สกุล เจ้าหน้าที่</th>
									<th></th>
									<th></th>
									<th>สถานะ</th>
									<th>เปลี่ยนสถานะ</th>
								
								</thead>
								<tbody>
									<% for (int i = 0 ; i<sBeans.size(); i++){ %>
									<tr>
										<td></td>
										<td><%= sBeans.get(i).getStaffID() %></td>
										<td></td>
										<td><%= sBeans.get(i).getName() %></td> 
										<td></td>
										<td></td>
										<td><%= sBeans.get(i).getStatus() %></td>
										<td>
										<input type="checkbox" name = "changeStaff" value = "<%= sBeans.get(i).getStaffID()+"___"+sBeans.get(i).getStatus() %>">
										</td> 
										
									</tr>
									 <%
										}
									%> 
								</tbody>
								
							</table>
							<input type="submit" class="btn btn-success" value="เปลี่ยนสถานะเจ้าหน้าที่" style="margin-left: 750px">
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			</form>
				</fieldset>



<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




