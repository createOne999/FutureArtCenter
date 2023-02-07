<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home test</title>
</head>
<script>
	// 회원 탈퇴 결과
	var out='${out}';
	if(out==='탈퇴'){
		alert("회원 탈퇴 되었습니다.");
	} 
</script>
<script>
	// 회원 탈퇴 결과
	var success='${success}';
	if(success==='일치'){
		alert("회원 정보가 수정되었습니다.");
	} 
</script>
<body>
	<h1>Future Art Center 에 오신것을 환영합니다.</h1>
	<p>${serverTime }</p>
	
</body>
</html>