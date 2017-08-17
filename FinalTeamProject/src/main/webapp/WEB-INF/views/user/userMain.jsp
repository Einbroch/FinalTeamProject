<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/project/resources/css/userMain.css" rel="stylesheet">

</head>
<body class="userbody">
	<div class="video-background">
		<div class="video-foreground">
			<iframe
				src="https://www.youtube.com/embed/3A9TsFyov5w?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&playlist=3A9TsFyov5w&mute=1"
				frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
	<br>
	<div class="userBBS" align="center">
		<div class="row userBBSInfo">
			<div align="right" style="padding-top: 20px; padding-right: 20px;">
				<!-- Top 버튼 -->
				<button type="button" id="btn-mybookcase" data-toggle="modal"
					data-target="#bookcaseModal" name="btn-mybookcase" class="btn btn-primary">내 책장</button>
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#loginModal" id="modal_login">Login</button>
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#logoutModal" id="modal_logout">Logout</button>
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#myinfoModal" id="modal_myinfo">MyInfo</button>
			</div>
		</div>
	</div>

	<!-- 슬롯 모달 -->
	<div class="modal fade" id="slotModal" role="dialog" align="center">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 id="slot_title"></h3>
				</div>
				<div class="modal-body" align="center">
					<form method="post" id="modal_slot_form" enctype="multipart/form-data"></form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 슬롯 디테일 모달 -->
	<div class="modal fade" id="slotDetailModal" role="dialog" align="center">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 id="slot_title"></h3>
				</div>
				<div class="modal-body" align="center">
					<form method="post" id="modal_slot_detail_form" enctype="multipart/form-data">
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 내 책장 모달 -->
	<div class="modal fade" id="bookcaseModal" role="dialog" align="center">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" align="center">Bookcase</h3>
				</div>
				<div class="modal-body" align="center">
					<form method="post" id="modal_bookcase_form">
						
					</form>
					<form method="post" id="modal_bookcase_form_btn">
					
					</form>
				</div>
				<div class="modal-footer" style="text-align: center !important;">
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 모달 -->
	<div class="modal fade bs-example-modal-sm modalloginposition"
		tabindex="-1" id="loginModal" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h3 class="modal-title" align="center">Login</h3>
					<div class="modal-body" align="center">
						<form method="post" id="modal_login_form"></form>
					</div>
					<div class="modal-footer" align="right">
						<button type="button" id="user_login" class="btn btn-primary">Login</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 정보수정 모달 -->
	<div class="modal fade bs-example-modal-sm modalregistposition"
			tabindex="-1" id="myinfoModal" role="dialog"
			aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h3 class="modal-title" align="center">정보수정</h3>
					<div class="modal-body" align="center">
						<form method="post" id="modal_myinfo_form"></form>
					</div>
					<div class="modal-footer" align="right">
						<button type="button" id="user_update" class="btn btn-primary">수정하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/project/resources/js/jquery.min.js"></script>
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/jscolor.js"></script>
	<script type="text/javascript">
		$(function() {
			var session = null;
			var modify;
			$("#modal_login").hide();
			$("#modal_logout").hide();
			$("#modal_myinfo").hide();
			$("#btn-mybookcase").hide();
			
			ajaxSession();
			
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
					'<input type="text" id="login_user_userid" name="login_user_userid" placeholder="Id">' +
					'<input type="password" id="login_user_password" name="login_user_password" placeholder="Password">'
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
						alert("로그인 하셨습니다.");
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
						alert("로그아웃 되었습니다");
						session = null;
					},
					error : function(data) {}
				});
			}
	
			/* 내 정보 수정 */
			$("#modal_myinfo").click(function(){
				$("#modal_myinfo_form").empty();
				$("#modal_myinfo_form").append(
					'<input type="password" id="user_password" name="user_password" placeholder="Password">' +
					'<p id="check_user_password"></p>' +
					'<input type="text" id="user_name" name="user_name" placeholder="Name" value="'+session.user_name+'">' +
					'<p id="check_user_name"></p>' +
					'<input type="tel" id="user_phonenumber" name="user_phonenumber" placeholder="Tel ex)010-1234-5678" value="'+session.user_phoneNumber+'" >' +
					'<p id="check_user_phonenumber"></p>' +
					'<input type="email" id="user_email" name="user_email" placeholder="E-mail" value="'+session.user_email+'">' +
					'<p id="check_user_email"></p>'		
				);
				
			});
			
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
						/* $("#myinfoModal").modal('hide'); */
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

			/* 입력의 길이에 따라 true, false를 리턴함 */
			function length(data, min, max) {
				if (data.length < min || data.length > max) {
					return false;
				} else {
					return true;
				}
			}

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
			
			/* $(document).on("click","#book_list1",function(){
				alert("씨벌");
			}); */
			
			$("#btn-mybookcase").click(function() {
				//console.log("session : "+session.user_userId);
				getSlot(session.user_id, session.user_userId);
								
			});
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
					alert("불러오기 성공");
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
			$("#modal_bookcase_form").append(
				'<table>'+
					'<tr>'
			);
			$("#modal_bookcase_form_btn").empty();
			$("#modal_bookcase_form_btn").append(
				'<table>'+
					'<tr>'
			);
			$.each(data, function(i, d){
				slot = {
					sp_id:d["sp_id"],
					user_id:d["user_id"],
					sp_image:d["sp_image"],
					sp_backgroudColor:d["sp_backgroudColor"],
					sp_fontColor:d["sp_fontColor"],
					sp_title:d["sp_title"],
					sp_author:d["sp_author"]
				};
				var imglabel = "";
				imglabel += '<td width="250px" align="center">';
				if(d["sp_image"] != null){
					imglabel += '<img width="250px" height="200px" src="/upload/'+d["sp_image"]+'">';	
				} else {
					imglabel += '<img width="250px" height="200px" src="/project/resources/img/logo.png">';
				}
				imglabel += '</td>'
				$("#modal_bookcase_form").append(imglabel);
				var btnlabel = "";
				btnlabel += '<td width="250px" height="400px" align="center">';
				btnlabel += '<button type="button" id="planslot_1" class="btn btn-primary"';
				btnlabel += 'onclick="javascript:addImageSlot(\''+id+'\',\''+d["sp_id"]+'\')">';
				btnlabel += d["sp_id"]+'편집</button>'
				btnlabel += '</td>';
				$("#modal_bookcase_form_btn").append(btnlabel);
			});
			$("#modal_bookcase_form").append(
					'</tr>'+
				'</table>'
			);
			$("#modal_bookcase_form_btn").append(
					'</tr>'+
				'</table>'
			);
		}
		function addImageSlot(id, slotId){
			/* alert("슬롯 : "+id);	 */
			$("#bookcaseModal").modal('hide');
			$("#slotModal").modal('show');
			$("#slot_title").text("표지");
			$("#modal_slot_form").empty();
			$("#modal_slot_form").append(
				'<div align="center">'+
				'<h1>표지에 넣을 사진을 넣어주세요</h1>'+
				'<input type="file" id="fileUp" name="fileUp"/><br/><br/>'+
				'<input type="hidden" name="slotId" value="'+slotId+'"/>'+
				'<input type="hidden" name="userId" value="'+id+'"/>'+
				'<input class="btn btn-primary" type="button" value="다음" onClick="uploadSlot(\''+id+'\',\''+slotId+'\');">'+
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
					alert("파일 업로드");
					getSlotData(slotId);
					//addColorSlot(id, slotId);
				},
				error:function(data){
					alert("파일 업로드 실패");
				}
			});
			
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
					alert("데이터 불러오기 성공");
				},
				error : function(data) {
					alert("데이터 불러오기 실패");
				}
			});
		}
		
		function addColorSlot(id, slotId){
			console.log(id+"_"+slotId);
			
			$("#modal_slot_form").empty();
			$("#modal_slot_form").append(
				'<input class="jscolor">'		
			);
		}
			/* $("#slot_title").text("차례");
			$("#modal_slot_form").hide(); */
		}
	</script>
</body>
</html>