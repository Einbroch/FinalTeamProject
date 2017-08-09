<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- index CSS -->
<link href="/project/resources/css/index.css" rel="stylesheet">

</head>
<body class="body">
	<div class="video-background">
		<div class="video-foreground">
			<iframe
				src="https://www.youtube.com/embed/d1KHr_z33oA?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=d1KHr_z33oA&mute=1"
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
				data-target="#registModal" id="modal_regist">Regist</button>
				
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
	
	<script type="text/javascript">
		$(function(){
			
			/* 로그인 액션 */
			
			/* Login 버튼을 누를경우 modal_login_form에 id input, pw input생성 */
			$("#modal_login").click(function(){
				$("#modal_login_form").empty();
				$("#modal_login_form").append(
					'<input type="text" id="user_userid" name="user_userid" placeholder="Id">' +
					'<input type="password" id="user_password" name="user_password" placeholder="Password">'
				);
			});
			/* id와 pw 입력 후 Login 버튼을 누를 경우 */
			$("#user_login").click(function(){
				var loginData = {
					user_userId : $("#user_userid").val(),
					user_password : $("#user_password").val()
				};
				/* console.log(loginData); */
				ajaxLogin(loginData);
			});
			/* ajax 통한 로그인 */
			function ajaxLogin(loginData){
				$.ajax({
					url : "/project/login/userLogin",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(loginData),
					dataType : "json",
					success : function(data) {
						alert("로그인 성공");
						console.log(data);
					},
					error : function(data) {
						alert("로그인 실패");
					}
				});
			}
			
			
			
			/* 회원가입 액션 */
			$("#modal_regist").click(function(){
				$("#modal_regist_form").empty();
				$("#modal_regist_form").append(
					'<label>개인<input type="radio" value="사용자" id="user_part1" name="user_part" checked="checked"></label>' +
					'<label>사업자<input type="radio" value="사업자" id="user_part2" name="user_part"></label>' +
					'<br>' +
					'<input type="text" id="user_userid" name="user_userid" placeholder="ID">' +
					'<p id="check_user_userid"></p>' +
					'<input type="password" id="user_password" name="user_password" placeholder="Password">' +
					'<p id="check_user_password"></p>' +
					'<input type="text" id="user_name" name="user_name" placeholder="Name">' +
					'<p id="check_user_name"></p>' +
					'<input type="tel" id="user_phonenumber" name="user_phonenumber" placeholder="Tel ex)010-1234-5678">' +
					'<p id="check_user_phonenumber"></p>' +
					'<input type="email" id="user_email" name="user_email" placeholder="E-mail">' +
					'<p id="check_user_email"></p>'
				);
			});
			
			/* regist누르면 db에 저장 */
			$("#user_regist").click(function(){
				console.log(getRegistUserData());
			});
			
			/* 정보기입한 내역을 불러옴 */
			function getRegistUserData(){
				var part = userPart();
				var registData = {
					user_part : part,
					user_userId : $("#user_userid").val(),
					user_password : $("#user_password").val(),
					user_name : $("#user_name").val(),
					user_phoneNumber : $("#user_phonenumber").val(),
					user_email : $("#user_email").val()
				};
				return registData;
			}
			
			/* check한 부분을 찾음 */
			function userPart(){
				var part = document.getElementsByName('user_part');
				if (part[0].checked) {
					return part[0].value;
				} else {
					return part[1].value;
				}
			}
			
			
			
			
			
		});
	</script>
</body>
</html>