<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<form>
		<h1>글자 색상을 입력하세요</h1>
		<input class="jscolor">
		
	</form>
	<form id="fileForm" action="fileUpload" method="post"
        enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/><br/><br/>
          
	        아이디 : <input type="text" name="id" />
      	  비밀번호 : <input type="password" name="pw" /><br/><br/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
    </form>
    <div align="left">
    
    </div>
    <table border="1">
    	<tr>
    		<td>
    		</td>
    	</tr>
    </table>
    
	<!-- jQuery -->
	<script src="/project/resources/js/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/project/resources/js/bootstrap.min.js"></script>
	<script src="/project/resources/js/jscolor.js"></script>
	<script type="text/javascript">
	
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