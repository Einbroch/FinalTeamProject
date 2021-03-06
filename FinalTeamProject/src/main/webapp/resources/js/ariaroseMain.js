/**
 * 1. 회원가입
 *  
 */

/*function ajaxSession(){
		var getData = {
			user_userId : 0 //vo 와 같은 형태로 값을 넣어줌 vo안에 user_userId의 값을 넣음	
		}
		$.ajax({
			url : "/project/session/getSession",	//controller 단의 requestmapping이 되어있는 session/getSession으로 연결됨
			type : "POST",//무시
			contentType : "application/json;charset=UTF-8",//무시
			data : JSON.stringify(getData),//json의 string형태로 위에서 선언한 getData를 넣어줌
			dataType : "json",//리턴받을 타임을 json으로 설정함
			success : function(data) {//쿼리문에서 성공할 경우 
				$("#modal_logout").show();
			},
			error : function(data) {//쿼리문에서 실패할 경우
				$("#modal_login").show();
			}
		});
}*/


$(function() {
	/*
		처음에 login 버튼과 logout 버튼을 모두 숨김
	 * */
	$("#modal_login").hide();
	$("#modal_logout").hide();
	
	/* 게스트로 들어가기 */
	$("#login_guest").click(function(){
		location.href = "/project/user/userMain";
	});
	
	ajaxSession();
	/* 로그인/로그아웃 여부 확인 */
	
	function ajaxSession(){
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
				$("#modal_logout").show();//숨겼던 로그인 버튼과 로그아웃 버튼에서 로그인이 되어있을 경우 로그아웃만 보임
			},
			error : function(data) {
				$("#modal_login").show();//로그인을 하지 않았다면 로그인만 보임
			}
		});
	}
	
	/* 로그인 액션 */
	
	/* Login 버튼을 누를경우 modal_login_form에 id input, pw input생성 */
	$("#modal_login").click(function() {
		$("#modal_login_form").empty();
		$("#modal_login_form").append(
			'<input class="w3-input" type="text" id="login_user_userid" name="login_user_userid" placeholder="Id" autofocus="autofocus">' +
			'<input class="w3-input" type="password" id="login_user_password" name="login_user_password" placeholder="Password">'
		);
	});
	
	/* id와 pw 입력 후 Login 버튼을 누를 경우 */
	$("#user_login").click(function() {
		var loginData = {
			user_userId : $("#login_user_userid").val(),
			user_password : $("#login_user_password").val()
		};/*vo형태의 id, pw폼으로 넣어서 ajax로 전송*/
		
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
				/*alert("개인 페이지로 넘어갑니다");*/
				location.href = "/project/user/userMain"
				
			},
			error : function(data) {
				alert("로그인 실패");
				console.log(data);
			}
		});
	}

	
	/*	로그아웃 액션 */	
	$("#modal_logout").click(function(){
		ajaxLogout();
	});
	
	/* ajax를 통한 로그아웃 */
	function ajaxLogout() {
		var getData = {
			user_userId : 0	
		}
		/*컨트롤러에서 session을 지워버림*/
		$.ajax({
			url : "/project/login/userLogout",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(getData),
			dataType : "json",
			success : function(data) {
				$("#modal_logout").hide();
				$("#modal_login").show();
				alert("로그아웃 되었습니다");
			},
			error : function(data) {
				
			}
		});
	}
	
	/* 회원가입 액션 */
	$("#modal_regist").click(function() {
		/*modal_regist_form안에 input을 생성함*/
		$("#modal_regist_form").empty();
		$("#modal_regist_form").append(		
			'<input class="w3-input" type="text" id="user_userid" name="user_userid" placeholder="ID">' +
			'<p id="check_user_userid"></p>' +
			'<input class="w3-input" type="password" id="user_password" name="user_password" placeholder="Password">' +
			'<p id="check_user_password"></p>' +
			'<input class="w3-input" type="text" id="user_name" name="user_name" placeholder="Name">' +
			'<p id="check_user_name"></p>' +
			'<input class="w3-input" type="tel" id="user_phonenumber" name="user_phonenumber" placeholder="Tel ex)010-1234-5678">' +
			'<p id="check_user_phonenumber"></p>' +
			'<input class="w3-input" type="email" id="user_email" name="user_email" placeholder="E-mail">' +
			'<p id="check_user_email"></p>'
		);
	});

	/* regist누르면 db에 저장 */
	$(document).on("blur", "#user_userid", function() {
		idCheck(getRegistUserData());
	});

	$("#user_regist").click(function() {
		if (inputCheck(getRegistUserData())) {
			ajaxRegistUser(getRegistUserData());
		} else {
			alert("회원가입실패");
		}
	});

	/* 회원가입시 정보기입한 내역을 불러옴 */
	function getRegistUserData() {
		var registData = {
			user_userId : $("#user_userid").val(),
			user_password : $("#user_password").val(),
			user_name : $("#user_name").val(),
			user_phoneNumber : $("#user_phonenumber").val(),
			user_email : $("#user_email").val()
		};
		return registData;
	}
	
	/* 회원가입 양식에 잘못된기입이 있는지 확인 */
	function inputCheck(getData) {
		/*회원가입시 정보기입한 내역을 불러와서 password의 길이, 전화번호의 타입, email의 타입을 검사함*/
		$("#check_user_password").text("");
		$("#check_user_name").text("");
		$("#check_user_phonenumber").text("");
		$("#check_user_email").text("");
		var boolean = true;
		if (!idCheck(getData)) {
			boolean = false;
		}
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

	/* ID 체크함 중복인지 특수문자가 들어갔는지 */
	function idCheck(getData) {
		$("#check_user_userid").css("color", "red");
		var id = getData.user_userId;
		var boolean = true;
		if (specialLetters(id) && length(id, 5, 14)) {
			$.ajax({
				url : "/project/regist/checkUserId",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(getData),
				dataType : "json",
				success : function(data) {
					$("#check_user_userid").css("color", "green");
					$("#check_user_userid").text("사용가능");
				},
				error : function(data) {
					$("#check_user_userid").text("중복된 ID");
					boolean = false;
				}
			});
		} else {
			$("#check_user_userid").text("ID값 5~14 / 특수문자 사용 금지");
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

	/* 회원가입 등록 ajax */
	function ajaxRegistUser(getData) {
		$.ajax({
			url : "/project/regist/registUser",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(getData),
			dataType : "json",
			success : function(data) {
				alert("회원가입 완료");
				ajaxGetRegistData(getRegistUserData());
				$("#registModal").modal('hide');
			},
			error : function(data) {
				alert("회원가입 실패");
			}
		});
	}
	/*회원가입을 하면 슬롯아이디를 3개 생성함
		먼저 내가 저장한 데이터를 불러오고난 뒤
		ajaxAddSlot을 통해 슬롯 아이디를 3개 생성함
	*/
	function ajaxGetRegistData(getData){
		console.log(getData);
		$.ajax({
			url : "/project/regist/getRegistUser",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(getData),
			dataType : "json",
			success : function(data) {
				//console.log(data);				
				ajaxAddSlot(data);
			},
			error : function(data) {
				//alert("회원가입 실패");
			}
		});
	}
	/*
		슬롯을 3개 생성 하는 ajax
	 */
	function ajaxAddSlot(data){
		var Data = {
			sp_id : data.user_userId,
			user_id : data.user_id
		};
		$.ajax({
			url : "/project/user/addRegistSlot",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(Data),
			dataType : "json",
			success : function(data) {
				//alert("슬롯이 생성되었음 로그인하고 이용해라");
			},
			error : function(data) {
				alert("슬롯저장 실패");
			}
		});
	}
	
});