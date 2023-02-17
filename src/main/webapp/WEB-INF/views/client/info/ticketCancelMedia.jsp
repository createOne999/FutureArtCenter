<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketCancelMedia</title>

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

#button {
	background-color: #d2b48c;
	margin-top: 50px;
	margin-bottom: 100px;
	font-size: 15px;
	border: none;
	width: 200px;
	padding: 3px; 
	border-radius: 5px;   
       }
</style>

<!-- 마이페이지 > 미디어 예매 취소 -->
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
	
	ticketCancelForm.submit();
}
</script>


<body>
<form id="ticketCancelForm" method="POST" action="ticketCancelMedia">
<br>
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="td"><a href="ticketinglist">예매 내역</a></td>
			<td id="td"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td id="td"><a href="read">회원 정보</a></td>
			<td id="td"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
</div>
<br><br><br><br>
			[ 미디어 공연 ] 예매번호 : ${mediaTicketNo }<br><br>
			예매 취소를 위하여 비밀번호를 올바르게 기입해주세요
<br><br><br>
		<input type="hidden" name="ticketing_no" value="${mediaTicketNo }">
		<input type="password" id="pwdInput" name="pwdInput" placeholder="비밀번호 입력" maxlength="20">
<br>
		<input type="button" id="button" value="예매 취소하기" onclick="func()">
		<a href="ticketinglist">
		<input type="button" id="button" value="돌아가기"></a>
</form>
</body>
</html>