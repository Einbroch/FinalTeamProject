<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/project/resources/css/farbtastic.css">
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<form action="" style="width: 500px;">
	  <div id="picker" style="float: left;"></div>
	  <div style="background-color: #ff00ff; padding:6%; width: 100%; height: 110px;"><label for="color1">글자 :</label><input type="text" id="color1" name="color1" class="colorwell" value="#ffffff" autofocus="autofocus"/>
	  
	  <button type="button" id="font_btn">적용하기</button></div>
	  <div style="background-color: #cf2f2f; padding:6%; width: 100%; height: 110px;"><label for="color2">배경 :</label><input type="text" id="color2" name="color2" class="colorwell" value="#000000" />
	  <button type="button" id="bg_btn">적용하기</button></div>
		<div id="cover" align="center">
			<h1 id="title">제목</h1>
			<div style="width: 100%; height: 300px; vertical-align: middle;" align="center">
				<img  src="/project/resources/img/logo.png">
			</div>
			<h1 id="author" style="color: '#f5f5f5'">글쓴이</h1>
		</div>  
		<h1 style="color: #ff0000;">씨ㅏㅂㄹ</h1>
		<div style="background-color: #00ff00">
			<h1 style="color: #ff0000;">씨ㅏㅂㄹ</h1>
		</div>
	</form>
	
	
	<form id="fileForm" action="fileUpload" method="post"
        enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/><br/><br/>
          
	        아이디 : <input type="text" name="id" />
      	  비밀번호 : <input type="password" name="pw" /><br/><br/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
    </form>
    
        
	<!-- jQuery -->
	<script src="/project/resources/js/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/farbtastic.js"></script>
	
	<script type="text/javascript">
		$(function(){
			var color = "#05ff00";
			$("#font_btn").click(function(){
				$("#title").css("color", $("#color1").val());	
				$("#author").css("color", $("#color1").val());
			});
			$("#bg_btn").click(function(){
				$("#cover").css("background-color", $("#color2").val());	
			});
					
		}); 
		
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
		
		function fileSubmit() {
	        var formData = new FormData($("#fileForm")[0]);
	        $.ajax({
	            type : 'post',
	            url : '/project/user/addSlot',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(html) {
	                alert("파일 업로드하였습니다.");
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
	    }
	
	</script>
</body>
</html>