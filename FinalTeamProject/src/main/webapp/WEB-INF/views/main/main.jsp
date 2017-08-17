<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- index CSS -->
<link href="/project/resources/css/main.css" rel="stylesheet">

</head>
<body class="body">
	<div class="video-background">
		<div class="video-foreground">
			<iframe
				src="https://www.youtube.com/embed/3A9TsFyov5w?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=3A9TsFyov5w&mute=1"
				frameborder="0" allowfullscreen> </iframe>
		</div>
	</div>
	
	<!-- 로고 -->
	<div class="signup-form">
		<div class="signup-form__logo-box">
			<div class="singup-form__logo"></div>
			<div class="signup-form__catchphrase">뀨 Project</div>
		</div>
		<div>
			<!-- 로그인, 회원가입 버튼 -->
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#loginModal" id="modal_login">Login</button>
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#logoutModal" id="modal_logout">Logout</button>
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#registModal" id="modal_regist">Regist</button>
			<br><br>
			<button class="btn btn-primary" id="login_guest">Geust로 들어가기</button>
			<button class="btn btn-primary" id="upload_test">업로드테스트</button>
			<!-- 로그인 모달 -->	
			<div class="modal fade bs-example-modal-sm modalloginposition" tabindex="-1"
				id="loginModal" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h3 class="modal-title" align="center">Login</h3>
							<div class="modal-body" align="center">
								<form method="post" id="modal_login_form">
									
								</form>
							</div>
							<div class="modal-footer" align="right">
								<button type="button" id="user_login" class="btn btn-primary">Login</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 회원가입 모달 -->
			<div class="modal fade bs-example-modal-sm modalregistposition" tabindex="-1" 
				id="registModal" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h3 class="modal-title" align="center">Regist</h3>
							<div class="modal-body" align="center">
								<form method="post" id="modal_regist_form">
								
								</form>
							</div>
							<div class="modal-footer" align="right">
								<button type="button" id="user_regist" class="btn btn-primary">Regist</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
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
	</script>
</body>
</html>