<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#map {
	height: 400px;
	width: 100%;
      }
</style>
<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 주소를 가져오는 구글맵 api 키값 -->
</head>
<body>
	<h1>testMap</h1>
	<input type="time">
	<div class="container">
		<button class="btn btn-primary" data-toggle="modal" data-backdrop="static"
			data-target="#mapModal" id="modal">맵띄우기</button>
		<div class="row">
			<div class="modal fade" tabindex="-1" id="mapModal" role="dialog"
				aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<button class="btn btn-primary" id="btn_accom" name="btn_accom">숙소</button>
    	              	<button class="btn btn-primary" id="btn_rent" name="btn_rent">렌트</button>
	                  	<button class="btn btn-primary" id="btn_leisure" name="btn_trip">여행지</button>
						<div class="modal-body">
							<form id="modal_map"></form>
							<form id="modal_map_text"></form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/project/resources/js/jquery.min.js"></script>
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<!-- 위도경도를 입력해서 지도에 뿌려주는 구글맵 api 키값 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDs-T1EEykIfdXaJaB5ML6HYsddRZ5BD4U"></script>
	<script type="text/javascript">
	var view;
	var aaa;
		function add(vo, name, desc, number, addr, lat, lng, image, icon){
			console.log(name+","+desc+","+number+","+addr+","+lat+","+lng);
			console.log("json위"+vo);
			/* data = JSON.stringify(data); */
			/* console.log("json아래"+data); */
			/* $.each(data, function(i, d){
				console.log(d["name"]);
			}); */
			$("#modal_map_text").append(
				'<div>'+
					'<button type="button" onClick="view('+null+','+lat+','+lng+',\''+null+'\')">'+name+","+number+'</button>'+
					/* '<button type="button" onClick="aaa(\''+name+'\')">'+name+","+desc+","+number+","+addr+'</button>'+ */
				'</div>'
			);
		}
		
		$(function() {
			$("#modal").click(function() {
				$("#modal_map").empty();
				$("#modal_map").append(
					'<div id="map"></div>'
				);
			});
			
			$("#btn_accom").click(function(){
				var accom = {id : 0};
				ajaxGetAccom(accom);
			});
			
			$("#btn_rent").click(function(){
				var rent = {id : 0};
				ajaxGetRent(rent);
			});
			
			$("#btn_leisure").click(function(){
				var leisure = {id : 0};
				ajaxGetLeisure(leisure);
			})
			
			function ajaxGetAccom(accom){
				$.ajax({
					url : "/project/owner/getListAccom",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(accom),
					dataType : "json",
					success : function(data) {
						console.log("성공 : "+data);
						view(data, 33.51041350000001, 126.4913534, "https://github.com/woo289/memory/blob/master/hotel.png?raw=true");
					},
					error : function(data) {
						console.log("실패 : "+data);					
					}
				});
			}
			
			function ajaxGetRent(rent){
				$.ajax({
					url : "/project/owner/getListRent",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(rent),
					dataType : "json",
					success : function(data) {
						console.log("성공 : "+data);
						view(data, 33.51041350000001, 126.4913534, "https://github.com/woo289/memory/blob/master/car.png?raw=true");
					},
					error : function(data) {
						console.log("실패 : "+data);					
					}
				});
			}
			
			function ajaxGetLeisure(leisure){
				$.ajax({
					url : "/project/owner/getListLeisure",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(leisure),
					dataType : "json",
					success : function(data) {
						console.log("성공 : "+data);
						view(data, 33.51041350000001, 126.4913534, "https://github.com/woo289/memory/blob/master/ha.png?raw=true");
					},
					error : function(data) {
						console.log("실패 : "+data);					
					}
				});
			}
						
			view = function viewMap(value, lat, lng, icon){
				/* console.log("viewMap바로 밑"+value); */
				//console.log("viewMap바로 밑"+value, lat, lng, icon);
				function initmap(data) {
					/* console.log(data); */
					//좌표 이미지를 표시하는 MarkerImage
					//마커 이미지는 경로 이미지 지정으로 쓰면 못찾음. 인터넷 페이지로 등록된 이미지만 사용가능.	
					//위도 경도 표시 (처음 화면 좌표 지정)
					var wplatlng = new google.maps.LatLng(lat, lng);
					var wpOptions = {
						zoom : 15, // 지도 zoom단계
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
					if(data == null){
						var marker = new google.maps.Marker({
							position : new google.maps.LatLng(lat, lng),
							map : map 
						});
					} else {
						$.each(data, function(i, d){
							var desc = "";
							desc += '<div id="content">';
							desc += '<h2>'+d["name"]+'</h2>';
							desc += '<img width="200px" height="200px" src="/upload/'+d["image"]+'">';
							desc += '<h4>'+d["desc"]+'</h4>';
							desc += '<h4>'+d["number"]+'</h4>';
							desc += '<h4>'+d["addr"]+'</h4>';
							desc += '<button type="button" onClick="add(\''+vo+'\',\''+d["name"]+'\',\''
									+d["desc"]+'\',\''+d["number"]+'\',\''+d["addr"]+'\',\''+d["lat"]+'\',\''+d["lng"]+'\',\''+d["image"]+'\',\''+icon+'\')">추가</button>';
							desc += '</div>';
							
							var marker = new google.maps.Marker({
								position : new google.maps.LatLng(d["lat"], d["lng"]),
								icon : accomIcon,
								map : map,
								title : d["name"],
								snippert : desc 
							});
																		
							google.maps.event.addListener(marker, "click", function(){
								var infowindow = new google.maps.InfoWindow({
									content : desc
								});
								infowindow.close();
								infowindow.open(marker.get("map"), marker);
							});
						});
					}
				}
				//value=value+1;
				//console.log("initmap들어가기 직전"+value);
				var initmap = initmap(value);
				setTimeout(function() {
					google.maps.event.addDomListener(window, 'load', initmap);
				}, 3000);
			}
		});
	</script>	
</body>
</html>