<%@ page import="java.util.Vector"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itsci.mjurescue.admin.web.changestudentstatus.*"%>
<%@ page import="java.util.Calendar"%>
<%
	Vector<StudentBean> student = (Vector<StudentBean>) session.getAttribute("listAllStudent");
	String checkLogin = (String) session.getAttribute("admin");
	String selected = (String) session.getAttribute("selected");
	int yearNow = Calendar.getInstance().get(Calendar.YEAR);
	if(student == null){
		student = new Vector<StudentBean>();
		if (checkLogin == null){
			response.sendRedirect("login.jsp");
		}
	}
	if(selected == null){
		selected = "";
	}
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN CHANGE STUDENT STATUS</title>
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
<script language="javascript">  
function chk_all(){  
    var x=document.getElementsByTagName("input");  
    for(i=0;i<=x.length;i++){  
        if(x[i].type=="checkbox"){  
            x[i].checked=true;  
        }  
    }  
}  
function unchk_all(){  
    var x=document.getElementsByTagName("input");  
    for(i=0;i<=x.length;i++){  
        if(x[i].type=="checkbox"){  
            x[i].checked=false;  
        }  
    }  
}  
</script>  
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left"
		style="z-index:3; width:300px;" id="mySidenav"> <br>
	<jsp:include page="common/logo.jsp"></jsp:include> <a
		href="adminIndexStudent.jsp"><i class="fa fa-arrow-circle-left"
		aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> <a
		href="admin_Stu_ViewStudentProfile.jsp" class="w3-padding"><i
		class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;ข้อมูลนักศึกษา</a>
	<a href="adminImportStudent.jsp" class="w3-padding"><i
		class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูลนักศึกษา</a>
	<a href="adminChangeStudentStatus.jsp"
		class="w3-padding w3-text-teal"><i class="fa fa-pencil"
		aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;เปลี่ยนสถานะนักศึกษา</a> <jsp:include
		page="common/social.jsp"></jsp:include> </nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<br>
		<header class="w3-container"> <span
			class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"> <i class="fa fa-bars"></i>
		</span>
		<h2>
			<font color="#2F4F4F"><b>Change Student Status&nbsp;&nbsp;<i
					class="fa fa-stack-overflow" aria-hidden="true"></i></b></font>
		</h2>

		<a href="admin_Index.jsp"><font color="#336600">หน้าหลัก</font></a>
		<b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> <a
			href="admin_Stu_ViewStudentProfile.jsp"><font color="#336600">ข้อมูลนักศึกษา</font></a>
		<b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> <a href="admin_Stu_ImportStudent.jsp"><font
			color="#336600">นำเข้าข้อมูลนักศึกษา</font></a>
		<b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> <a
			href="admin_Stu_ChangeStudentStatus.jsp"><font color="#800000"><b>เปลี่ยนสถานะนักศึกษา</b></font></a>
		<b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

		<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => เปลี่ยนสถานะนักศึกษาที่จบการศึกษาไปแล้ว</h6>
			</legend>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>


		<form name="frm" action="ChangeStudentStatusServlet" method="post">
				<div class="row">
				<div class="col-lg-4">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="fa fa-graduation-cap" aria-hidden="true"> คณะ</i>
							</span> 
							<select name="faculty" class="form-control">
									<option value="ผลิตกรรมการเกษตร">ผลิตกรรมการเกษตร</option>
									<option value="วิศวกรรมและอุตสาหกรรมเกษตร">วิศวกรรมและอุตสาหกรรมเกษตร</option>
									<option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
									<option value="วิทยาลัยบริหารศาสตร์">วิทยาลัยบริหารศาสตร์</option>
									<option value="บริหารธุรกิจ">บริหารธุรกิจ</option>
									<option value="พัฒนาการท่องเที่ยว">พัฒนาการท่องเที่ยว</option>
									<option value="เทคโนโลยีการประมงและทรัพยากรทางน้ำ">เทคโนโลยีการประมงและทรัพยากรทางน้ำ</option>
									<option value="เศรษฐศาสตร์">เศรษฐศาสตร์</option>
									<option value="บัณฑิตวิทยาลัย">บัณฑิตวิทยาลัย</option>
									<option value="ศิลปศาสตร์">ศิลปศาสตร์</option>
									<option value="วิทยาลัยพลังงานทดแทน">วิทยาลัยพลังงานทดแทน</option>
									<option value="สารสนเทศและการสื่อสาร">สารสนเทศและการสื่อสาร</option>
									<option value="สถาปัตยกรรมศาสตร์และการออกแบบสิ่งแวดล้อม">สถาปัตยกรรมศาสตร์และการออกแบบสิ่งแวดล้อม</option>
									<option value="สัตวศาสตร์และเทคโนโลยี">สัตวศาสตร์และเทคโนโลยี</option>
							</select>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="fa fa-graduation-cap" aria-hidden="true"> ปีการศึกษา</i>
							</span> 
							
							<select name="year" class="form-control">
							<% for(int i = 1; i<=6; i++) { %>
								<option value="<%= yearNow-i %>"> <%= yearNow-i %></option>
							<% } %>
							</select>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="fa fa-graduation-cap" aria-hidden="true">Status</i>
							</span> 
							
							<select name="status" class="form-control">
								<option value="Available">Available</option>
								<option value="Not Available">Not Available</option>
							</select>
						</div>
					</div>
					
					<input type="submit" value="OK" class="btn btn-default">
					
				</div>
				</form>
				<!-- /.row -->
				<br>
				<p class="text-center" ><font color="red"><%= selected %></font></p>
				<form name="frmtable" action="ChangeStudentStatusServlet" method="post">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>
								<a href="javascript:chk_all();"><font size="2" color="#008000">
								<i class="fa fa-check-circle-o" aria-hidden="true"></i>
								Check All</font></a><br>
								<a href="javascript:unchk_all();"><font size="2" color="#228B22">
								<i class="fa fa-times" aria-hidden="true"></i>
								Uncheck All</font> </a> 
							</th>
							<th>Student ID</th>
							<th>Student Name</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
					<% for (int i = 0 ; i<student.size(); i++){ %>
						<tr>
      						<td align="center" width="130px">
      						<input type="checkbox" name = "change" value = "<%= student.get(i).getStudentID()+"__"+student.get(i).getStatus() %>"> </td>
     						<td><%= student.get(i).getStudentID() %></td>
      						<td><%= student.get(i).getStudentName() %></td>
    						<td><%= student.get(i).getStatus() %></td>
    					</tr>
					<% } %>
					</tbody>
				</table>
				<input type="submit" value="ยืนยัน" class="btn btn-success">
</form>
			</div>



		</fieldset>


		<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>

</html>




