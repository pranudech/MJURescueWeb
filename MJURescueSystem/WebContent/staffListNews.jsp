<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.itsci.mjurescue.staff.web.listnews.*"%>
<%@ page import="com.itsci.mjurescue.login.*"%>
<%
	Vector<NewsBean> newsList = (Vector<NewsBean>) session.getAttribute("newsList");
	String warning = (String) session.getAttribute("Warning");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if (warning != null) {
		session.removeAttribute("Warning");
	}
	if(newsList == null || staff == null){
		newsList = new Vector<NewsBean>();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>STAFF LIST NEWS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<script type="text/javascript" src="js/img.js"></script>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav"><br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href=staffIndexNews.jsp><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="staffAddNews.jsp" class="w3-padding"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูลข่าวสาร</a>
	<a href="#" class="w3-padding w3-text-teal"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูลข่าวสาร</a> 
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Add News &nbsp;&nbsp;
			<i class="fa fa-newspaper-o" aria-hidden="true"></i></b></font>
		</h2>

		<a href="staffIndex.jsp"><font color="#336600">หน้าหลัก</font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="staffAddNews.jsp"><font color="#336600"><b>นำเข้าข้อมูลข่าวสาร</b></font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="ListNewsServlet"><font color="#800000">จัดการข้อมูลข่าวสาร</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => รายการข่าวสาร</h6>
			</legend>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr  align="center">
							<th><em class="fa fa-cog"></em></th>
							<!-- <th class="hidden-xs">News ID</th> -->
							<th>หัวข้อข่าวสาร</th>
							<th>วันที่-เวลา</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (NewsBean n : newsList) {
						%>

						<tr>
							<td align="center">
								<a href="${pageContext.request.contextPath}/RemoveNewsServlet?newsID=<%= n.getNewsFeddID() %>"
								onclick="return confirm('Are you sure you want to delete this Record?')">
									<p data-placement="top" data-toggle="tooltip" title="Delete">
										<button class="btn btn-danger">
											<em class="fa fa-trash" aria-hidden="true"></em>
										</button>
									</p>
							</a></td>
							<%-- <td class="hidden-xs"><%= n.getNewsFeddID() %></td> --%>
							<td><%= n.getTitle() %></td>
							<td><%= n.getDate() %></td>
						</tr>
						<%
							}
						%>
					</tbody>

				</table>

			</div>

		</fieldset>

		<!-- Footer -->
		<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>

</html>




