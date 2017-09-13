/**
 * 
 */
/* $function 밖에서도 쓰기위해 변수 선언 */
		var view;
		var accomList;
		var rentList;
		var leisureList;
		var contentList;
		var callbbs = null;
		var bbsListPage = null;
		
		$(function() {
			/* 둘러보기 scroll event 둘러보기를 눌렀을 경우 bbs 리스트로 스무스하게 이동함 ㅋ*/
			
			$("#doolerzz").click(function(){
				$('html, body').animate({
					scrollTop : $("#BBS").offset().top
				}, 1250, 'easeInOutExpo');
			});
			
			var session = null;
			var modify;
			/* 처음에 로그인, 로그아웃, 내정보수정, 내책장의 버튼을 모두 hide시킴 */
			$("#modal_login").hide();
			$("#modal_logout").hide();
			$("#modal_myinfo").hide();
			$("#btn-mybookcase").hide();
			$("#modal_slot_color_form").hide();
			
			/* ajaxSession을 통해 로그인을 했는지 여부를 판단하고 로그인 했을 경우에는 로그아웃 버튼과 내정보수정, 내책장의 버튼을 show
				아닐 경우 로그인만 show
			*/
			ajaxSession();
			
			
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
			/* 저장되어 있는 session의 정보를 뿌림 */
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
				/*닫기 버튼을 누르면 모달을 닫음*/
				$("#myinfoModal").modal("hide");
			});
			
			/* DB에 저장되어있는 값들을 미리 세팅해놓음 */
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
			
			/* 정보 수정  */
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
			
			/* 내 정보에서 수정하고자 하는 데이터를 불러와서 업데이트 시킴 */
			function getModifyData(){
				modify = {
						user_id : session.user_id,
						user_password : $("#user_password").val(),
						user_name : $("#user_name").val(),
						user_phoneNumber : $("#user_phonenumber").val(),
						user_email : $("#user_email").val()	
				};
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
			
			/* 적용하기 버튼을 누를경우 폰트 컬러값을 바꿈 */
			$("#ft_btn").click(function(){
				$("#title").css("color", $("#color2").val());
				$("#author").css("color", $("#color2").val());
			});
			
			/* 적용하기 버튼을 누를경우 백그라운드 컬러값을 바꿈 */
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
				}
				var initmap = initmap(value);
				setTimeout(function() {
					google.maps.event.addDomListener(window, 'load', initmap);
				}, 3000);
			}
			
			/* bbs 검색 기능 */
			$("#bbssearchbtn").click(function(){
				var search = $("#bbssearch").val();
				ajaxSearchBBSList(search);
			});
			
			/* searchvo 의 값을 변수d에 넣고 ajax를 태움 */
			function ajaxSearchBBSList(search){
				var d = {search: search};
				$.ajax({
					url:"/project/bbs/search",
					type:"POST",
					contentType:"application/json;charset=UTF-8",
					data:JSON.stringify(d),
					dataType:"json",
					success:function(data){
						/* alert("검색 성공"); */
						var returndata = returnlength(data);
						/* 검색한 bbs List를 뿌려줌 */
						listBBS(data);
						/* 검색한 bbs List 페이지 처리 */
						bbsListPage(returndata, 0);
					},
					error:function(data){
						
					}
				});
			}
			
			/* bbs에서 페이징처리 */
			/* data: 뿌릴 데이터 block: 페이지*/
			bbsListPage = function listBBSPage(data, block){	
				/* bbslistpage를 처음에 비워준다 */
				$("#bbslistpage").empty();
				var count = 0;
				var label = '';
				label += '<div class= "pagination" style="text-align:center">';
				/* 좌측 화살표 */
				if(block != 0){
					label += '<li onClick="bbsListPage('+data+','+(block-1)+')">&laquo;</li>';	
				} else {
					label += '<li class="disabled">&laquo;</li>';
				}
				
				/* 모든 데이터를 hide 시키고 페이지를 생성시킴 */
				for (var i = 0; i<data; i++){
					$("#bbsbook"+i).hide();
					if(i%10==0){
						/* 10개에 1묶음으로 페이지 생성 */
						label += '<li id="bbspage'+i+'" onClick="bbsListPage('+data+','+count+')">'+(++count)+'</li>';
					}
				}
				/* 현재 페이지를 show 시킴 */
				for(var i = (block*10); i<((block*10)+10); i++){
					$("#bbsbook"+i).show();
				}
				/* 우측 화살표 */
				if(block != (count-1)){
					label += '<li onClick="bbsListPage('+data+','+(block+1)+')">&raquo;</li>'; //다음페이지	
				} else {
					label += '<li class="disabled">&raquo;</li>'; // 끝이면 disable
				}
				
				
				label += '</div>';
				
				$("#bbslistpage").append(label);
			}
			
			/* bbs 불러옴*/
			callbbs = function ajaxBBS(block) {
				var url = "/project/bbs/data/" + block;
				$.ajax({
					url : url,
					type : "post",
					dataType : "json",
					success : function(data){
						var returndata = returnlength(data);
						//bbslist를 뿌림
						listBBS(data);
						//bbslist 페이지 처리
						bbsListPage(returndata, block);
					},
					complete : function(data){
						
					}
				});
			}
			
			function returnlength(data){
				return data.length;
			}
			
			//첫 시작에 callbbs를 통해 1페이지의 bbs를 뿌림
			
			callbbs(0);
			/* 리스트 */
			/* list뿌리기 */
			function listBBS(data){
				$("#bbslist").empty();
				var label = "";
				var count = 0;
				/* ajax에서 가져온 데이터를 each function을 통해 하나하나 뿌려줌 d[""]에서 ""안은 vo안에 변수이름 임*/
				$.each(data, function(i, d){
					label += '<li class="col Book" id="bbsbook'+i+'" onClick="ajaxBookPage(\''+d["sp_id"]+'\',\''+d["sp_title"]+'\',\''+d["sp_author"]+'\',\''+d["sp_image"]+'\', \''+d["sp_backgroundColor"]+'\', \''+d["sp_fontColor"]+'\')">';
					if(d["sp_backgroundColor"] != null && d["sp_backgroundColor"] != "null" && d["sp_backgroundColor"] != ""){
						label += '<div style="width: 130px; height: 180px; background-color:'+d["sp_backgroundColor"]+';">';
						
					} else {
						label += '<div style="width: 130px; height: 180px; background-color:white;">';
						
					}
					
					/* 제목 */
					/* 제목 색깔이 있으면 */
					if(d["sp_fontColor"] != null && d["sp_fontColor"] != 'null' && d["sp_fontColor"] != ''){
						label += '<div style="color:'+d["sp_fontColor"]+'">';	 
					} else {
						label += '<div style="color:'+d["sp_fontColor"]+'">';
					}
					/* 제목 값이 있으면 */
					if(d["sp_title"]!= null && d["sp_title"]!="" && d["sp_title"]!= "null"){
						if(d["sp_title"].length>10){
							/* 제목이 8자 이상 되면 .. 처리 */
							label += '<p class = "BBS-book-title">'+d["sp_title"].substring(0, 8)+'..'+'</p>';
						} else {
							label += '<p class = "BBS-book-title">'+d["sp_title"]+'</p>';	
						}	
					} else {
						/* 제목 값이 없으면 */
						label += '<p class = "BBS-book-title">제목</p>';
					}
					
					
					label += '</div>';
					/* 글쓴이 */
					/* 글쓴이 색깔 값이 있으면 */
					if(d["sp_fontColor"] != null && d["sp_fontColor"] != 'null' && d["sp_fontColor"] != ''){
						label += '<div style="color:'+d["sp_fontColor"]+'">';
					} else {
						label += '<div style="color:'+d["sp_fontColor"]+'">';
					}
					/* 글쓴이 값이 있으면 */
					if(d["sp_author"]!= null && d["sp_author"]!="" && d["sp_author"]!= "null"){
						if(d["sp_author"].length>10){
							label += '<p class = "BBS-book-writer">'+d["sp_author"].substring(0, 8)+'..'+'</p>';
						} else {
							label += '<p class = "BBS-book-writer">'+d["sp_author"]+'</p>';	
						}	
					} else {
						/* 색깔 값이 없으면 */
						label += '<p class = "BBS-book-writer">글쓴이</p>';
					}
					
					label += '</div>';
					
					label += '<div class = "BBS-book-img">';
					if(d["sp_image"]!= null && d["sp_image"]!="" && d["sp_image"]!= "null"){
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
		
		
		/* 플립북 page넘기는 효과 function */
		function turnPage(num){
			   $('.flipbook').turn("page",num);
			}

			function loadApp() {

			   // Create the flipbook

			   $('.flipbook').turn({
			         // Width

			         width:922,
			         
			         // Height

			         height:600,

			         // Elevation

			         elevation: 50,
			         
			         // Enable gradients

			         gradients: true,
			         
			         // Auto center this flipbook

			         autoCenter: true

			   });
			}

			// Load the HTML4 version if there's not CSS transform

			yepnope({
			   test : Modernizr.csstransforms,
			   yep: ['/project/resources/js/turn.js'],
			   nope: ['/project/resources/js/turn.html4.min.js'],
			   both: ['/project/resources/css/basic.css'],
			   complete: loadApp
			});
		
			/* 클릭해서 book에 뿌려질 list 불러오는 함수 */
		function ajaxBookPage(slot_id, title, author, image, backgroundColor, fontColor){
			var id = {slot_id : slot_id};
			$.ajax({
				url : "/project/contents/getListPlan",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(id),
				dataType : "json",
				success : function(data) {
					//일루
					var length = returnlength(data);
					$("#userReviewPage").turn("pages", length+5);
					$("#userReviewPage").turn("page", 1);
					bookPage(data, title, author, image, backgroundColor, fontColor);
				},
				error : function(data) {
					alert("리스트 불러오기 실패");
				}
			});
		}
		
		function returnlength(length){
			return length.length;
		}
		
		function bookPage(data, title, author, image, backgroundColor, fontColor){
			/* 플립북 안에 뿌려줄 내용 */
			
			$("#sidebar").empty();
			$("#firstpage").empty();
			$("#secondpage").empty();
			
			var count;
			var sidebarLabel = '';
			var userReviewPageLabel = '';
			var fitstpageLabel = '';
			var secondpageLabel = '';
			/* sidebar */
			sidebarLabel += '<h1>Side Bar</h1>';
			sidebarLabel += '<div>';
			sidebarLabel += '<ul class="nav nav-list">';
			sidebarLabel += '<li><label class="tree-toggle nav-header">차 례</label>';
			sidebarLabel += '<ul class="nav nav-list tree">';
			
			$.each(data, function(i, d){
					/* sidebar */
				/* 사이드바에서 차례를 클릭하면 그 페이지로 넘어감 */
				sidebarLabel += '<li onClick="turnPage('+(i+6)+')">'+d["contents_date"]+'  '+d["contents_time"]+'  '+d["contents_plan"]+'<br>';
				if(d["contents_name"] != 'null'){
					sidebarLabel += '<font size="2">'+d["contents_name"]+'</font>';	
				}
				sidebarLabel += '</li>';
				
			});
			/* sidebar */
			sidebarLabel += '</ul>';
			sidebarLabel += '</li>';
			sidebarLabel += '</ul>';
			sidebarLabel += '</div>';
			
			/* 첫번째 페이지 */
			/* db에서 불러온 데이터로 책 커버를 적용함 */
			if(backgroundColor != 'null'){
				$("#firstpage").css("background-color", backgroundColor);
				fitstpageLabel += '<div style="background-color:'+backgroundColor+';">';
			} else {
				$("#firstpage").css("background-color", "white");
				fitstpageLabel += '<div>';	
			}
			if(fontColor != 'null'){
				fitstpageLabel += '<div style="margin-top:100px; ">';
			} else {
				fitstpageLabel += '<div style="margin-top:100px;">';	
			}
			if(title == 'null'){
				fitstpageLabel += '<h1 style="color:'+fontColor+'">제목</h1><br>';	
			} else {
				fitstpageLabel += '<h1 style="color:'+fontColor+'">'+title+'</h1><br>';
			}
			if(author == 'null'){
				fitstpageLabel += '<p style="color:'+fontColor+'">글쓴이</p>';
			} else {
				fitstpageLabel += '<p style="color:'+fontColor+'">'+author+'</p>';	
			}
			fitstpageLabel += '</div>';
			fitstpageLabel += '<div style="margin-top: 120px;">';
			if(image == 'null'){
				
			} else {
				fitstpageLabel += '<img src="/upload/'+image+'" style="width: 100%; height: 100%;">';	
			}
			fitstpageLabel += '</div>';
			fitstpageLabel += '</div>';
			

			/* 두번째 페이지 */
			secondpageLabel = '<div style="float: left; width: 50%; height: 100%; background-color: orange;"></div>';
			secondpageLabel = '<div style="float: left; width: 50%; height: 100%; background-color: white;"></div>';
		   
			/* 세번째, 네번째 페이지 컬러변경 */
			$("#thirdpage").css("background-color", backgroundColor);
			$("#fourthpage").css("background-color", backgroundColor);
			
			/* db에서 내가 작성한 후기 데이터를 가져와 뿌려줌 */
         	$.each(data, function(i, d){
				userReviewPageLabel += '<div>';
				userReviewPageLabel += '<div>';
				/* db에서 가져온 제목이 null이 아니면 내가 저장한 제목 아니면 그냥 이름을 제목으로 함 */
				if(d["contents_plan"]!=null && d["contents_plan"]!='null' && d["contents_plan"]!=''){
					userReviewPageLabel += '<h3>'+d["contents_plan"]+'</h3>';	
				} else {
					userReviewPageLabel += '<h2>제목</h2>';
				}
				
				userReviewPageLabel += '</div>';
				
				/* db에서 가져온 그림이 없으면 빈공간으로 놔두고 있다면 이미지를 뿌림 */
				if(d["contents_picture"]!=null && d["contents_picture"]!='null' && d["contents_picture"]!=''){
					userReviewPageLabel += '<div>';
					userReviewPageLabel += '<img style="width:96%; height:300px;" src="/upload/'+d["contents_picture"]+'">';	
				} else {
					userReviewPageLabel += '<div>';
					userReviewPageLabel += '<img style="width:96%; height:300px;">';
				}
				var review = d["contents_review"];
				
				/* db에서 가져온 후기가 null이면 textarea만 출력 아니면 textarea에 후기를 출력 */
				if(review !=null && review !='' && review !='null'){
					review = review.replace(/<br>/g, '\n');
					
					userReviewPageLabel += '<div>';
					userReviewPageLabel += '<textarea rows="11" style="width:96%; margin-top:5px; resize:none;" readonly>'+review+'</textarea>';
					userReviewPageLabel += '<div>';
				} else {
					userReviewPageLabel += '<div>';
					userReviewPageLabel += '<textarea rows="11" style="width:96%; margin-top:5px; resize:none;" readonly></textarea>';
					userReviewPageLabel += '<div>';
				}
					
				userReviewPageLabel += '</div>';
				console.log(d["contents_plan"]+"_"+d["contents_picture"]);
				
				/* each문이 한번씩 돌때마다 위에서 뿌려준 데이터를 flipbook function인 addPage를 통해 페이지 추가 */
				var element = $("<div />").html(userReviewPageLabel);
				$("#userReviewPage").turn("addPage", element, (i+6));
				
				count = (i+6);
				
				userReviewPageLabel = '';
			});
         	/* 맨 마지막 페이지는 저작권 관련 페이지 */
         	userReviewPageLabel = '<div class="hard"><img style="width:100%; height:600px;" src="/project/resources/img/dummy1.png"></div>';
         	var element = $("<div />").html(userReviewPageLabel);
         	$("#userReviewPage").turn("addPage", element, (count+1));
         	
			$("#sidebar").append(sidebarLabel);
			$("#firstpage").append(fitstpageLabel);
			$("#secondpage").append(secondpageLabel);
			
			$("#book_modal").modal("show");	
		}
		
		/* 슬롯 데이터를 불러옴 */
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
		
		/* 가져온 슬롯 데이터를 디스플레이 시킴 */
		function slotDisplay(data, id, userId){
			var slot = null;
			console.log(data);
			$("#modal_bookcase_form").empty();
			
			$.each(data, function(i, d){	
				var label = "";
				
				label += '<div class="book-container-block">';
				if(d["sp_backgroundColor"] == null || d["sp_backgroundColor"] == 'null' || d["sp_backgroundColor"] == ''){
					label += '<div class="book-container-bbs" style="background-color:white;"><br>';	
				} else {
					label += '<div class="book-container-bbs" style="background-color:'+d["sp_backgroundColor"]+';"><br>';
				}
				label += '<div style="color:'+d["sp_fontColor"]+'; margin-top: 30px;">';
				
				/* 제목이 비어있지 않을 경우에는 내가 저장한 슬롯이름을, 아닐 경우 제목 이라고 출력 */
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
				
				/* 글쓴이가 비어있지 않을 경우에는 내가 저장한 글쓴이를, 아닐 경우 글쓴이 라고 출력 */
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
				
				/* db에 내가 저장한 그림이 없을 경우 우리가 제공하는 기본 이미지 출력 아닐 경우 db에 있는 이미지 출력 */
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
		
		/* 책 커버를 만들기 위한 function 첫번째 모달 */
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
		
		/* 내가 저장한 이미지를 db에 저장하는 function */
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
					/* 저장이 완료되면 커버페이지로 넘어감 */
					getSlotData(slotId);
				},
				error:function(data){
					alert("에러발생!");
				}
			});
		}
		
		/* 내가 사진으로 업데이트했던 데이터를 가져옴 */
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
		
		/* 최종적으로 내가 만든 커버를 저장하는 function */
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
					/* 슬롯 저장이 완료되면 모달창을 닫는다. */
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
			/* 책으로 만든경우 Y 아닌경우 N*/
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
				/* 불러와진 후기리스트를 누를경우 writeReview에서 내가 누른 데이터들을 갖고
				 * 사진 추가와 후기를 작성할 수 있음
				 * 밑 for문 쪽은 위치를 잡아놓기 위한 div들 
				 *  */
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
				if(d["contents_name"]==null || d["contents_name"]=='null' || d["contents_name"]==''){
					label += '<input class="" style="text-align:center; width:100%; background-color:rgba(0,0,0,0); border:0px;" value="" readonly>';	
				} else {
					label += '<input class="" style="text-align:center; width:100%; background-color:rgba(0,0,0,0); border:0px;" value="'+d["contents_name"]+'" readonly>';
				}
				
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
			/* label += '<button type="button" class="list-input-btn" data-dismiss="modal">끝내기</button>'; */
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
				/* reviewlist폼을 각각 id를 두어서
				   id값과 맞는 textarea와 image를 뿌림
				*/
				$("#reviewlist"+j).hide();
			}
			$("#reviewlist"+i).show();
		}
		
		/* 내가 작성하려는 후기를 누를경우의 function */
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
				alert("이미지는 저장하면 바껴여~~");
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
				addImageLabel += '<div style="text-align:center; background-image: url(\'/project/resources/img/addimage.png\'); width:100%; height:100%; background-size:cover; background-repeat:no-repeat;";>';
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
			if(book == "N"){
				btnLabel = '<button style="margin-top: 25px;" class="review-btn" type="button" onClick="uploadReview('+i+',\''+slotid+'\')">후기 저장하기</button>';
			}
			$("#savereviewbtn").append(btnLabel);
		}
		
		/* image와 textarea를 저장함 */
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
			label += '<div class="" style="width: 50%; height:960px; display:inline-block; float: left; padding-top: 8px;">';
			label += '<input type="text" style="width: 20%" value="날짜" readonly>';
			label += '<input type="text" style="width: 20%" value="시간" readonly>';
			label += '<input type="text" style="width: 60%" value="계획" readonly>';
			
			/* 4 */
			label += '<div class="" style="width: 100% height: auto; margin-top: 10px; border: 0px; margin-bottom: 5px;">';
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
				
				label += '<div class="" style="width: 100%;">';
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
				label += '<button type="button" class="glyphicon glyphicon-tent" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getLeisureMap(\'btn'+i+'\')"></button>';	
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
				label += '<div class="" style="width: 100%;">';
				label += '<div id="mapbtn'+i+'" style="width: 70%; display: inline-block;">';
				label += '<button type="button" style="width: 100%; border: 0px; background-color: white" id="btn'+i+'">';
				label += '&nbsp;</button>';
				label += '</div>';
				label += '<div style="width: 30%; display: inline-block;">';
				label += '<button type="button" class="glyphicon glyphicon-trash bookingbtn" onClick="deleteMap(\''+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-home" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getAccomMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-road" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getRentMap(\'btn'+i+'\')"></button>';
				label += '<button type="button" class="glyphicon glyphicon-tent" style="width: 25%; height:25px; border: 0px; background-color:white;" onClick="getLeisureMap(\'btn'+i+'\')"></button>';	
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
			label += '<div class="" style="width: 50%; height: 960px; display: inline-block; float: left;">';
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
		
		/* 내가 지정한 map을 지울 때 사용함 */
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
		
		/* 내가 계획한 슬롯의 내용들을 저장하는 function */
		function addIndexButton(id, book){
			var label="";
			/* 9 */
			label += '<div class="" align="right">';
			
			if(book == 'N'){
				label += '<button type="button" class="list-input-btn" style="margin-right:20px;" onClick="planSave(\''+id+'\')">저장하기</button>';	
			}			
			/* label += '<button type="button" class="list-input-btn" data-dismiss="modal">끝내기</button>'; */
			
			/* 9- */
			label += '</div>';
			/* 2- */
			label += '</div>';	
			$("#modal_slot_index_form").append(label);
		}
		
		
		/* 여행 계획중 숙소를 누를 경우 숙소의 list를 불러옴 */
		function getAccomMap(btnId){
			var accom = {id : 0};
			accomList(accom, btnId);
		}
		
		/* 여행 계획중 렌트를 누를 경우 렌트의 list를 불러옴 */
		function getRentMap(btnId){
			console.log(btnId);
			var rent = {id : 0};
			rentList(rent, btnId);
		}
		
		/* 여행 계획중 레져를 누를 경우 레져의 list를 불러옴 */
		function getLeisureMap(btnId){
			console.log(btnId);
			var leisure = {id : 0};
			leisureList(leisure, btnId);
		}
			
		/* map에서 내가 원하는 지도의 숙소, 렌트, 레져를 추가할 경우 발생하는 function */
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
			
			if(each == "true"){
				view(info, lat, lng, null, null);
			}
		}
		

		/* 후기 데이터를 책으로 만드는 function */
		function updateReview(id, count){
			var result = confirm("한번 만든 책은 수정이 되지 않습니다 계속하시겠습니까?");
			if(result){
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
		

		/* 슬롯에서 책을 만들었음(N->Y)을 나타내기 위한 function */
		function ajaxSlotUpdateBook(slot){
			$.ajax({
				url : "/project/user/updateBook",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(slot),
				dataType : "json",
				success : function(data) {
					/* alert("슬롯에서 책 만들기 완료"); */
					
				},
				error : function(data) {
					alert("슬롯에서 책 만들기 실패");
				}
			});
		}
		
		/* contents에서 book(N->Y)을 만드는 function */
		function ajaxUpdateBook(contents){
			$.ajax({
				url : "/project/contents/updateBook",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(contents),
				dataType : "json",
				success : function(data) {
					alert("책 만들기 완료");
					$("#slotReviewmodal").modal('hide');
					$("#bbslist").empty();
					/* 책을 만들 경우 modal창을 닫고 bbslist를 초기화 시킨후 새로 list를 불러와 뿌린다. */
					callbbs(0);
				},
				error : function(data) {
					alert("책 만들기 실패");
				}
			});
		}
		
		/* 내 계획을 저장하는 function */
		function planSave(id){
			/* ajax통해서 기존 id값 내용 삭제 */
			var result = confirm("기존 내용이 삭제 됨 저장 할꺼임?");
			/* Y를 선택할 경우 if문 발동 */
			if(result){
				/* 현재 저장되어 있는 db의 값을 모두 날림 */
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
						/* 너무 막 넣으면 db에 insert하다가 사고발생하기 때문에 만든 delay */
						for(var j=0; j<100000000; j++){
							
						}
						/* ajaxinsertplan에서 실질적으로 db의 값을 넣는다. */
						ajaxInsertPlan(id, contents);
						
					}				
				}
				alert("저장 완료!!");
			}
		}
		
		/* 슬롯의 데이터를 모두 날림 */
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
					
				},
				error : function(data) {
					/* alert("삭제할 데이터가 없어 바로 저장함"); */
				}
			});
		}
		
		/* 슬롯의 데이터를 insert 함  */
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
		

		/* plan인지 review인지에 따라 다른 function을 부름
		 * 내가 저장한 plan의 list를 불러오는 function
		 *  */
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
		/* 숙소, 렌트, 레져의 list를 만들어주는 함수 */
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
			//페이지 처리
			pageViewList(listData.length, 1, page);
			
		}
		function viewList(lat, lng, icon, btnId){
			view(content, lat, lng, icon, btnId);
		}
		
		/* 내가 가져온 숙소, 렌트, 레져의 page 처리를 해줌 */
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
		
		/* 내 계획의 page 처리 */
		function pagePlan(i){
			for(var j=0; j<75; j++){
				$("#planList"+j).hide();	
			}
			
			for(var j=((i-1)*15); j<=((i*15)-1); j++){
				$("#planList"+j).show();
			}
		}
		
		/* 내 후기의 page 처리 */
		function pageReview(i){
			for(var j=0; j<75; j++){
				$("#review"+j).hide();
			}
			for(var j=((i-1)*15); j<=((i*15)-1); j++){
				$("#review"+j).show();
			}
		}
		
	
	
	
	