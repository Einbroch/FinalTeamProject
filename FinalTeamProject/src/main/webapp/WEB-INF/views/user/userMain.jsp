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
<link href="/project/resources/css/basic.css" rel="stylesheet">
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
				그 추억을 제주일기에서 공유하세요! 롸잇나우!!
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

	<!-- 플립북 -->
	   <!-- 여기서부터  상세페이지 -->

   <div class="modal fade position" id="book_modal" role="dialog">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size" style="overflow: hidden;">

            <!-- 헤더 -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3 class="modal-title" align="center">
                  <font color="black"> <span class="glyphicon glyphicon-list"></span>
                  </font>
               </h3>
            </div>
            <!-- 바디 -->
            <!-- ㅋㅋㅋ -->
            <div class="modal-body" align="center">
               <div class="flipbook-viewport">
                  <!-- 사이드바 -->
                  <div id="sidebar" class="sidemenubar">
                     
                  </div>
                  <!-- 플립북 -->
                  <div class="container">
                     <div class="flipbook" id="userReviewPage" >
                     	<!-- 첫 페이지 고정 -->
                        <div class="hard" style="border: 1px solid #000000;" id="firstpage">
                           
                        </div>
                        <!-- 두번째 페이지 고정 -->
                        <div class="hard" style="border: 1px solid #000000;" id="secondpage">
                           
                        </div>
                        <!-- 세번째 페이지 고정 -->
                        <div
                        	id="thirdpage"
                           style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>
                        <!-- 네번째 페이지 고정 -->
                        <div
                        	id="fourthpage"
                           style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>
                        
                        <!-- 다섯번째 페이지 고정 -->
                        <div style="background-image: url(/project/resources/img/first_title.png)"></div>
					 </div>
                  </div>
               </div>
            </div>
            <!-- <div class="modal-footer"></div> -->
            <br>
         </div>
      </div>
   </div>
   <!-- 여기까지 상세페이지 -->

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
					<input id="bbssearch" class="search-input" type="search" placeholder="찾아보기" style="width: 40%; height: 29px; margin-bottom: 30px; text-align: center;">		
				</div>
				<div>
					<button id="bbssearchbtn" class="searchbtn"></button>
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
			<div style="/* padding-right: 40px; */">
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
		<div class="modal-dialog" role="document" style="overflow-y: scroll; width:90%; max-height:90%;" id="modal_scroll">
			<div class="modal-content">
				<div class="modal-header" >
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 id="slot_title" align="center">
					<font color="black"><span class="glyphicon glyphicon-list"></span>
                  	</font>
					</h3>
				</div>
				<div class="modal-body basic-line" id="here">
					<form class="w3-container" style="width: 100%;" method="post" id="modal_slot_index_form">
							
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
	<script src="/project/resources/js/modernizr.2.5.3.min.js"></script>
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/ariaroseUser.js"></script>
	<script src="/project/resources/js/farbtastic.js"></script>
	<script src="/project/resources/js/jquery.easing.min.js"></script>
	<!-- <script src="/project/resources/js/jquery.basic.js"></script> -->

	
				
	<!-- 클러스터 -->
	<script
      src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script type="text/javascript">
    
    </script>
	<!-- 위도경도를 입력해서 지도에 뿌려주는 구글맵 api 키값 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDs-T1EEykIfdXaJaB5ML6HYsddRZ5BD4U"></script>
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