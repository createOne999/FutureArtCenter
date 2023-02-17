<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user delete</title>

<style>
#mypage {
	font-size: 15px;
	margin-left: 50px;
	border-collapse: collapse;
	  
}

#title {
	padding-right: 200px;
	font-size: 20px;
	font-weight: bold;
}

#checked {
	background-color: #f0e68c;
	padding: 10px 70px 10px 70px;
	font-weight: bold;
	border: solid 1px #d2b48c;
}

#td {
	background-color: #f0e68c;
	padding: 10px 70px 10px 70px;
	border: solid 1px #d2b48c;
}

input {
	font-size: 14px;
	padding: 5px;
	border: solid 1px #ccc;
}

#out_button {
	background-color: #d2b48c;
	margin-top: 50px;
	margin-bottom: 100px;
	font-size: 15px;
	border: none;
	width: 150px;
	padding: 3px; 
	border-radius: 5px;   
       }
</style>       


<!-- 마이페이지 > 회원 탈퇴 -->
</head>
<script type="text/javascript">
function func(){
	
	// 입력 비밀번호
	var pwdInput = $("#pwdInput").val(); 
	// 정규식
	var pwdRegExp = /^[a-zA-z0-9!@#$%^&*]{8,20}$/;
	
	if (!pwdRegExp.test(pwdInput)) {
		alert("비밀번호가 일치하지 않습니다.");
		deleteForm.pwdInput.value = "";
		deleteForm.pwdInput.focus();
        return false;
    }
	
		deleteForm.submit();
}
</script>
<script>
	// 비밀번호 불일치 결과
	var fail='${fail}';
	if(fail==='불일치'){
		alert("비밀번호가 일치하지 않습니다.");
	} 
</script>
<script>
	// 비밀번호 불일치 결과
	var fail='${fail}';
	if(fail==='불가'){
		alert("회원님의 관람 가능한 예매 내역이 존재하여 탈퇴할 수 없습니다.");
	} 
</script>
<body>
<form id="deleteForm" method="POST" action="userOut">
<br>
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="td"><a href="ticketinglist">예매 내역</a></td>
			<td id="td"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td id="td"><a href="read">회원 정보</a></td>
			<td id="checked"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
</div>
	<br><br><br>
	회원 탈퇴를 위하여 비밀번호를 올바르게 기입해주세요
	<br><br><br>
	<div>
	<input type="password" id="pwdInput" name="pwdInput" 
	placeholder="비밀번호 입력" maxlength="20">
	</div>
	<div>
	
	<input type="button" id="out_button" value="탈퇴" onclick="func()">
	</div>
	</div>
</form>
</body>
</html>