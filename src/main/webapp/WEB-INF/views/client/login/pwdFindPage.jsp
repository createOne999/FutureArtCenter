<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password find result</title>
<style>
.form_title {
	background-color: #ccb6a3;
	font-size: 17px;
	font-weight: bold;
	padding: 10px;
	        }
	        
#close_button {
	background-color: #ccb6a3;
	margin-bottom: 10px;
	color: black;
	font-size: 15px;
	border: none;
	width: 100px;
    padding: 3px;   
    border-radius: 5px;  
        }

</style>
<script type="text/javascript">
function func(){
	window.close();
}
</script>
</head>
<body>
	<div class="form_title">
	비밀번호 찾기
	</div>
	<div align="center">
	<br><br><br>
	회원님의 비밀번호가 <strong>password0!</strong> 으로 초기화되었습니다.
	<br><br><br><br>
		<input type="button" id="close_button" value="닫기" onclick="func()">
	</div>
</body>
</html>