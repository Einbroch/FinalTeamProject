<%@ page language="java" contentType="text/html; 
	charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/project/resources/css/main.css" rel="stylesheet">
<link href="/project/resources/css/bbsbook.css" rel="stylesheet">
<link href="/project/resources/css/farbtastic.css" rel="stylesheet">
<link href="/project/resources/css/Qqu.css" rel="stylesheet">
<link href="/project/resources/css/Qqu.min.css" rel="stylesheet">
<style type="text/css">
@media all and (max-width:450px) {
	
}

.glyphicon {
	font-size: 15px;
}

.bookingbtn {
	width: 25%;
	height:25px;
	border: 0px;
	background-color: white;
}

</style>
</head>
<body>

	<!-- 헤더 이미지 영역 -->
	<header class="masthead">
	<div class="header-content" align="center">
		<div class="header-content-inner">
			<div class="header-content-img">
				<div style="margin: auto; margin-top: 75px;">
					<img src="/project/resources/img/title-white.png"
						style="width: 175px; height: 85px;">
					<div class="header-content-btn">
						<button class="loginbtn" data-toggle="modal"
						data-target="#myinfoModal" data-backdrop="static" id="modal_myinfo">내 정보</button>
						&#166;
						<button class="bookcasebtn" id="modal_login" data-toggle="modal" 
						data-target="#loginModal" data-backdrop="static">로그인</button>
						<button class="bookcasebtn" data-toggle="modal"
						data-target="#logoutModal" id="modal_logout">로그아웃</button>
						&#166;
						<button class="bookcasebtn" data-toggle="modal"
						data-target="#bookcaseModal" data-backdrop="static" id="btn-mybookcase">내 책장</button>
					</div>
					<div class="" style="width: 96%; height: 240px; margin:auto;">
						<div style="background-image: url('/project/resources/img/headeri.jpg'); background-size:contain; width: 100%; height: 100%; background-repeat: no-repeat;"></div>
					</div>
				</div>
			</div>

			<div class="col-lg-8 mx-auto text-center"
				style="width: 100%; text-align: center">
				<h2 class="section-heading text-white"
					style="color: rgba(255, 255, 255, 1); font-weight:bold;">즐거웠던 추억을 아름답게.</h2>
				<hr class="light">
				
				<a id = "doolerzz" class="BBSScrollbtn" style="text-decoration: none;">둘러보기</a>
							
				<p class="text-faded" style="margin-top: 30px;">
				둘이서 함께 나누었던 기억.. 사랑하는 이와 <br>
				같은 시간대에 같은 공간에서 같은 추억을 공유해도 <br>
				사람마다 기억의 유효기간은 다릅니다. <br>
				그 추억을 제주일기에서 공유하세요! 롸잇나우!! 씨벌!!
				</p>
			</div>
		</div>
	</div>
	</header>

	<!-- 콘텐츠 설명-->
	<section id="services">
	<div class="container">
		<div class="row" align="center">
			<div style="background-image: url('/project/resources/img/content1.png'); background-repeat: no-repeat; width: 150px; height: 70px; margin-bottom: 28px;"></div>
			<div class="col-lg-12 text-center">
				<h2 class="section-heading"></h2>
				<!-- <hr class="primary"> -->
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 text-center">
				<div class="service-box">
					<img src="/project/resources/img/icon1.png" style="width: 65px; height: 80px;">
					<h3>여행을 계획하고</h3>
					<p class="text-muted">We are planning a trip</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 text-center">
				<div class="service-box">
					<img src="/project/resources/img/icon2.png" style="width: 65px; height: 80px;">
					<h3>여행 후기를 책으로!</h3>
					<p class="text-muted">We make a book for the trip</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 text-center">
				<div class="service-box">
					<img src="/project/resources/img/addbook.png" style="width: 65px; height: 80px;">
					<h3>여행 정보 공유하기</h3>
					<p class="text-muted">We share our information for the trip </p>
				</div>
			</div>
		</div>
	</div>
	</section>


	<!-- 게시판 -->
	<section class="BBS">

	<div class="container-fluid" align="center" style="width: 100%; height: auto; background-color: rgba(135,206,250,0.4); padding-left:7.5%; padding-right: 7.5% ">

		<!-- 글자 영역 -->
		<div id="BBS" style="margin:auto; margin-top: 120px; width: 29%; height: 430px; background-image: url('/project/resources/img/sea3.jpg'); background-repeat: no-repeat; background-position: center;">
			<div class="BBS-content-head1">
				<h3 class="font1">하나의 바다.</h3>
			</div>
			<div class="BBS-content-head2">
				<p class="font2">바다를 바라보는 사람이 천명이라면<br>그 바다는 천개의 바다라고 합니다.<br>사람들의 다양한 이야기를 찾아보세요.</p>
			</div>
			<div>
				<div style="margin-top: 85px;">
					<input class="search-input" type="search" placeholder="찾아보기" style="width: 40%; height: 29px; margin-bottom: 30px; text-align: center;">		
				</div>
				<div>
					<button class="searchbtn"></button>
				</div>
			</div>
		</div>
		<div style="border: 1px solid white; width: 10%; margin-top: 70px; margin-bottom: 50px;">
		</div>

		<!-- 게시판 내용물 영역 -->
		<div class="BBS-content-books">
			<div class="BBSBook">
				<ul class="Books" id="bbslist">
					
				</ul>
			</div>
		</div>
	</div>
	</section>

	<!-- 페이징 버튼 영역 -->
	<div class="pageingspace" style="display: block;">
		<div style="padding-top: 70px;" align="center">
			<div style="padding-right: 40px;">
				<ul class="pageclass" id="bbslistpage">
				
				</ul>
			</div>
		</div>
	</div>


	<!-- 로고 -->
	<section id="contact">
	<div class="container-footer" style="text-align: center;">
		<div align="center">
			<img class="logoimg" src="/project/resources/img/Qqu.png">
		</div>
		<p>copyright(C) all reserved by Qqu</p>
	</div>
	</section>
	
	<!-- 슬롯 커버 모달 -->
	<div class="modal fade modalposition" id="slotModal" role="dialog" align="center" data-backdrop="static">
		<div class="modal-dialog modal-coversize" role="document">
			<div class="modal-content modal-coversize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>
						<font color="black"><span class="glyphicon glyphicon-book"></span></font>
					</h3>
				</div>
				<form class="w3-container" method="post" id="modal_slot_form" enctype="multipart/form-data"></form>
				<form class="w3-container" method="post" id="modal_slot_color_form" style="width: 500px; margin-top:50px;">				
	  				<div style="padding-top: 0%" id="preview" class=""></div>
	  				<div id="picker" style="float: left; margin-top:20px;"></div>
	  				<div style="padding:6%; width: 100%; height: 60px;" class="form-item">
	  				<label for="color1">배경색 :</label><input type="text" id="color1" name="color1" class="colorwell" value="#ffffff" autofocus="autofocus" readonly="readonly" />
	  				<button type="button" id="bg_btn" class="button3">Apply</button></div>
	  				<div style="padding:6%; width: 100%; height: 60px;"
	  				 class="form-item"><label for="color2">글자색 :</label><input type="text" id="color2" name="color2" class="colorwell" value="#000000" readonly="readonly" />
	  				<button type="button" id="ft_btn" class="button3">Apply</button></div>
	  				<div id="coversavebtn" style="margin-top:20px;"></div>
	  			</form>
			</div>
		</div>
	</div>
	
	<!-- 슬롯 리뷰 모달 -->
	<div class="modal fade" id="slotReviewmodal" role="dialog" data-backdrop="static">
      <div class="modal-dialog" role="document" style="overflow-y: scroll; width:90%; max-height:90%;">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h3 class="modal-title" align="center">
                  <font color="black"> <span class="glyphicon glyphicon-picture"></span>
                  </font>
                  </h3>
            </div>
            
            <form class="w3-container basic-line" style="width: 100%;" method="post" id="modal_review_form">
               
            </form>
            <br>
         </div>
      </div>
   </div>
	
	
	<!-- 슬롯 차례 모달 -->
	<div class="modal fade" id="slotIndexModal" role="dialog" align="center" data-backdrop="static">
		<div class="modal-dialog" role="document" style="overflow-y: scroll; width:90%; max-height:90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 id="slot_title" align="center">
					<font color="black"><span class="glyphicon glyphicon-list"></span>
                  	</font>
					</h3>
				</div>
				<div class="modal-body basic-line">
					<form class="w3-container basic-line" style="width: 100%;" method="post" id="modal_slot_index_form">
							
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 내 책장 모달 -->
	<div class="modal fade modalposition" id="bookcaseModal" role="dialog" >
		<div class="modal-dialog modal-70size" role="document">
			<div class="modal-content modal-70size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" align="center">
						<font color="black"> <span class="glyphicon glyphicon-book"></span></font>
					</h3>
				</div>
				<form method="post">
					<div class="book-container" id="modal_bookcase_form" align="center">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 로그인 모달 -->
	<div class="modal fade modalposition"
		tabindex="-1" id="loginModal" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" align="center">
						<span class="glyphicon glyphicon-user"></span>
					</h3>
				</div>
				<div class="modal-body" align="center">
					<form method="post" id="modal_login_form"></form>
				</div>
				<div class="modal-footer" align="right">
					<button class="button-mainlogin" type="button" id="user_login" >Login</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 정보수정 모달 -->
	<div class="modal fade modalposition" id="myinfoModal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" align="center">
						<font color="black"> <span class="glyphicon glyphicon-user"></span></font>
					</h3>	
				</div>
				<div class="modal-body" align="center">
						<form class="w3-container" method="post" id="modal_myinfo_form"></form>
						<button class="button2-info" type="button" id="user_info" class="btn btn-primary">수정하기</button>
						<button class="button2-info" type="button" id="user_update" class="btn btn-primary">수정완료</button>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- <script src="/project/resources/js/jquery.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/farbtastic.js"></script>
	<script src="/project/resources/js/jquery.easing.min.js"></script>
				
	<!-- 클러스터 -->
	<script
      src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    
	<!-- 위도경도를 입력해서 지도에 뿌려주는 구글맵 api 키값 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDs-T1EEykIfdXaJaB5ML6HYsddRZ5BD4U"></script>
	<script type="text/javascript">	
		var view;
		var accomList;
		var rentList;
		var leisureList;
		var contentList;
		var callbbs = null;
		var bbsListPage = null;
		$(function() {
			/* 둘러보기 scroll event */
			$("#doolerzz").click(function(){
				$('html, body').animate({
					scrollTop : $("#BBS").offset().top
				}, 1250, 'easeInOutExpo');
			});
			
			var session = null;
			var modify;
			$("#modal_login").hide();
			$("#modal_logout").hide();
			$("#modal_myinfo").hide();
			$("#btn-mybookcase").hide();
			$("#modal_slot_color_form").hide();
			ajaxSession();
			
			$("#doolerpreview").click(function(){
				
				$('html, body').animate({
					scrollTop : $("#BBS").offset().top
				}, 1250, 'easeInOutExpo');	
			})
			
			
			/* ajax통해서 로그인한 아이디의 사용자 정보를 가져옴 */
			function ajaxSession() {
				var getData = {
					user_userId : 0
				}
				$.ajax({
					url : "/project/session/getSession",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(getData),
					dataType : "json",
					success : function(data) {
						$("#modal_logout").show();
						$("#modal_myinfo").show();
						$("#btn-mybookcase").show();
						session = data;
					},
					error : function(data) {
						$("#modal_login").show();
					}
				});
			}
	
			/* Login 버튼을 누를경우 modal_login_form에 id input, pw input생성 */
			$("#modal_login").click(function() {
				$("#modal_login_form").empty();
				$("#modal_login_form").append(
					'<input class="w3-input" type="text" id="login_user_userid" name="login_user_userid" placeholder="Id">' +
					'<input class="w3-input" type="password" id="login_user_password" name="login_user_password" placeholder="Password">'
				);
			});
			/* id와 pw 입력 후 Login 버튼을 누를 경우 */
			$("#user_login").click(function() {
				var loginData = {
					user_userId : $("#login_user_userid").val(),
					user_password : $("#login_user_password").val()
				};
				/* console.log(loginData); */
				ajaxLogin(loginData);
			});
			/* ajax 통한 로그인 */
			function ajaxLogin(getData) {
				$.ajax({
					url : "/project/login/userLogin",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(getData),
					dataType : "json",
					success : function(data) {
						$("#modal_login").hide();
						$("#modal_logout").show();
						$("#modal_myinfo").show();
						$("#btn-mybookcase").show();
						/* alert("로그인 하셨습니다."); */
						$("#loginModal").modal('hide');
						ajaxSession();
					},
					error : function(data) {
						alert("로그인 실패!");
						
					}
				});
			}
	
			/*	로그아웃 액션 */
			$("#modal_logout").click(function() {
				ajaxLogout();
			});
			/* ajax를 통한 로그아웃 */
			function ajaxLogout() {
				var getData = {
					user_userId : 0
				}
	
				$.ajax({
					url : "/project/login/userLogout",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(getData),
					dataType : "json",
					success : function(data) {
						$("#modal_logout").hide();
						$("#modal_login").show();
						$("#modal_myinfo").hide();
						$("#btn-mybookcase").hide();
						/* alert("로그아웃 되었습니다"); */
						session = null;
					},
					error : function(data) {}
				});
			}
	
			/* 내 정보 보기 */
			$("#modal_myinfo").click(function(){
				$("#user_update").hide();
				$("#user_info").show();
				$("#modal_myinfo_form").empty();
				$("#modal_myinfo_form").append(
					'<p><input class="w3-input" type="text" id="user_userId" name="user_userId" value="'+session.user_userId+'" readonly></p>' +
					'<p><input class="w3-input" type="text" id="user_name" name="user_name" value="'+session.user_name+'" readonly></p>' +
					'<p><input class="w3-input" type="tel" id="user_phonenumber" name="user_phonenumber" value="'+session.user_phoneNumber+'" readonly></p>' +
					'<p><input class="w3-input" type="email" id="user_email" name="user_email" value="'+session.user_email+'" readonly></p><br>'
				);
			});
			$("#close").click(function(){
				$("#myinfoModal").modal("hide");
			});
			/* 유저 정보를 보여줌 */
			$("#user_info").click(function(){
				$("#user_update").show();
				$("#user_info").hide();
				$("#modal_myinfo_form").empty();
				$("#modal_myinfo_form").append(
					'<p><input class="w3-input" type="password" id="user_password" name="user_password" placeholder="password"></p>' +
					'<p id="check_user_password"></p>' +
					'<p><input class="w3-input" type="text" id="user_name" name="user_name" placeholder="name" value="'+session.user_name+'"></p>' +
					'<p id="check_user_name"></p>' +
					'<p><input class="w3-input" type="tel" id="user_phonenumber" name="user_phonenumber" placeholder="phone number" value="'+session.user_phoneNumber+'"></p>' +
					'<p id="check_user_phonenumber"></p>' +
					'<p><input class="w3-input" type="email" id="user_email" name="user_email" placeholder="e-mail" value="'+session.user_email+'"></p>' +
					'<p id="check_user_email"></p><br>'
				);
			});
			/* 유저 정보를 수정함 */
			$("#user_update").click(function(){
				if(inputCheck(getModifyData())){
					ajaxUpdateUser(getModifyData())
				} else {
					alert("수정실패");
				}
			});
			
			function ajaxUpdateUser(getData){
				$.ajax({
					url : "/project/regist/modifyUser",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(getData),
					dataType : "json",
					success : function(data) {
						alert("정보수정 완료");
						$("#myinfoModal").modal('hide');
						ajaxLogout();
					},
					error : function(data) {
						alert("정보수정 실패");
					}
				});
			}
			
			function getModifyData(){
				modify = {
						user_id : session.user_id,
						user_password : $("#user_password").val(),
						user_name : $("#user_name").val(),
						user_phoneNumber : $("#user_phonenumber").val(),
						user_email : $("#user_email").val()	
				};
				/* console.log(modify); */
				return modify;
			}
			/* 회원가입 및 유저정보 수정에 필요한 function */
			function inputCheck(getData) {
				$("#check_user_password").text("");
				$("#check_user_name").text("");
				$("#check_user_phonenumber").text("");
				$("#check_user_email").text("");
				var boolean = true;
				
				if (!length(getData.user_password, 6, 20)) {
					$("#check_user_password").text("패스워드값 6~20");
					$("#check_user_password").css("color", "red");
					boolean = false;
				}
				if (!length(getData.user_name, 2, 6) ||
					!specialLetters(getData.user_name)) {
					$("#check_user_name").text("실제 이름 입력");
					$("#check_user_name").css("color", "red");
					boolean = false;
				}
				if (!numberCheck(getData.user_phoneNumber)) {
					$("#check_user_phonenumber").text("전화번호 형식이 옳지 않습니다.");
					$("#check_user_phonenumber").css("color", "red");
					boolean = false;
				}
				if (!emailCheck(getData.user_email)) {
					$("#check_user_email").text("E-mail 형식이 옳지 않습니다.");
					$("#check_user_email").css("color", "red");
					boolean = false;
				}
				return boolean;
			}
			
			/* 회원가입 및 유저정보 수정에 필요한 function */
			/* 전화번호 형식이 맞는지 체크 */
			function numberCheck(getData) {
				var check;
				var boolean = true;
				var i;

				for (i = 0; i < getData.length; i++) {
					check = getData.charAt(i).charCodeAt();
					if (check == 45 || (check >= 48 && check <= 57)) {

					} else {
						boolean = false;
					}
				}
				if (length(getData, 11, 13)) {
					if (getData.charAt(2) == '-' && getData.charAt(6) == '-') {
						if (getData.length != 11) {
							boolean = false;
						}
					} else if (getData.charAt(3) == '-' && getData.charAt(8) == '-') {
						if (getData.length != 13) {
							boolean = false;
						}
					} else {
						boolean = false;
					}
				} else {
					boolean = false;
				}
				return boolean;

			}

			/* 회원가입 및 유저정보 수정에 필요한 function */
			/* 이메일 형식이 맞는지 체크 */
			function emailCheck(getData) {
				var check;
				var boolean = false;
				var i;
				if (length(getData, 15, 25)) {
					for (i = 0; i < getData.length; i++) {
						check = getData.charAt(i).charCodeAt();
						if (check == 64) {
							boolean = true;
						}
					}
				}
				return boolean;
			}

			/* 회원가입 및 유저정보 수정에 필요한 function */
			/* 입력의 길이에 따라 true, false를 리턴함 */
			function length(data, min, max) {
				if (data.length < min || data.length > max) {
					return false;
				} else {
					return true;
				}
			}

			/* 회원가입 및 유저정보 수정에 필요한 function */
			/* 특수문자 사용여부에 따라 true, false를 리턴함 */
			function specialLetters(getData) {
				var check;
				var boolean = true;
				var i;
				for (i = 0; i < getData.length; i++) {
					check = getData.charAt(i).charCodeAt();
					if ((check >= 32 && check <= 47) ||
						(check >= 58 && check <= 64) ||
						(check >= 91 && check <= 96) ||
						(check >= 123 && check <= 126)) {
						boolean = false;
					}
				}
				return boolean;
			}
			
			/* 내 책장  버튼을 누를경우  */
			$("#btn-mybookcase").click(function() {
				/* slot List를 가지고옴 */
				getSlot(session.user_id, session.user_userId);
								
			});
			
			/* 적용하기 버튼을 누를경우 컬러값을 바꿈 */
			$("#ft_btn").click(function(){
				$("#title").css("color", $("#color2").val());
				$("#author").css("color", $("#color2").val());
			});
			
			/* 적용하기 버튼을 누를경우 컬러값을 바꿈 */
			$("#bg_btn").click(function(){
				$("#cover").css("background-color", $("#color1").val());	
			});
			
			/* 숙소 리스트를 불러오고 성공할 경우 map을 뿌려줌 */
			accomList = function ajaxGetAccom(accom, btnId){
				$.ajax({
					url : "/project/owner/getListAccom",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(accom),
					dataType : "json",
					success : function(data) {
						view(data, 33.3627, 126.529, "https://github.com/woo289/memory/blob/master/hotel.png?raw=true", btnId);
						contentList(data, "https://github.com/woo289/memory/blob/master/hotel.png?raw=true", btnId);
					},
					error : function(data) {				
					}
				});
			}
			
			/* 렌트 리스트를 불러오고 성공할 경우 map을 뿌려줌 */
			rentList = function ajaxGetRent(rent, btnId){
				$.ajax({
					url : "/project/owner/getListRent",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(rent),
					dataType : "json",
					success : function(data) {
						view(data, 33.3627, 126.529, "https://github.com/woo289/memory/blob/master/car.png?raw=true", btnId);
						contentList(data, "https://github.com/woo289/memory/blob/master/car.png?raw=true", btnId);
					},
					error : function(data) {
						
					}
				});
			}
			
			/* 레져 리스트를 불러오고 성공할 경우 map을 뿌려줌 */
			leisureList = function ajaxGetLeisure(leisure, btnId){
				$.ajax({
					url : "/project/owner/getListLeisure",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(leisure),
					dataType : "json",
					success : function(data) {
						view(data, 33.3627, 126.529, "https://github.com/woo289/memory/blob/master/ha.png?raw=true", btnId);
						contentList(data, "https://github.com/woo289/memory/blob/master/ha.png?raw=true", btnId);
					},
					error : function(data) {					
					}
				});
			}
			
			/* ctrl+f용 view맵*/
			/* map을 display함 */
			view = function viewMap(value, lat, lng, icon, btnId){
				function initmap(data) {
					//좌표 이미지를 표시하는 MarkerImage
					//마커 이미지는 경로 이미지 지정으로 쓰면 못찾음. 인터넷 페이지로 등록된 이미지만 사용가능.	
					//위도 경도 표시 (처음 화면 좌표 지정)
					var wplatlng = new google.maps.LatLng(lat, lng);
					var wpOptions = {
						zoom : 9, // 지도 zoom단계
						center : wplatlng, //지도에서 가운데로 위치할 위도와 경도(변수) 
						mapTypeId : google.maps.MapTypeId.ROADMAP
					};
					var vo;
					var map = new google.maps.Map(document.getElementById('map'), wpOptions);
					var accomIcon = new google.maps.MarkerImage(icon,
		                     new google.maps.Size(60, 60),
		                     new google.maps.Point(0, 0),
		                     new google.maps.Point(6, 20),
		                     new google.maps.Size(50, 40));
					var markers=[];
					if(data.icon == 'ssibul'){
						var marker = new google.maps.Marker({
							position : new google.maps.LatLng(lat, lng),
							map : map 
						});
						var desc = "";
						desc += '<div id="content">';
						desc += '<h2>'+data.name+'</h2>';
						desc += '<img width="200px" height="200px" src="/upload/'+data.image+'">';
						desc += '<h4>'+data.desc+'</h4>';
						desc += '<h4>'+data.number+'</h4>';
						desc += '<h4>'+data.addr+'</h4>';
						desc += '</div>';
						var infowindow = new google.maps.InfoWindow({
							content : desc
						});
						infowindow.open(marker.get("map"), marker);
						
					} else {
						$.each(data, function(i, d){
							var desc = "";
							desc += '<div id="content" class="descmap">';
							desc += '<h1 style="margin-bottom : 3%;">'+d["name"]+'</h1>';
							desc += '<img width="150px" height="auto" src="/upload/'+d["image"]+'">';
							desc += '<h5 style="margin-top : 5%;">'+d["desc"]+'</h5>';
							desc += '<h5>'+d["number"]+'</h5>';
							desc += '<h5>'+d["addr"]+'</h5>';
							/* if(btnId!=null){ */
								desc += '<button type="button" onClick="add(\''+d["name"]+'\',\''
								+d["desc"]+'\',\''+d["number"]+'\',\''+d["addr"]+'\',\''+d["lat"]+'\',\''+d["lng"]+'\',\''+d["image"]+'\',\''+icon+'\',\''+btnId+'\',\''+false+'\')">추가</button>';	
							/* } */							
							desc += '</div>';
							
							var marker = new google.maps.Marker({
								position : new google.maps.LatLng(d["lat"], d["lng"]),
								icon : accomIcon,
								map : map,
								title : d["name"]
							});
							
							/* markers.push(marker); */
							google.maps.event.addListener(marker, "click", function(){
								var infowindow = new google.maps.InfoWindow({
									content : desc
								});
								infowindow.close();
								infowindow.open(marker.get("map"), marker);
							});
							
							if(d["lat"] == lat && d["lng"] == lng){
								var infowindow = new google.maps.InfoWindow({
									content : desc
								});
								infowindow.open(marker.get("map"), marker);
							}
							
						});
					}
					/* var markerCluster = new MarkerClusterer(map,markers,{
		                  imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
		            }); */
				}
				var initmap = initmap(value);
				setTimeout(function() {
					google.maps.event.addDomListener(window, 'load', initmap);
				}, 3000);
			}
			
			bbsListPage = function listBBSPage(data, block){				
				$("#bbslistpage").empty();
				var count = 0;
				var label = '';
				label += '<div class= "pagination" style="text-align:center">';
				if(block != 0){
					label += '<a onClick="bbsListPage('+data+','+(block-1)+')">&laquo;</a>'; //넘어가짐	
				} else {
					/* label += '<a href="#">안넘어가져</a>'; //disable */
				}
				
				for (var i = 0; i<data; i++){
					$("#bbsbook"+i).hide();
					if(i%10==0){
						label += '<a onClick="bbsListPage('+data+','+count+')">'+(++count)+'</a>';
					}
				}
				for(var i = (block*10); i<((block*10)+10); i++){
					$("#bbsbook"+i).show();
				}
				
				if(block != (count-1)){
					label += '<a onClick="bbsListPage('+data+','+(block+1)+')">&raquo;</a>';//넘어가짐	
				} else {
					
				}
				
				
				label += '</div>';
				
				$("#bbslistpage").append(label);
				
			}
			
			/* bbs */
			callbbs = function ajaxBBS(block) {
				var url = "/project/bbs/data/" + block;
				$.ajax({
					url : url,
					type : "post",
					dataType : "json",
					success : function(data){
						var returndata = returnlength(data);
						listBBS(data);
						bbsListPage(returndata, block);
					},
					complete : function(data){
						
					}
				});
			}
			
			function returnlength(data){
				return data.length;
			}
			
			callbbs(0);
			
			/* list뿌리기 */
			function listBBS(data){
				var label = "";
				var count = 0;
				$.each(data, function(i, d){
					console.log(d["sp_backgroundColor"]);
					label += '<li class="col Book" id="bbsbook'+i+'">';
					if(d["sp_backgroundColor"] != null && d["sp_backgroundColor"] != "null" && d["sp_backgroundColor"] != ""){
						label += '<div style="width: 130px; height: 180px; background-color:'+d["sp_backgroundColor"]+';">';
					} else {
						label += '<div style="width: 130px; height: 180px; background-color:white;">';
					}
					
					/* 제목 */
					label += '<div>';
					
					if(d["sp_title"]!= null && d["sp_title"]!="" && d["sp_title"]!= "null"){
						if(d["sp_title"].length>10){
							label += '<p class = "BBS-book-title">'+d["sp_title"].substring(0, 8)+'..'+'</p>';
						} else {
							label += '<p class = "BBS-book-title">'+d["sp_title"]+'</p>';	
						}	
					} else {
						label += '<p class = "BBS-book-title">제목</p>';
					}
					
					
					label += '</div>';
					/* 글쓴이 */
					label += '<div>';
					if(d["sp_author"]!= null && d["sp_author"]!="" && d["sp_author"]!= "null"){
						if(d["sp_author"].length>10){
							label += '<p class = "BBS-book-writer">'+d["sp_author"].substring(0, 8)+'..'+'</p>';
						} else {
							label += '<p class = "BBS-book-writer">'+d["sp_author"]+'</p>';	
						}	
					} else {
						label += '<p class = "BBS-book-writer">글쓴이</p>';
					}
					
					label += '</div>';
					/* 이미지 123123123 */
					label += '<div class = "BBS-book-img">';
					if(d["sp_author"]!= null && d["sp_author"]!="" && d["sp_author"]!= "null"){
						label += '<img style="width:100%; height:100%;"  src="/upload/'+d["sp_image"]+'">';	
					} else {
						label += '<img style="width:100%; height:100%;" src="/project/resources/img/cover1.jpg">';
					}
					label += '</div>';
					
					label += '</div>';
					label += '</li>';
				});
				$("#bbslist").append(label);
			}
			
			
		});
		
		
		function getSlot(id, userId){
			var getData = {user_id:id};
			$.ajax({
				url : "/project/user/getSlot",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(getData),
				dataType : "json",
				success : function(data) {
					slotDisplay(data, id, userId);
				},
				error : function(data) {
					alert("불러오기 실패");
				}
			});
		}
		
		function slotDisplay(data, id, userId){
			var slot = null;
			console.log(data);
			$("#modal_bookcase_form").empty();
			
			
			$.each(data, function(i, d){	
				var label = "";
				label += '<div class="book-container-block">';
				label += '<div class="book-container-bbs" style="background-color:'+d["sp_backgroundColor"]+';"><br>';
				label += '<div style="color:'+d["sp_fontColor"]+'; margin-top: 30px;">';
				if(d["sp_title"] == null || d["sp_title"] == ""  || d["sp_title"] == "null") {
					label += '<h4>제목</h4>';
				} else {
					if(d["sp_title"].length>10){
						var title = d["sp_title"].substring(0, 8);
						title += '..';
						label += '<h4>'+title+'</h4>';
					} else {
						label += '<h4>'+d["sp_title"]+'</h4>';	
					}
					
				} 
				if(d["sp_author"] == null || d["sp_author"] =="" || d["sp_author"] =="null") {
					label += '<h6>글쓴이</h6></div>';
				} else {
					if(d["sp_author"].length>10){
						var author = d["sp_author"].substring(0, 10);
						author += '..';
						label += '<h6>'+author+'</h6></div>';	
					} else {
						label += '<h6>'+d["sp_author"]+'</h6></div>';	
					}
				}
				label += '<div class="book-container-bbs-img">';
				
				if(d["sp_image"] != null && d["sp_image"] != "null" && d["sp_image"]!="") {
					label +=  '<img src="/upload/'+d["sp_image"]+'" style="width:100%; height:100%;"></div></div><br>';
				} else {
					label +=  '<img src="/project/resources/img/cover1.jpg" style="width:100%; height:100%;"></div></div><br>';
				}
				label += '<div>';
				label += '<button type="button" class="button2-info slotbtnsize"';
				label += 'onclick="addImageSlot(\''+id+'\',\''+d["sp_id"]+'\',\''+d["sp_fontColor"]+'\',\''+d["sp_backgroundColor"]+'\',\''+d["sp_title"]+'\',\''+d["sp_author"]+'\')">';
				label += '책커버 만들기</button><br>';
				label += '<button type="button" class="button2-info"';
				label += 'onclick="ajaxgetListPlan(\''+d["sp_id"]+'\', \''+"plan"+'\')">';
				label += '차례 만들기</button>';
				label += '<button type="button" class="button2-info"';
				label += 'onclick="ajaxgetListPlan(\''+d["sp_id"]+'\', \''+"review"+'\')">';
				label += '책내용 만들기</button>';
				label += '</div></div>';
								
				$("#modal_bookcase_form").append(label);
			});
			
		}
		
		function addImageSlot(id, slotId, fontColor, backgroundColor, title, author){
			if(fontColor == null || fontColor == "null"){
				$("#color1").val("#ffffff");
				$("#color1").css("background-color", "#ffffff");
				$("#color2").val("#000000");
				$("#color2").css("background-color", "#000000");
			} else {
				$("#color1").val(backgroundColor);
				$("#color1").css("background-color", backgroundColor);
				$("#color2").val(fontColor);
				$("#color2").css("background-color", fontColor);	
			}
			
			
			$("#bookcaseModal").modal('hide');
			$("#modal_slot_color_form").hide();
			setTimeout(function() {
				$("#slotModal").modal('show');	
			}, 500);
			$("#modal_slot_form").empty();
			$("#modal_slot_form").append(
				'<div class="coverbody">'+
				 /* 헤더 */
					'<div class="coverbody-head" align="center">'+
						'<p>표지에 넣을 사진을 넣어주세요</p>'+
					'</div>'+
				 /* 그림 */
					'<div class="coverbody-body" algin="center">'+
                  		'<div class="coverbody-body-img">'+
                     		'<img src="/project/resources/img/cover-fileupload.png">'+
							'<input type="hidden" name="slotId" value="'+slotId+'"/>'+
							'<input type="hidden" name="userId" value="'+id+'"/>'+
							'<input type="hidden" name="fontColor" value="'+fontColor+'"/>'+
							'<input type="hidden" name="backgroundColor" value="'+backgroundColor+'"/>'+
							'<input type="hidden" name="author" value="'+author+'"/>'+
							'<input type="hidden" name="title" value="'+title+'"/>'+
						'</div>'+
						'<div class="coverbody-body-img-btnbody" align="center">'+
							'<button type="button" class="input-upload-btn">이미지 선택</button>'+
							'<input class="input-upload" type="file" id="fileUp" name="fileUp"/>'+
						'</div>'+
					'</div>'+
					'<div class="coverbody-foot" align="center">'+
						'<input class="coverbody-body-img-btn" type="button" value="다음" onClick="uploadSlot(\''+id+'\',\''+slotId+'\');">'+
						/* '<input class="coverbody-body-img-btn" type="button" value="커버편집하기" onClick="getSlotData(\''+slotId+'\');">'+ */
					'</div>'+
				'</div>'
			);
		}
		
		
		function uploadSlot(id, slotId){
			var formData = new FormData($("#modal_slot_form")[0]);
			$.ajax({
			 	type:'post',
			 	url :'/project/user/addSlot',
			 	data : formData,
			 	processData : false,
		        contentType : false,
				success : function(data){
					alert("커버 편집으로 넘어갑니다.");
					getSlotData(slotId);
				},
				error:function(data){
					alert("에러발생!");
				}
			});
		}
		function getSlotData(slotId){
			var id = {
				sp_id: slotId
			}
			$.ajax({
				url : "/project/user/getSlotData",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(id),
				dataType : "json",
				success : function(data) {
					//alert("데이터 불러오기 성공");
					addColorSlot(data);
				},
				error : function(data) {
					alert("데이터 불러오기 실패");
				}
			});
		}
		
		/* 책 표지 제목, 작성자, 컬러피커 */
		function addColorSlot(data){
			console.log("addColorSlot");
			console.log(data);
			$("#modal_slot_form").empty();
			$("#preview").empty();
			$("#modal_slot_color_form").show();
			var label = "";
			label+='<div class=""  align="center">';
			label+='<p>표지를 만들어 주세요</p>';
			label+='</div>';
			label+='<div class="coverbody-body" algin="center">';
			label+='<div class="coverbody-body-img">';
			if(data.sp_backgroundColor != null && data.sp_backgroundColor != "null"){
				label+='<div class = "coverbody-body-book" id="cover" style="background-color:';
				label+=data.sp_backgroundColor;
				label+=';">';
			} else {
				label+='<div class = "coverbody-body-book" id="cover">';	
			}
			label+='<div class = "coverbody-body-book-title">';
			label+='<input class="slotinput placeholder" type="text" id="title" placeholder="제목" style="color:';
			if(data.sp_fontColor != null && data.sp_fontColor != "null"){
				label+= data.sp_fontColor;	
			}
			label+=';"';
			if(data.sp_title == null || data.sp_title =="" || data.sp_title =="null"){
				label+='value=""';
			} else {
				label+='value="'+data.sp_title+'"';
			}
			label+='>';
			label+='</div>';
			label+='<div class = "coverbody-body-book-writer">';
			label+='<input class="slotinput placeholder" type="text" id="author" placeholder="글쓴이" style="color:';
			if(data.sp_fontColor != null && data.sp_fontColor != "null"){
				label+= data.sp_fontColor;
			}
			label+=';"';
			if(data.sp_author == null || data.sp_author == "" || data.sp_author =="null"){
				label+='value=""';
			} else {
				label+='value="'+data.sp_author+'"';
			}
			label+= '>';
			label+='</div>';
			label+='<div class="coverbody-body-book-img" style="width: 216px; height: 140px; vertical-align: middle;" align="center">';
			if(data.sp_image == null || data.sp_image == "" || data.sp_image == "null"){
				label+='<img style ="width:200px; height: 130px;" src="/project/resources/img/cover1.jpg">';
			} else {
				label+='<img width="100%" height="100%" src="/upload/'+data.sp_image+'">';
			}
			label+=	'</div>';
			label+= '</div></div></div>';
			
			$("#preview").append(label);
			
			$("#coversavebtn").empty();
			$("#coversavebtn").append(
				'<br><button class="button3" type="button" onClick="registSlot(\''+data.sp_id+'\',\''+data.sp_image+'\')">저장</button>'
			);
		}
		
		function registSlot(sp_id, sp_image){
			var registData = {
				sp_id : sp_id,
				sp_image : sp_image,
				sp_title : $("#title").val(),
				sp_author : $("#author").val(),
				sp_backgroundColor : $("#color1").val(),
				sp_fontColor : $("#color2").val()
			}
			$.ajax({
				url : "/project/user/registSlot",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(registData),
				dataType : "json",
				success : function(data) {
					alert("슬롯 저장 완료");
					$("#slotModal").modal('hide');
				},
				error : function(data) {
					alert("슬롯 저장 실패");
				}
			});
		}
		
		/* 책내용 */
		function addReview(id, list){
			/* console.log("addReview");
			console.log(id);*/
			console.log(list); 
			var label = "";
			var isThereBook = 'N';
			var count = 0;
			$("#bookcaseModal").modal("hide");
			setTimeout(function() {
				$("#slotReviewmodal").modal("show");
			}, 500);
			
			$("#modal_review_form").empty();
			
			/* 1 */
			label += '<div align="center" style="width: 100%; height: 150px; color:white; font-weight: bold; margin:auto; margin-bottom: 15px; background-image: url(\'/project/resources/img/planheader.jpg\'); background-repeat: no-repeat; background-size: cover;">';
			label += '<h3 style="line-height: 40px; font-weight: bold;">여 행 후 기</h3>';
			label += '<p style="line-height: 25px;">아름다운 여행을 책으로 만들어 기록해 보세요!</p>';
			label += '<button type="button" style="color: #6495ed; border: 0px; background-color: white;">도움말 보기</button>';
			/* 1- */
			label += '</div>';
			
			/* 2 */
			label += '<div style="display: inline-block; width: 100%; background-color: #e7e7e7;">';
			/* 3 */
			label += '<div class="" style="background-color:white; width: 50%; height:1200px; display:inline-block; float: left;">';
			/* 10 */
			label += '<div align="center" class="" style="background-color:white; width: 100%; height:1040px; text-align:center">'
			label += '<h2>차  례</h2>';
			label += '<p>여행을 완성해보세요!</p><br>'
			count = list.length;
			var slotId = "";
			$.each(list, function(i, d){
				slotId = d["slot_id"];
				isThereBook = d["contents_book"];
				
				label += '<div align="center" style="background-color:white;" id="review'+i+'" onClick="writeReview(\''+
				d["contents_id"]+'\',\''+d["slot_id"]+'\',\''+d["contents_date"]+'\',\''+d["contents_time"]+'\',\''+
				d["contents_plan"]+'\',\''+d["contents_name"]+'\',\''+d["contents_desc"]+'\',\''+
				d["contents_number"]+'\',\''+d["contents_addr"]+'\',\''+d["contents_lat"]+'\',\''+
				d["contents_lng"]+'\',\''+d["contents_image"]+'\',\''+d["contents_icon"]+'\', \''+
				d["contents_review"]+'\',\''+d["contents_picture"]+'\', \''+d["contents_book"]+'\','+i+','+count+')">';
				/* 보임 */
				label += '<div class="test" style="width: 55%; color:black; border-bottom:1px solid orange; padding-top: 7px; padding-bottom: 7px;">';
				label += '<input class="" style="text-align:right; width:20%; background-color:rgba(0,0,0,0); border:0px;" value="'+d["contents_date"]+'" readonly>';
				label += '<input class="" style="text-align:center	; width:20%; background-color:rgba(0,0,0,0); border:0px;" value="'+d["contents_time"]+'" readonly>';
				label += '<input class="" style="text-align:left; width:60%; background-color:rgba(0,0,0,0); border:0px;" value="'+d["contents_plan"]+'" readonly><br>';
				label += '<input class="" style="text-align:center; width:100%; background-color:rgba(0,0,0,0); border:0px;" value="'+d["contents_name"]+'" readonly>';
				label += '</div>';
				/* 안보임 */
				label += '<input type="hidden" id="name'+i+'" value="'+d["contents_name"]+'">';
				label += '<input type="hidden" id="desc'+i+'" value="'+d["contents_desc"]+'">';
				label += '<input type="hidden" id="number'+i+'" value="'+d["contents_number"]+'">';
				label += '<input type="hidden" id="addr'+i+'" value="'+d["contents_addr"]+'">';
				label += '<input type="hidden" id="lat'+i+'" value="'+d["contents_lat"]+'">';
				label += '<input type="hidden" id="lng'+i+'" value="'+d["contents_lng"]+'">';
				label += '<input type="hidden" id="image'+i+'" value="'+d["contents_image"]+'">';
				label += '<input type="hidden" id="icon'+i+'" value="'+d["contents_icon"]+'">';
				label += '</div>';
			});
			
			/* 10- */
			label += '</div>';
			
			/* 9 */
			label += '<div class="" style="background-color:white; width: 100%; height:138px;">'
			label += '<nav aria-label="Page navigation example">';
			label += '<ul class="pagination">';
			for(var i = 0; i < (count/15); i++){
				label += '<li class="page-item"><a class="page-link" onClick="pageReview('+(i+1)+')">'+(i+1)+'</a></li>';	
			}
			label += '</ul></nav>';
			/* 9- */
			label += '</div>';
			
			/* 3- */
			label += '</div>';
			
			/* 4 */
			label += '<div align="center" class="" style="background-color:white; width: 50%; height:1200px; display:inline-block; float: left;">';
			
			
			for(var i = 0; i < count; i++){
				label += '<div id="reviewlist'+i+'" class="">';//9시작
				label += '<div>';//10시작 사진이랑 이미지가 다들어가야함
				/* 제목 */
				label += '<div id="reviewtitle'+i+'" align="center" class="basic-line" style="margin-top:10px; width: 90%; height: 78px; background-color:white;">';//11시작
				label += '</div>';//11끝
				/* 이미지 */
				label += '<div class="basic-line" id="reviewmap'+i+'" align="center" style="width: 90%; height: 500px; background-color:white;">';
				label += '</div>';
				label += '</div>';//10끝
				label += '<div class="basic-line" style="width: 90%; height: 80px; background-color:white;">';//12시작
				label += '<form  id="reviewaddimage'+i+'">';
				label += '</div>';//12끝
				label += '<div id="reviewtextarea'+i+'" class="basic-line" style="width: 90%; height: 342px; background-color:white;">';//13시작
				label += '</div></form>';//13끝
				label += '</div>';//9끝label += '</div>';//9끝	
			}
						
			/* 11 */	
			label += '<div id="savereviewbtn" class="" style="width: 90%; height: 95px; background-color:white;">';
			/* 11- */
			label += '</div>';
			
			/* 12 책만들기 버튼 */	
			label += '<div id="" class="" style="width: 90%; height: 92px; background-color:white; padding-top: 25px;">';
			if(isThereBook == 'N'){
				label += '<button type="button" class="list-input-btn" style="margin-right:30px;" onClick="updateReview(\''+slotId+'\','+count+')">책 만들기</button>';	
			}
			label += '<button type="button" class="list-input-btn" data-dismiss="modal">끝내기</button>';
			/* 12- */
			label += '</div>';
			
			/* 4- */
			label += '</div>';

			/* 2- */
			label += '</div>';
			
			$("#modal_review_form").append(label);
			reviewList(0, count);
			pageReview(1);
		}
		
		function reviewList(i, count){
			for(var j = 0; j < count; j++){
				$("#reviewlist"+j).hide();
			}
			$("#reviewlist"+i).show();
		}
		
		function writeReview(id, slotid, date, time, plan, name, desc, number, addr, lat, lng, image, icon, review, picture, book, i, count){
			console.log(id+","+slotid+","+date+","+time+","+plan+","+name+","+desc+","+number+","+addr+","+lat+","+lng+","+image+","+icon+","+review+","+picture);
			$("#reviewtitle"+i).empty();
			$("#reviewmap"+i).empty();
			$("#reviewaddimage"+i).empty();
			$("#reviewtextarea"+i).empty();
			$("#savereviewbtn").empty();
			reviewList(i, count);
			
			var titleLabel = '<h3>'+plan+'</h3>';
			$("#reviewtitle"+i).append(titleLabel);
			
			var mapLabel = "";
			if(picture==null || picture=="" || picture=="null"){
				mapLabel = '<img src="">';	
			} else {
				mapLabel = '<img width="100%" height="500px" src="/upload/'+picture+'">';
			}
			$("#reviewmap"+i).append(mapLabel);
			
			review = review.replace(/<br>/g, '\n');
			
			var textAreaLabel = "";
			textAreaLabel += '<textarea id="reviewarea'+i+'" name="reviewarea" style="resize:none; width:100%; height: 100%;">'; 
			if(review == null || review == "" || review == "null"){
				
			} else {
				textAreaLabel += review
			}
			textAreaLabel += '</textarea>';
			$("#reviewtextarea"+i).append(textAreaLabel);
			
			var addImageLabel = '';
			
			/* 파일업로드 */
			if(book == "N"){
				addImageLabel += '<div style="background-image: url(\'/project/resources/img/planheader.jpg\')";>';
				addImageLabel += '<input type="file" id="addImage" name="addImage" class="upload">';
				addImageLabel += '</div>';
				/* addImageLabel += '<button type="button" onClick="uploadReview('+i+',\''+slotid+'\')">후기 저장하기</button>'; */	
			}
						
			addImageLabel += '<input type="hidden" name="reviewid" value="'+id+'">';
			addImageLabel += '<input type="hidden" name="reviewslotid" value="'+slotid+'">';
			addImageLabel += '<input type="hidden" name="reviewdate" value="'+date+'">';
			addImageLabel += '<input type="hidden" name="reviewtime" value="'+time+'">';
			addImageLabel += '<input type="hidden" name="reviewplan" value="'+plan+'">';
			addImageLabel += '<input type="hidden" name="reviewname" value="'+name+'">';
			addImageLabel += '<input type="hidden" name="reviewdesc" value="'+desc+'">';
			addImageLabel += '<input type="hidden" name="reviewnumber" value="'+number+'">';
			addImageLabel += '<input type="hidden" name="reviewaddr" value="'+addr+'">';
			addImageLabel += '<input type="hidden" name="reviewlat" value="'+lat+'">';
			addImageLabel += '<input type="hidden" name="reviewlng" value="'+lng+'">';
			addImageLabel += '<input type="hidden" name="reviewimage" value="'+image+'">';
			addImageLabel += '<input type="hidden" name="reviewicon" value="'+icon+'">';
			addImageLabel += '<input type="hidden" name="reviewpicture" value="'+picture+'">';
			$("#reviewaddimage"+i).append(addImageLabel);	
			
			var btnLabel = '';
			btnLabel = '<button style="margin-top: 25px;" class="review-btn" type="button" onClick="uploadReview('+i+',\''+slotid+'\')">후기 저장하기2</button>';
			$("#savereviewbtn").append(btnLabel);
		}
		
		function uploadReview(i, slotId){
			var textarea = $("#reviewarea"+i).val();
			var label = '<input type="hidden" id="reviewreview" name="reviewreview" value="'+textarea+'">'; 
			$("#reviewaddimage"+i).append(label);
			
			var formData = new FormData($("#reviewaddimage"+i)[0]);
			$.ajax({
				type : 'post',
				url : '/project/contents/addReviewImage',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data){
					//console.log(slotId);		
					ajaxgetListPlan(slotId, "review");					
					setTimeout(function() {
						$("#review"+i).click();	
					}, 500);
					
				}, 
				error : function(data){
					alert("업로드 실패");
				}
			});
		}
		
		/* 차례 */
		function addIndex(id, list){
			/* console.log(list); */
			var label = "";
			var isThereBook = "N";
			$("#bookcaseModal").modal("hide");
			setTimeout(function() {
				$("#slotIndexModal").modal("show");
			}, 500);
			$("#modal_slot_index_form").empty();
			/* 1 */
			label += '<div style="width: 100%; height: 150px; color:white; font-weight: bold; margin-bottom: 15px; background-image: url(\'/project/resources/img/planheader.jpg\'); background-repeat: no-repeat; background-size: cover;">';
			label += '<h3 style="line-height: 40px; font-weight: bold;">여 행 계 획</h3>';
			label += '<p style="line-height: 25px;">계획 부분은 책에 있어 차례에 들어갈 부분입니다.<br>완성된 계획은 여행 후기를 쓸 때 잘 정리할 수 있게 도와줍니다.</p>';
			label += '<button type="button" style="color: #6495ed; border: 0px; background-color: white;">도움말 보기</button>';
			/* 1- */
			label += '</div>';
			
			/* 2 */
			label += '<div style="display: inline-block; width: 100%;">';
			/* 3 */
			label += '<div class="basic-line" style="width: 50%; height:960px; display:inline-block; float: left; padding-top: 8px;">';
			label += '<input type="text" style="width: 20%" value="날짜" readonly>';
			label += '<input type="text" style="width: 20%" value="시간" readonly>';
			label += '<input type="text" style="width: 60%" value="계획" readonly>';
			
			/* 4 */
			label += '<div class="basic-line" style="width: 100% height: auto; margin-top: 10px; border: 0px; margin-bottom: 5px;">';
			var count = 0;
			
			$.each(list, function(i, d){			
				isThereBook = d["contents_book"];
				/* 5 */
				label += '<div class="test" id="planList'+i+'">';
				label += '<form>';
				label += '<input type="date" style="width : 20%;" required placeholder="Date" id="date'+i+'"';
				label += 'value="'+d["contents_date"]+'">';
				label += '<input type="time" style="width : 20%;" required  placeholder="Time" id="time'+i+'"';
				label += 'value="'+d["contents_time"]+'">';
				label += '<input class="" style="width : 60%;" placeholder="Plan" id="plan'+i+'"';
				label += 'value="'+d["contents_plan"]+'">';
				label += '<input type="hidden" id="namebtn'+i+'" value="'+d["contents_name"]+'">';
				label += '<input type="hidden" id="descbtn'+i+'" value="'+d["contents_desc"]+'">';
				label += '<input type="hidden" id="numberbtn'+i+'" value="'+d["contents_number"]+'">';
				label += '<input type="hidden" id="addrbtn'+i+'" value="'+d["contents_addr"]+'">';
				label += '<input type="hidden" id="latbtn'+i+'" value="'+d["contents_lat"]+'">';
				label += '<input type="hidden" id="lngbtn'+i+'" value="'+d["contents_lng"]+'">';
				label += '<input type="hidden" id="imagebtn'+i+'" value="'+d["contents_image"]+'">';
				label += '<input type="hidden" id="iconbtn'+i+'" value="'+d["contents_icon"]+'">';
				
				var btnId = 'btn'+i;
				
				label += '<div class="basic-line" style="width: 100%;">';
				label += '<div id="mapbtn'+i+'" style="width: 70%; display: inline-block;">';
				label += '<button type="button" style="width: 100%; border: 0px; background-color: white"';	
				if(d["contents_name"] == null || d["contents_name"] == "null" || d["contents_name"] == ""){
					label += 'id="btn'+i+'">';
					label += '&nbsp;</button>';
				} else {
					label += 'id="btn'+i+'" onClick="add(\''+d["contents_name"]+'\',\''+d["contents_desc"]+'\',\''
					+d["contents_number"]+'\',\''+d["contents_addr"]+'\',\''+d["contents_lat"]+'\',\''
					+d["contents_lng"]+'\',\''+d["contents_image"]+'\',\''+d["contents_icon"]+'\',\''+btnId+'\',\''+true+'\')">';
					label += d["contents_name"]+'</button>';
				}
				label += '</div>';
				label += '<div style="width: 30%; display: inline-block;">';
				label += '<button type="button" class="glyphicon glyphicon-trash bookingbtn" onClick="deleteMap(\''+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-home" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getAccomMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-road" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getRentMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-music" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getLeisureMap(\'btn'+i+'\')"></button>';	
				label += '</div>';
				label += '</div>';
				label += '</form>';
				/* 5- */
				label += '</div>';
				
				count = i;
			});
			
			for(var i=(count+1); i<75; i++){
				label += '<div class="test" id="planList'+i+'">';
				label += '<form>';
				label += '<input type="date" style="width : 20%;" required placeholder="Date" id="date'+i+'">';
				label += '<input type="time" style="width : 20%;" required  placeholder="Time" id="time'+i+'">';
				label += '<input type="text" style="width : 60%;" placeholder="Plan" id="plan'+i+'"';
				label += '<input type="hidden" id="namebtn'+i+'">';
				label += '<input type="hidden" id="descbtn'+i+'">';
				label += '<input type="hidden" id="numberbtn'+i+'">';
				label += '<input type="hidden" id="addrbtn'+i+'">';
				label += '<input type="hidden" id="latbtn'+i+'">';
				label += '<input type="hidden" id="lngbtn'+i+'">';
				label += '<input type="hidden" id="imagebtn'+i+'">';
				label += '<input type="hidden" id="iconbtn'+i+'">';
				var btnId = 'btn'+i;
				/* label += '<p>'; */
				label += '<div class="basic-line" style="width: 100%;">';
				label += '<div id="mapbtn'+i+'" style="width: 70%; display: inline-block;">';
				label += '<button type="button" style="width: 100%; border: 0px; background-color: white" id="btn'+i+'">';
				label += '&nbsp;</button>';
				label += '</div>';
				label += '<div style="width: 30%; display: inline-block;">';
				label += '<button type="button" class="glyphicon glyphicon-trash bookingbtn" onClick="deleteMap(\''+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-home" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getAccomMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-road" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getRentMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-music" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getLeisureMap(\'btn'+i+'\')"></button>';	
				label += '</div>';
				label += '</div>';
				label += '</form>';
				/* 5- */
				label += '</div>';	
			}
			
			/* plan-page */
			label += '<div align="center">';
			label += '<nav aria-label="Page navigation example">';
			label += '<ul class="pagination">';
			for(var i=0; i<5; i++){
				label += '<li class="page-item"><a type="button" class="page-link" onClick="pagePlan('+(i+1)+')">'+(i+1)+'</a></li>';	
			}
			label += '</ul>';
			label += '</nav>';
			label += '</div>';
			
			/* 4- */
			label += '</div>';
			/* 3- */
			label += '</div>';
			/* 6 */
			label += '<div class="basic-line" style="width: 50%; height: 960px; display: inline-block; float: left;">';
			/* 7 */
			label += '<div class="basic-line" style="width: 98%; height: 600px; background-color:white; margin-bottom: 10px;" id="map" >';
			/* label += '<img src="/project/resources/img/map.jpg" style="width:100%; height:100%;">'; */
			/* 7- */
			label += '</div>';
			/* 8 */
			label += '<div class="basic-line" id="contentList" style="width: 98%; height: 260px; background-color: white;">';
			/* 8- */
			label += '</div>';
			//map 밑에 페이지처리
			label += '<div class="" id="pageViewList" style="width: 98%; height: auto;" align="center"></div>';
			/* 6- */
			label += '</div>';
			
			$("#modal_slot_index_form").append(label);
			pagePlan(1);
			addIndexButton(id, isThereBook);
		}
		
		function deleteMap(i){
			$("#mapbtn"+i).empty();
			var label = "";
			label += '<button type="button" style="width: 100%; border: 0px; background-color: white"';
			label += 'id="btn'+i+'">';
			label += '&nbsp;</button>';
			$("#mapbtn"+i).append(label);
			$("#namebtn"+i).val("");
			$("#descbtn"+i).val("");
			$("#numberbtn"+i).val("");
			$("#addrbtn"+i).val("");
			$("#latbtn"+i).val("");
			$("#lngbtn"+i).val("");
			$("#imagebtn"+i).val("");
			$("#iconbtn"+i).val("");
		}
		
		function helpPlan(){
			
		}
		
		function addIndexButton(id, book){
			var label="";
			/* 9 */
			label += '<div class="" align="right">';
			/* label += '<button type="button" class="list-input-btn" style="margin-right:20px;" onClick="addIndex(\''+id+'\')">Reset</button>'; */
			if(book == 'N'){
				label += '<button type="button" class="list-input-btn" style="margin-right:20px;" onClick="planSave(\''+id+'\')">저장하기</button>';	
			}			
			label += '<button type="button" class="list-input-btn" data-dismiss="modal">끝내기</button>';
			/* 9- */
			label += '</div>';
			/* 2- */
			label += '</div>';	
			$("#modal_slot_index_form").append(label);
			
		}
		
		function getAccomMap(btnId){
			var accom = {id : 0};
			accomList(accom, btnId);
		}
		
		function getRentMap(btnId){
			console.log(btnId);
			var rent = {id : 0};
			rentList(rent, btnId);
		}
		
		function getLeisureMap(btnId){
			console.log(btnId);
			var leisure = {id : 0};
			leisureList(leisure, btnId);
		}
			
		function add(name, desc, number, addr, lat, lng, image, icon, btnId, each){
			console.log("들어왔음 ");
			console.log("name, desc, number, addr, lat, lng, image, icon, btnId");
			console.log(name+" ", desc+" ", number+" ", addr+" ", lat+" ", lng+" ", 
					image+" ", icon+" ", btnId+" ");
			
			var info = {
				name : name,
				desc : desc,
				number : number,
				image : image,
				addr : addr,
				icon : "ssibul"
			};	
			console.log("addFunction info");
			console.log(info);
			$("#name"+btnId).val(name);
			$("#desc"+btnId).val(desc);
			$("#number"+btnId).val(number);
			$("#addr"+btnId).val(addr);
			$("#lat"+btnId).val(lat);
			$("#lng"+btnId).val(lng);
			$("#image"+btnId).val(image);
			$("#icon"+btnId).val(icon);
			
			$("#"+btnId).text(name);
			$("#"+btnId).click(function(){
				view(info, lat, lng, null, null);
			});
			console.log("each여부");
			console.log(each);
			if(each == "true"){
				console.log("each가 true라서 눌렸다");
				view(info, lat, lng, null, null);
			}
		}
		
		function updateReview(id, count){
			var result = confirm("한번 만든 책은 수정이 되지 않습니다 계속하시겠습니까?");
			if(result){
				alert(count);
				
				var contents = {
					slot_id : id
				};
				var slot = {
					sp_id : id	
				};
				console.log(contents);
					
				ajaxUpdateBook(contents);
				ajaxSlotUpdateBook(slot);
			} 
		}
		
		function ajaxSlotUpdateBook(slot){
			$.ajax({
				url : "/project/user/updateBook",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(slot),
				dataType : "json",
				success : function(data) {
					alert("슬롯에서 책 만들기 완료");
				},
				error : function(data) {
					alert("슬롯에서 책 만들기 실패");
				}
			});
		}
		
		function ajaxUpdateBook(contents){
			$.ajax({
				url : "/project/contents/updateBook",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(contents),
				dataType : "json",
				success : function(data) {
					alert("책 만들기 완료");
				},
				error : function(data) {
					alert("책 만들기 실패");
				}
			});
		}
		
		function planSave(id){
			/* ajax통해서 기존 id값 내용 삭제 */
			var result = confirm("기존 내용이 삭제 됨 저장 할꺼임?");
			if(result){
				ajaxDeletePlan(id);
				
				/* ajax통해서 새로운 값 insert */
				var count = 0;
				var index = null;
				for(var i = 0; i<75; i++){
					if($("#time"+i).val()!=null && $("#time"+i).val()!="" && $("#plan"+i).val()!=null && $("#plan"+i).val()!="" ){
						if(count<10){
							index = '0'+count;
						} else {
							index = count;
						}
						var contents = {
							contents_id: id+"_"+index,
							slot_id: id,
							contents_date: $("#date"+i).val(),
							contents_time: $("#time"+i).val(),
							contents_plan: $("#plan"+i).val(),
							contents_name: $("#namebtn"+i).val(),
							contents_desc: $("#descbtn"+i).val(),
							contents_number: $("#numberbtn"+i).val(),
							contents_addr: $("#addrbtn"+i).val(),
							contents_lat: $("#latbtn"+i).val(),
							contents_lng: $("#lngbtn"+i).val(),
							contents_image: $("#imagebtn"+i).val(),
							contents_icon: $("#iconbtn"+i).val()
						};
						count++;
						console.log("저장하는 데이터");
						console.log(contents);
						for(var j=0; j<100000000; j++){
							
						}
						ajaxInsertPlan(id, contents);
						
					}				
				}
			}
		}

		function ajaxDeletePlan(slot_id){
			/* alert("삭제하고"); */
			var id = {slot_id : slot_id};
			//console.log(id);
			$.ajax({
				url : "/project/contents/deletePlan",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(id),
				dataType : "json",
				success : function(data) {
					alert("저장이 완료되었음");
				},
				error : function(data) {
					alert("삭제할 데이터가 없어 바로 저장함");
				}
			});
		}
		
		function ajaxInsertPlan(id, contents){
			/* alert("저장한다"); */
			$.ajax({
				url : "/project/contents/insertPlan",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(contents),
				dataType : "json",
				success : function(data) {
					ajaxgetListPlan(id, "plan");
				},
				error : function(data) {
					alert("저장 실패");
				}
			});
		}
		
		function ajaxgetListPlan(slot_id, cr){
			var id = {slot_id : slot_id};
			$.ajax({
				url : "/project/contents/getListPlan",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(id),
				dataType : "json",
				success : function(data) {
					if(cr=="plan"){
						
						addIndex(slot_id, data);	
					} else if(cr=="review"){
						//alert(cr);
						addReview(slot_id, data);
					}
					//alert("리스트 불러오기 성공");
				},
				error : function(data) {
					alert("리스트 불러오기 실패");
				}
			});
		}
		
		var content = null;
		contentList = function contentList(listData, icon, btnId){
			content = listData;
			var label = "";
			var page = 0;
			$("#contentList").empty();
			$.each(listData, function(i, d){
				/* label += '<button class="list-input-3-btn-side" type="button" onClick="viewList(\''+listData+'\')">'+d["name"]+'</button>'; */ 
				label += '<button id="btnViewList'+i+'" class="list-input-4-btn-side" type="button" onClick="viewList(\''+d["lat"]+'\',\''+d["lng"]+'\',\''+icon+'\',\''+btnId+'\')">'+d["name"]+'</button>';
				if(i%10==0){
					page++;
				}	
			});
			/* label += '<div id="pageViewList"></div>'; */
			$("#contentList").append(label);
			pageViewList(listData.length, 1, page);
			
		}
		function viewList(lat, lng, icon, btnId){
			view(content, lat, lng, icon, btnId);
		}
		
		function pageViewList(index, page, end){
			$("#pageViewList").empty();
			for(var i=0; i<index; i++){
				$("#btnViewList"+i).hide();
			}	
			for(var i=((page-1)*10);i<(page*10);i++){
				$("#btnViewList"+i).show();
			}
			var label = "";
			label += '<ul class="pagination pagination-sm">';
			for(var i=0; i<end; i++){
				label += '<li class=""><a type="button" class="page-link" onClick="pageViewList('+index+','+(i+1)+','+end+')">'+(i+1)+'</a></li>';	
			}
			label += '</ul>';
			$("#pageViewList").append(label);			
		}
		
		function pagePlan(i){
			for(var j=0; j<75; j++){
				$("#planList"+j).hide();	
			}
			
			for(var j=((i-1)*15); j<=((i*15)-1); j++){
				$("#planList"+j).show();
			}
		}
		
		function pageReview(i){
			for(var j=0; j<75; j++){
				$("#review"+j).hide();
			}
			for(var j=((i-1)*15); j<=((i*15)-1); j++){
				$("#review"+j).show();
			}
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    var f = $.farbtastic('#picker');
	    var p = $('#picker').css('opacity', 0.25);
	    var selected;
	    $('.colorwell')
	      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
	      .focus(function() {
	        if (selected) {
	          $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
	        }
	        f.linkTo(this);
	        p.css('opacity', 1);
	        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
	      });
	  });
	</script>
</body>
</html>