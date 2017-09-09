<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP</title>

<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- index CSS -->
<link href="/project/resources/css/main.css" rel="stylesheet">

</head>
<body>
	<div class="video-background">
		<div class="video-foreground">
			<iframe
				src="https://www.youtube.com/embed/QX4j_zHAlw8?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=QX4j_zHAlw8&mute=1&vq=hd1080"
				frameborder="0" allowfullscreen> </iframe>
		</div>
	</div>
	<div id="wrapper">
		<header>
			<h1 class="header-text"></h1>
		</header>
		<section class="content">
			<div align="center">
				<div class="signup-form__title"></div>
			</div>
			<br>
			<br>
			<div align="center">
				
				<a href="#" id="login_guest" style="text-decoration: none;">
				<font color="white" size="4px">둘러보기</font></a>
				 <font color="white" size="4px">&nbsp;&nbsp;&nbsp;&#166;&nbsp;&nbsp;&nbsp;</font>
				<a href="#loginModal" style="text-decoration: none;" data-toggle="modal" data-target="#loginModal"
					data-backdrop="static" id="modal_login">
					<font color="white" size="4px">로 그 인</font></a>
					<font color="white" size="4px"></font>
				<a href="#" style="text-decoration: none;" data-toggle="modal" data-target="#"
					data-backdrop="static" id="modal_logout">
					<font color="white" size="4px">로 그 아 웃</font></a>
					<font color="white" size="4px">&nbsp;&nbsp;&nbsp;&#166;&nbsp;&nbsp;&nbsp;</font>					
				<a href="#registModal" style="text-decoration: none;" data-toggle="modal"
					data-backdrop="static" data-target="#registModal" id="modal_regist">
					<font color="white" size="4px">회 원 가 입</font></a>
				<!-- <button class="btn btn-primary" id="upload_test">업로드테스트</button>
				<button class="btn btn-primary" id="map_test">map테스트</button>		 -->				
			</div>
		</section>	
		<footer>
			<!-- 우리 팀 로고가 들어가는 박스 -->
			<div class="signup-form-logo">
				<div class="signup-form__logo-box">
					<!-- 로고 삽입 -->
					<div class="signup-form__logo"></div>
					<!-- 제작자 -->
					<br>
					<div class="signup-form__catchphrase">
						<font color="white" size="2px">Copyright&copy; 2017. Qqu
							all rights reserved.</font>
					</div>
				</div>
			</div>
		</footer>
	</div>
	
	<div class="modal fade modalloginposition" id="loginModal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<!-- 헤더 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title" align="center">
							<span class="glyphicon glyphicon-user"></span>
						</h3>
				</div>
				<div class="modal-body" align="center">
					<!-- 바디 -->
					<form class="w3-container" action="" method="post"
						id="modal_login_form"></form>
					<br>
					<button type="button" id="user_login" class="btn btn-primary">Login</button>
				</div>
			</div>
		</div>
	</div>	
	
	<div class="modal fade modalregistposition" id="registModal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" align="center">
					<span class="glyphicon glyphicon-list-alt"></span>
					</h3>
				</div>
				
				<div class="modal-body" align="center">
				<!-- 바디 -->
					<form action="" method="post" id="modal_regist_form"></form>
					<br>
					<button type="button" id="user_regist" class="btn btn-primary">Regist</button>
				</div>
			</div>
		</div>
	</div>	
	
	
	<script src="/project/resources/js/jquery.min.js"></script>
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/ariaroseMain.js"></script>
	<script type="text/javascript">
		$("#upload_test").click(function(){
			location.href="/project/owner/ownerMain"
		});
		
		$("#map_test").click(function(){
			location.href="/project/owner/testMap"
		});
	</script>
</body>
</html>