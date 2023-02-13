<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketCancelTalk</title>
<!-- 마이페이지 > 강연 예매 취소 -->
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
<form id="ticketCancelForm" method="POST" action="ticketCancelTalk">
	<div align="left"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
	<div>
	<table border="5">
		<tr align="center">
			<td width="150"><a href="ticketinglist">예매 내역</a></td>
			<td width="150"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td width="150"><a href="read">회원 정보</a></td>
			<td width="150"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
	<br><br>
	<table>
		<tr><td>
			[ 강연 공연 ] 예매번호 : ${talkTicketNo }<p>
			예매 취소를 위하여<br>
			비밀번호를 올바르게 기입해주세요
		</td></tr>
	</table>
	
	<div>
		<input type="hidden" name="ticketing_no" value="${talkTicketNo }">
		<input type="password" id="pwdInput" name="pwdInput" placeholder="비밀번호 입력" maxlength="20">
	</div>
	<div>
	<br>
		<input type="button" value="예매 취소하기" onclick="func()">
		<a href="ticketinglist">
		<input type="button" value="취소"></a>
	</div>
	</div>
</form>
</body>
</html>