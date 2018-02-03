<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>USER INTRODUCTION SYSTEM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<link rel="stylesheet" type="text/css" href="css/introduction.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/introduction.js"></script>
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
				<h6>Mju Rescue System >> ประวัติความเป็นมาของการพัฒนาระบบ</h6>
			</legend>
			
			<section>
			<div class="container" style="margin-left: -5px; margin-right: 15px">
				<div class="row">
					<div class="board">
						<div class="board-inner">
							<ul class="nav nav-tabs" id="myTab">
								<div class="liner"></div>
								<li class="active">
									<a href="#home" data-toggle="tab" title="About System"> 
										<span class="round-tabs one"> 
											<i class="fa fa-info" aria-hidden="true"></i>
										</span>
									</a>
								</li>
								<li>
									<a href="#profile" data-toggle="tab" title="ประวัตความเป็นมา"> 
										<span class="round-tabs two">
											<i class="fa fa-object-group" aria-hidden="true"></i>
										</span>
									</a>
								</li>
								<li>
									<a href="#messages" data-toggle="tab" title="วัตถุประสงค์">
										<span class="round-tabs three"> 
											<i class="fa fa-scribd" aria-hidden="true"></i>
										</span>
									</a>
								</li>
								<li>
									<a href="#settings" data-toggle="tab" title="ขอบเขต">
										<span class="round-tabs four"> 
											<i class="fa fa-expand" aria-hidden="true"></i>
										</span>
									</a>
								</li>
								<li>
									<a href="#doner" data-toggle="tab" title="รายละเอียดทั่วไป"> 
										<span class="round-tabs five"> 
											<i class="fa fa-smile-o" aria-hidden="true"></i>
										</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" style="margin-left: 3px;">
							<div class="tab-pane fade in active" id="home">
								<object type='application/x-shockwave-flash' style='width: 97%; height: 500px; margin-left: 15px' data='https://www.youtube.com/v/0f0fsGEKMLE?autoplay=1'>
									<param name='movie' value='https://www.youtube.com/v/0f0fsGEKMLE?autoplay=1' />
								</object>
								<div style='font-size: 0.8em; margin-left: 15px'></div>
								<br><br>
							</div>
							<div class="tab-pane fade" id="profile">
								<h3 class="head text-center">
									ประวัติความเป็นมา <span style="color: #f48260;">♥</span>
								</h3>
								<img alt="" src="img/Screenshot_8.png">
							<br><br>
							</div>
							<div class="tab-pane fade" id="messages">
							
								<h3 class="head text-center">
									วัตถุประสงค์ <span style="color: #f48260;">♥</span>
								</h3>
								<p class="narrow">
								<font size="3.7">
									เพื่อส่งเสริมให้เจ้าหน้าที่หน่วยกู้ภัยเทศบาลเมืองแม่โจ้และนักศึกษามหาวิทยาลัยแม่โจ้นำซอฟต์แวร์และแอปพลิเคชันไปใช้ในการอำนวยความสะดวกต่อการแจ้งเหตุและเก็บข้อมูล
									โดยมีเป้าหมายดังต่อไปนี้<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. ลดปัญหาการแจ้งข่าวเท็จ
									การโทรแจ้งเหตุไม่ติดหรือติดต่อหน่วยกู้ภัยไม่ได้ในเวลาที่เกิดอุบัติเหตุ<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.
									ลดปัญหาในการเข้าถึงสถานที่ที่เกิดเหตุของหน่วยกู้ภัยในกรณีที่ผู้แจ้งเหตุบอกสถานที่ที่ไม่ได้เจาะจง<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.
									เพื่อลดระยะเวลาในการเดินทางไปยังสถานที่ที่เกิดเหตุและสามารถช่วยผู้ประสบเหตุได้รวดเร็วมากยิ่งขึ้นกว่าเดิม<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.
									เพื่อลดอัตราการสูญเสียและอัตราการเกิดอุบัติเหตุของนักศึกษามหาวิทยาลัยแม่โจ้<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.
									เพื่อเป็นแนวทางให้กับทางมหาวิทยาลัยแม่โจ้ในการออกมาตรการแก้ไขและลดอุบัติเหตุที่เกิดจะขึ้นกับนักศึกษาและเก็บสถิติข้อมูลของอุบัติเหตุที่เกิดขึ้นกับนักศึกษา
								</font>
								</p>
								<br><br>
								<p class="narrow text-center"></p>
							</div>
							<div class="tab-pane fade" id="settings">
								
								
								<h3 class="head text-center">
									ขอบเขต <span style="color: #f48260;">♥</span>
								</h3>
								<p>
								<font size="3.7">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ระบบขอความช่วยเหลือฉุกเฉินสำหรับนักศึกษามหาวิทยาลัยแม่โจ้ MJU Rescue Application แบ่งการทำงานออกเป็น 2 ส่วนคือ 
								<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานในส่วนที่เป็นแอปพลิเคชันและการทำงานในส่วนที่เป็นเว็บไซต์ โดยถูกแบ่งผู้ใช้งานระบบออกเป็น 4 ประเภท คือ<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	ผู้ใช้งานที่เป็นนักศึกษา (Student)<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	ผู้ใช้งานที่เป็นเจ้าหน้าที่กู้ภัย (Staff) <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	ผู้ใช้งานที่เป็นผู้ดูแลระบบ (Administrator) <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	ผู้ใช้งานที่เป็นผู้บริหารหรือคณะกรรมการของมหาวิทยาลัย (Board)<br>
								</font>
								</p>
								<br><br>
							</div>
							<div class="tab-pane fade" id="doner">
								<div class="text-center">
									<i class="img-intro icon-checkmark-circle"></i>
								</div>
								<h3 class="head text-center">
									รายละเอียดทั่ว ๆ ไป ของระบบ MJU Rescue Application<span style="color: #f48260;">♥</span>
								</h3>
								<p>
								<font size="3.7">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ระบบ MJU Rescue Application ประกอบไปด้วยการทำงาน 2 ประเภทคือ<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานบนหน้าเว็บและการทำงานบนอุปกรณ์เคลื่อนที่ ซึ่งมีกระบวนการพื้นฐานในการทำงานดังต่อไปนี้<br> <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานในส่วนของ Student<br><br>
    	  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การใช้งานบนอุปกรณ์เคลื่อนที่ (Application)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถเข้าสู่ระบบเพื่อใช้งานแอปพลิเคชันได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถดูข้อมูลส่วนตัวได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	สามารถดูข้อมูลการปฐมพยาบาลเบื้องต้นได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	สามารถดูข่าวอุบัติเหตุได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	สามารถใช้งานแอปพลิเคชันเพื่อร้องขอความช่วยเหลือได้<br><br>
 								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การใช้งานฝั่งเว็บไซต์ (Web Site)<br>	
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถดูข้อมูลส่วนตัวได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถแก้ไขข้อมูลส่วนตัวในส่วนของการเพิ่มข้อมูล เบอร์โทรศัพท์ติดต่อ เบอร์โทรศัพท์สำรอง กรุ๊ปเลือด และโรคประจำตัว<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	สามารถแก้ไขรหัสผ่านได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	สามารถร้องขอรหัสผ่านกับระบบได้กรณีที่ลืมรหัสผ่าน<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานในส่วนของ Staff<br><br>
     							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การใช้งานบนอุปกรณ์เคลื่อนที่ (Application)<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถเข้าสู่ระบบเพื่อใช้งานแอปพลิเคชันได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถรับการแจ้งเตือนจากผู้ร้องขอความช่วยเหลือได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	สามารถดูรายละเอียดของผู้ประสบอุบัติในกรณีที่เกิดอุบัติเหตุได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	สามารถเพิ่มข้อมูลข่าวการเกิดอุบัติเหตุได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	สามารถดูข้อมูลข่าวอุบัติเหตุได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.	สามารถแก้ไขข่าวอุบัติเหตุได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.	สามารถลบข่าวอุบัติเหตุ ได้<br><br>


    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การใช้งานฝั่งเว็บไซต์ (Web Site)<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถเข้าสู่ระบบเพื่อใช้งานระบบได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถแก้ไขข้อมูลบางส่วนที่ยังไม่ได้ทำการบันทึกได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	สามารถดูข้อมูลและสั่งพิมพ์รายงานข้อมูลอุบัติเหตุได้<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	สามารถดูข้อมูลหรือสั่งพิมพ์รายงานสถิติการเกิดอุบัติเหตุได้<br> <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานในส่วนของ Administrator<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถเข้าสู่ระบบเพื่อใช้งานระบบได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถนำเข้าข้อมูลของนักศึกษาในปีการศึกษาใหม่<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	สามารถเปลี่ยนสถานะของนักศึกษาที่สำเร็จการศึกษาไปแล้วเป็นศิษย์เก่า<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	สามารถดูข้อมูลของนักศึกษาได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.	สามารถดูและสั่งพิมพ์สถิติการเกิดอุบัติเหตุได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.	สามารถเพิ่ม ลบ แก้ไข ข้อมูลการปฐมพยาบาลได้<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การทำงานในส่วนของ Board<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	สามารถเข้าสู่ระบบเพื่อใช้งานระบบได้<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	สามารถดูและสั่งพิมพ์ข้อมูลสรุปสถิติของการเกิดอุบัติเหตุได้<br> 
</font>
</p>
<br><br>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			</section>
		</fieldset>

<!-- Footer -->
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>

<!-- Script -->
	<jsp:include page="common/script.jsp"></jsp:include>

</body>
</html>




