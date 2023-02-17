<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user id or password find result - none</title>

<style>

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
	<div align="center">
	<br><br>
	<h4>일치하는 회원정보가 없습니다.</h4>
	<br><br>	
	<input type="button" id="close_button" value="닫기" onclick="func()">
	</div>
</body>
</html>