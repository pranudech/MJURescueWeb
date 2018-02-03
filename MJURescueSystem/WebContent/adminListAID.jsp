<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.itsci.mjurescue.admin.web.listaid.*"%>
<%
	Vector<AidBean> aidList = (Vector<AidBean>) session.getAttribute("aidList");
	String warning = (String) session.getAttribute("Warning");
	if (warning != null) {
		session.removeAttribute("Warning");
	}
	String checkLogin = (String) session.getAttribute("admin");
	if(checkLogin == null || aidList == null){
		aidList = new Vector<AidBean>();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN LIST AID</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/listaid.js"></script>
</head>



<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="adminIndexAID.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="adminAddDataAID.jsp" class="w3-padding"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูล First AID</a> 
	<a href="ListAidServlet" class="w3-padding  w3-text-teal"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูล First AID</a> 
	<jsp:includepage="common/social.jsp"></jsp:include>
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Manage Frist AID&nbsp;&nbsp;<i class="fa fa-sign-language" aria-hidden="true"></i></b></font>
		</h2>

		<a href="adminIndexAID.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="adminAddDataAID.jsp"><font color="#336600">นำเข้าข้อมูล First AID</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="ListAidServlet"><font color="#800000"><b>จัดการข้อมูล First AID</b></font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => แก้ไข / ลบ ข้อมูลการปฐมพยาบาลเบื้องต้น</h6>
			</legend>
			<div class="container" style="margin-left: 10x">
				<div class="row">
					<div class="col-md-10">
						<div class="table-responsive">
							<table id="mytable" class="table table-bordred table-striped">
								<thead>
									<th></th>
									<th>รหัส</th>
									<th></th>
									<th>หัวข้อการปฐมพยาบาลเบื้องต้น</th>
									<th></th>
									<th></th>
									<th>แก้ไข</th>
									<th>ลบ</th>
								</thead>
								<tbody>
									<%
										for (AidBean a : aidList) {
									%> 

									<tr>
										<td></td>
										<td><%=a.getAidID() %></td>
										<td></td>
										<td><%=a.getTitle() %></td> 
										<td></td>
										<td></td>
										<td>
										<a href="${pageContext.request.contextPath}/EditDataAidServlet?aidID=<%= a.getAidID() %>">
												
											<p data-placement="top" data-toggle="tooltip" title="Edit">
												<button class="btn btn-primary btn-xs pull-up" data-title="Edit" data-toggle="modal" data-target="#edit">
													<span class="fa fa-pencil" aria-hidden="true"></span>
												</button>
											</p>
											</a>
										</td>
										<td>
											 <a href="${pageContext.request.contextPath}/RemoveAidServlet?aidID=<%= a.getAidID() %>" onclick="return confirm('Are you sure you want to delete this Record?')">
												<p data-placement="top" data-toggle="tooltip" title="Delete">
													<button class="btn btn-danger btn-xs pull-up" data-title="Delete" data-toggle="modal" data-target="#delete">
														<span class="fa fa-trash" aria-hidden="true"></span>
													</button>
												</p>
												
										</a></td> 
									</tr>
									 <%
										}
									%> 
								</tbody>
							</table>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>


		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




