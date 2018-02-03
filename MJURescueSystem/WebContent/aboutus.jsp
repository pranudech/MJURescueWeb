<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>USER ABOUT US</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/aboutus.css">
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav">
	<br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="index.jsp" class="w3-padding"><i class="fa fa-backward" aria-hidden="true"></i>&nbsp;&nbsp;หน้าเริ่มต้น</a>
	<jsp:include page="common/social.jsp"></jsp:include> 
	</nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"> <i class="fa fa-bars"></i></span>
		<h2>
			<b>Mju Rescue System</b>
		</h2>

		<div class="w3-section w3-bottombar w3-padding-12">
			<a href="introduction.jsp">
				<button class="w3-btn">
					<i class="fi-social-android w2-margin-right"></i> ประวิติความเป็นมา
				</button></a> 
			<a href="aboutus.jsp">
				<button class="w3-btn w3-white">
					<i class="fa fa-slideshare w2-margin-right w3-text-teal"></i><b>ผู้พัฒนาระบบ</b>
				</button></a> 
			<a href="contactus.jsp">
				<button class="w3-btn w3-white w3-hide-small">
					<i class="fa fa-map-marker w2-margin-right"></i> ติดต่อเรา
				</button></a> 
			<a href="gallery.jsp">
				<button class="w3-btn w3-white w3-hide-small">
					<i class="fa fa-photo w2-margin-right"></i> กิจกรรม
				</button></a>
		</div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System >> บุคลากรที่มีความเกี่ยวข้องกับระบบ</h6>
			</legend>
			<br>
			<br>
			<div class="container" style="margin-left: -15px">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-lg-4">
						<div class="box">
							<div class="icon">
								<div class="image">
									<img src="img/us1.png" width="100%" height="100%">
								</div>
								<div class="info">
									<h3 class="title">Ms. Nongkran Khomwichai</h3>
									<p>
										ระดับปริญาโท หลักสูตร : วท.ม.วิศวกรรมซอฟต์แวร์ มหาวิทยาลัย :มหาวิทยาลัยเชียงใหม่<br> 
										ระดับปริญาตรี หลักสูตร : วท.บ.เทคโนโลยีสารสนเทศ มหาวิทยาลัย : มหาวิทยาลัยแม่โจ้<br>
										อาจารย์ที่ปรึกษา Project MJU Rescue System<br> 
										E-mail : Nongkran@gmail.com
									</p>
									<div class="more">
										<a href="https://www.facebook.com/nongkran.khomwichai?fref=ts" title="Title Link">Contact 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="space"></div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-lg-4">
						<div class="box">
							<div class="icon">
								<div class="image">
									<img src="img/us2.png" width="100%" height="100%"></i>
								</div>
								<div class="info">
									<h3 class="title">Mr. Kittiponng Ponglungka</h3>
									<p>
										Bachelor's degree Information Technology <br> 
										Expected In May 2017 Maejo University <br> 
										นักศึกษาชั้นปีที่ 5 รหัสนักศึกษา 5504106302 <br> 
										พัฒนาระบบและแอปพลิเคชั่น <br>
										สำหรับนักศึกษามหาวิทยาลัยแม่โจ้เวอร์ชัน 2016<br> 
										E-mail : Kittiponng@gmail.com
									</p>

									<div class="more">
										<a href="https://www.facebook.com/jammy.lovechelsea" title="Title Link">Contact
											<i class="fa fa-angle-double-right"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="space"></div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-lg-4">
						<div class="box">
							<div class="icon">
								<div class="image">
									<img src="img/us3.png" width="100%" height="100%">
								</div>
								<div class="info">
									<h3 class="title">Mr. Pranudech Ruengwijit</h3>
									<p>
										Bachelor's degree Information Technology <br> 
										Expected In May 2017 Maejo University <br> 
										นักศึกษาชั้นปีที่ 5 รหัสนักศึกษา 5504106333 <br> 
										พัฒนาระบบและแอปพลิเคชั่น<br>
										สำหรับนักศึกษามหาวิทยาลัยแม่โจ้เวอร์ชัน 2016<br> 
										E-mail : Pranudech@gmail.com
									</p>
									<div class="more">
										<a href="https://www.facebook.com/nai.tom.7" title="Title Link">Contact 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="space"></div>
						</div>
					</div>
				</div>
			</div>
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




