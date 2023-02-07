<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id find result</title>
<script type="text/javascript">
function func(){
	window.close();
}
</script>
</head>
<body>
	<h3>아이디 찾기</h3>
	회원님의 아이디는 <strong>${userId}</strong> 입니다.
	<br><br><br>
	<div align="center">
		<input type="button" value="닫기" onclick="func()">
	</div>
</body>
</html>