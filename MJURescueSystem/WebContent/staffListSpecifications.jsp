<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.itsci.mjurescue.staff.web.listspecifications.*"%>
<%@ page import="com.itsci.mjurescue.login.*"%>
<%
	Vector<SpecificationsBean> specificationsList = (Vector<SpecificationsBean>) session.getAttribute("specificationsBeans");
	String warning = (String) session.getAttribute("Warning");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if (warning != null) {
		session.removeAttribute("Warning");
	}
	if(specificationsList == null || staff == null){
		specificationsList = new Vector<SpecificationsBean>();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LIST SPECIFICATIONS</title>
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
	<a href="staffIndex.jsp" class="w3-padding"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;กลับสู่หน้าหลักหน้าหลัก</a>
	<a href="#" class="w3-padding w3-text-teal"><i class="fa fa-sort-amount-desc" aria-hidden="true"></i>&nbsp;&nbsp;รายการอุบัติเหตุ</a>
	
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
			<font color="#2F4F4F"><b>List Accidents&nbsp;&nbsp;<i class="fa fa-list-alt" aria-hidden="true"></i></b></font>
		</h2>

		<a href="staff_Index.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 

		<a href="#"><font color="#800000"><b>รายการอุบัติเหตุ</b></font></a>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Staff => List Accident Specifications</h6>
			</legend>
						<div class="container">
    <div class="row">
        <div class="col-sm-8 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>รายการอุบัติเหตุ</th>
                        <th>สถานที่</th>
                        <th class="text-center">ทะเบียนรถ</th>
                        <th class="text-center">วันที่-เวลา</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
              <% for(SpecificationsBean s : specificationsList){ %> 
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="${pageContext.request.contextPath}/ViewAccidentSpecificationsServlet?specificationID=<%= s.getFormStaffID() %>"> 
                            	<img class="media-object" src="img/icon256.png" style="width: 60px; height: 60px;"> </a>
                            <div class="media-body">
                                <h5 class="media-heading">&nbsp;ID Form: <%= s.getFormStaffID() %> </h5>
                                <h5 class="media-heading">&nbsp;Number operations: <%= s.getNumberOperations() %> </h5>
                                <span>&nbsp;Status Case: </span><span class="text-success"><%= s.getStatusCase() %></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-2">
                       		<%= s.getAccidentLocation() %>
                        </td>
                        <td class="col-sm-1 col-md-2 text-center"><%= s.getLicensePlate() %></td>
                        <td class="col-sm-1 col-md-2 text-center"><%= s.getDate() %></td>
                        <td class="col-sm-1 col-md-1">
                        <a href="${pageContext.request.contextPath}/RemoveSpecificationsServlet?removeID=<%= s.getFormStaffID() %>" onclick="return confirm('Are you sure you want to delete this Record?')">
                        <button type="button" class="btn btn-danger">
                           <i class="fa fa-trash" aria-hidden="true"></i> Remove
                        </button></a>
                        </td>
                    </tr>
                    
                <% } %> 
                </tbody>
            </table>
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




