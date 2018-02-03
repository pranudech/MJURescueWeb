<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itsci.mjurescue.admin.web.editdataaid.*"%>
<%@page import="java.util.*"%>
<%  
	AidBean listAid = (AidBean) session.getAttribute("listAid");
	String checkLogin = (String) session.getAttribute("admin");
	if(checkLogin == null || listAid == null){
		listAid = new AidBean();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN EDIT AID</title>
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
	<a href="adminIndexAID.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="adminAddDataAID.jsp" class="w3-padding"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูล First AID</a> 
	<a href="ListAidServlet" class="w3-padding w3-text-teal"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูล First AID</a> <jsp:include page="common/social.jsp"></jsp:include> 
	</nav>
	
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Edit AID&nbsp;&nbsp;<i class="fa fa-wrench"></i></b></font>
		</h2>

		<a href="admin_IndexAID.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
			<a href="adminAddDataAID.jsp"><font color="#336600"><b>นำเข้าข้อมูล First AID</b></font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
			<a href="ListAidServlet"><font color="#800000">จัดการข้อมูล First AID</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Form -->
		<form name="frmEditAid" action="EditDataAidServlet" method="post" class="form-horizontal">
			<input type="hidden" name="studentID" value="">
			<fieldset style="margin-left: 20px; margin-bottom: 18px">
				<legend>
					<h6>Mju Rescue System => แก้ไขข้อมูลการปฐมพยาบาลเบื้องต้น</h6>
				</legend>

				<div class="panel panel-default">
					<div class="panel-body">
						<div class="box box-info">
<!-- Text Edit ID AID-->
							
							<input type="hidden" name="hidden" value="<%= listAid.getAidID() %>">
								
<!-- Text Edit Title AID-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="3">Title</font></label>
								<div class="col-md-6">
									<input name="titleAID" class="form-control input-md" required="" value="<%= listAid.getTitle() %>">
								</div>
							</div>

<!-- Text Edit Content AID-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textinput"> 
								<font size="3">Details</font></label>
								<div class="col-md-6">
									<textarea name="contentAID" id="contentAID" class="form-control" rows="9" cols="25" required="required" placeholder="ระบุเนื้อหาการปญมพยาบาลเบื้องต้น"><%= listAid.getContent() %></textarea>
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