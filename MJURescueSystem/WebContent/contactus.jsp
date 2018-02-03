<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>USER CONTACT US</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
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
					<i class="fa fa-slideshare w2-margin-right"></i> ผู้พัฒนาระบบ
				</button></a> 
			<a href="contactus.jsp">
				<button class="w3-btn w3-white w3-hide-small">
					<i class="fa fa-map-marker w2-margin-right w3-text-teal"></i> <b>
						ติดต่อเรา</b>
				</button></a> 
			<a href="gallery.jsp">
				<button class="w3-btn w3-white w3-hide-small">
					<i class="fa fa-photo w2-margin-right"></i> กิจกรรม
				</button>
			</a>
		</div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Mju Rescue System >> แผนที่</h6>
			</legend>

			<iframe
				src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3774.
				7463869639155!2d99.013295!3d18.898328999999997!3m2!1i1024!2i768!
				4f13.1!3m3!1m2!1s0x30da2334d4ce0385%3A0xf0346c6d9b330f0!2sMaejo+
				University!5e0!3m2!1sth!2sth!4v1404642295837"
				width="90%" height="450" style="border: 0; margin-left: 35px">
			</iframe>
			<br>
			<br> 
			<font color="#003333">
				<p style="margin-left: 53px">รายละเอียดการติดต่อ</p>
				<p style="margin-left: 53px">สาขาวิชาเทคโนโลยีสารสนเทศคณะวิทยาศาสตร์ มหาวิทยาลัยแม่โจ้ เชียงใหม่</p>
				<p style="margin-left: 53px">ตึกเสาวรัจ นิตยวรรธนะ เลขที่ 63 ม.4 ต.หนองหาร อ.สันทราย จ.เชียงใหม่ 50290</p>
				<p style="margin-left: 53px">โทรศัพท์ติดต่อ : 053-873599</p>
				<p style="margin-left: 53px">Fax : 053-873599</p>
			</font>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




