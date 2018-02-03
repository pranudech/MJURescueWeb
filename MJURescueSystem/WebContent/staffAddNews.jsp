<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.itsci.mjurescue.login.*"%>
<%@page import="java.util.*"%>
<%
	LoginBean login = (LoginBean) session.getAttribute("login");
	StaffBean staff = (StaffBean) session.getAttribute("staff");
	if(login == null || staff == null){
		staff = new StaffBean();
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ADMIN ADD NEWS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/w3school.css">
<link rel="stylesheet" type="text/css" href="css/addnews.css">
<link rel="stylesheet" type="text/css" href="css/fonts.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="responsives/image.css">
<link rel="stylesheet" type="text/css" href="responsives/fonts.css">
<script type="text/javascript" src="js/img.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
</head>

<script language="Javascript">
	function validate(addNews) {
		if (addNews.titleNews.value == "") {
			alert("กรุณาใส่ข้อมูลหัวข้อข่าวสารที่ท่านต้องการเพิ่ม");
			addNews.titleNews.focus();
			return false;
		}
		if (addNews.contentNews.value == "") {
			alert("กรุณาใส่ข้อมูลรายละเอียดของข่าวสารที่ท่านต้องการเพิ่ม");
			addNews.contentNews.focus();
			return false;
		}
		if (addNews.imgNews.value == "") {
			alert("กรุณาใส่ข้อมูลรูปภาพหรือ -");
			addNews.imgNews.focus();
			return false;
		}
	}
</script>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

<!-- Menu Bar -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3; width:300px;" id="mySidenav"><br>
	<jsp:include page="common/logo.jsp"></jsp:include> 
	<a href="staffIndexNews.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Back</a> 
	<a href="staffAddNews.jsp" class="w3-padding w3-text-teal"><i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;นำเข้าข้อมูลข่าวสาร</a>
	<a href="ListNewsServlet" class="w3-padding"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;จัดการข้อมูลข่าวสาร</a>

	<jsp:include page="common/social.jsp"></jsp:include> </nav>

	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">

<!-- Header -->
		<br>
		<header class="w3-container"> 
		<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<h2>
			<font color="#2F4F4F"><b>Add News &nbsp;&nbsp;
				<i class="fa fa-newspaper-o" aria-hidden="true"></i></b>
			</font>
		</h2>

		<a href="staffIndex.jsp"><font color="#336600">หน้าหลัก</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<a href="staffAddNews.jsp"><font color="#800000"><b>นำเข้าข้อมูลข่าวสาร</b></font></a><b>&nbsp;&nbsp;|&nbsp;&nbsp;</b> 
		<a href="ListNewsServlet"><font color="#339966">จัดการข้อมูลข่าวสาร</font></a> <b>&nbsp;&nbsp;|&nbsp;&nbsp;</b>
		<div class="w3-section w3-bottombar w3-padding-10"></div>
		</header>

<!-- Content -->
		<fieldset style="margin-left: 20px; margin-bottom: 18px">
			<legend>
				<h6>Administrator => เพิ่มข้อมูลข่าวสาร</h6>
			</legend>
			
<!-- Form -->

<img src="img/Open-Folder-Add-icon.png" style="width: 170px; height: 130px; margin-left: 700px"><br><br>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div>
               <form name="frmAddNews" action="AddNewsServlet" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                               	 หัวข้อข่าวสาร</label>
                                 <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-newspaper-o" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" id="title" name="titleNews" placeholder="ระบุหัวข้อข่าวสาร" required="required" />
                            </div>
                        </div>
                        <div class="form-group">
                        
                            <label for="email">
                              	  รูปภาพข่าวสาร</label>
                                
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                
                                <input type="text" class="form-control" id="image" name="imageNews" placeholder="ระบุไฟล์รูปภาพ" required="required" />
                                
                                </div>
                              <i class="fa fa-cloud-upload" aria-hidden="true"></i> <font color="blue"><a href="https://www.img.in.th/" target="_blank"">อัพโหลดรูปภาพ</a> </font>
                              <br>*กรณีต้องหารใส่หลายรูปให้ใส่เครื่องหมาย ## ต่อท้ายรูป เช่น รูปที่1##รูปที่2
                              <br>*หากไม่มีรูปภาพที่จะอัพโหลดกรุณาใส่เครื่องหมาย " - "  
                        </div>
                         <div class="form-group">
                            <label for="name">
                                	รหัสเจ้าหน้าที่</label>
                                 <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" id="title" name="staffID" placeholder="Enter ID Staff" required="required" />
                            </div>
                        </div>
                       
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                เนื้อหาข่าวสาร</label>
                            <textarea name="contentNews" id="detail" class="form-control" rows="11" cols="25" required="required" maxlength="255"
                                placeholder="ระบุเนื้อหาข่าวสาร"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-success pull-right" id="btnContactUs">
                          <i class="fa fa-plus-circle" aria-hidden="true"></i> เพิ่มข้อมูลข่าวสาร</button>
                    </div>
                 
                </div>
                   <br>
                </form>
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
<script>
	$(document).ready(
	function() {
		var iCnt = 0;
		// CREATE A "DIV" ELEMENT AND DESIGN IT USING jQuery ".css()" CLASS.
		var container = $(document.createElement('div')).css({
		padding : '10px',
		margin : '20px',
		width : '400px',
		border : '1px dashed',
		borderTopColor : '#999',
		borderBottomColor : '#999',
		borderLeftColor : '#999',
		borderRightColor : '#999'
	});

	$('#btAdd').click(
	function() {
		if (iCnt <= 19) {
			iCnt = iCnt + 1;
			// ADD TEXTBOX.
			$(container).append(
			'<input type=text class="form-control" id=tb' + iCnt + ' ' + 'value="Image ' + iCnt + '" />');
			// SHOW SUBMIT BUTTON IF ATLEAST "1" ELEMENT HAS BEEN CREATED.
		if (iCnt == 1) {
			var divSubmit = $(document.createElement('div'));
			$(divSubmit).append(
			'<input type=button class="btn btn-labeled btn-default"'+ 'onclick="GetTextValue()"'+ 'id=btSubmit value=&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit />');
		}

		// ADD BOTH THE DIV ELEMENTS TO THE "main" CONTAINER.
		$('#main').after(container,divSubmit);
		}
		// AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON.
		// (20 IS THE LIMIT WE HAVE SET)
		else {
			$(container).append(
			'<label>Reached the limit</label>');
			$('#btAdd').attr('class','bt-disable');
			$('#btAdd').attr('disabled','disabled');
		}
	});

	// REMOVE ONE ELEMENT PER CLICK.
	$('#btRemove').click(
	function() {
		if (iCnt != 0) {
			$('#tb' + iCnt).remove();
			iCnt = iCnt - 1;
		}
		if (iCnt == 0) {
			$(container).empty().remove();
			$('#btSubmit').remove();
			$('#btAdd').removeAttr('disabled').attr('class', 'btn btn-labeled btn-default');
		}
	});

	// REMOVE ALL THE ELEMENTS IN THE CONTAINER.
	$('#btRemoveAll').click(
	function() {
		$(container).empty().remove();
		$('#btSubmit').remove();
		iCnt = 0;
		$('#btAdd').removeAttr('disabled').attr('class', 'btn btn-labeled btn-default');
	});
});

	// PICK THE VALUES FROM EACH TEXTBOX WHEN "SUBMIT" BUTTON IS CLICKED.
	var divValue, values = '';
	function GetTextValue() {
		$(divValue).empty().remove();
		values = '';
		$('.input').each(function() {
			divValue = $(document.createElement('div')).css({
				padding : '5px',
				width : '200px'
			});
			values += this.value + '<br />'
		});
		$(divValue).append('<p><b>Your selected values</b></p>' + values);
		$('body').append(divValue);
	}
</script>
</html>




