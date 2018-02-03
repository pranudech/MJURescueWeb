<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>USER GALLERY</title>
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
<link rel="stylesheet" type="text/css" href="css/gallery.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gallery.js"></script>
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
				<h6>Mju Rescue System >> รูปภาพกิจกรรม</h6>
			</legend>
			<br><br>
			<div class="container" style="margin-left: 35px">
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
						<img src="img/Activity1.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity2.JPG">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity5.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity6.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity7.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity8.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity9.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity10.JPG">
					</a>
				</div>
			<!-- 	<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity11.JPG">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity12.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity13.jpg">
					</a>
				</div>
				<div class="col-xs-6 col-sm-3">
					<a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
					<img src="img/Activity14.JPG">
					</a>
				</div> -->
			</div>
			<div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">×</button>
					<div class="modal-content">
						<div class="modal-body">
							<img src="" alt="" />
						</div>
					</div>
				</div>
			</div>
			<br><br>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




