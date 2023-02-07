<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user delete</title>
<!-- 마이페이지 > 회원 탈퇴 -->
</head>
<script type="text/javascript">

// 탈퇴 버튼 클릭
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
	
	/* 
	 // 비밀번호 확인
	$.ajax({
			type : "get",
			url  : "/info/pwdCheck",
			data : {pwdInput:pwdInput},
			success : function(data){
				if(data == 0){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				} else {
					alert("탈퇴 처리 되었습니다.");
					
				}
			}
		}) 
	 */
	 
	 <c:if test = "${result == 0 }">
	    alert("111111.");
	    </c:if>
	    
	 deleteForm.submit();
	
	<c:if test = "${result == 0 }">
    alert("2222222.");
    </c:if>
    
    document.location.href = "/main";
		
}
</script>
<body>
<form id="deleteForm" method="POST" action="userOut">
	<div align="left"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
	<div>
	<table border="1">
		<tr align="center">
			<td width="150"><a href="ticketinglist">예매 내역</a></td>
			<td width="150"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td width="150"><a href="read">회원 정보</a></td>
			<td width="150"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
	<br><br>
	<table>
		<tr>
			<td width="500">회원 탈퇴를 위하여</td>
		</tr>
		<tr>
			<td>비밀번호를 올바르게 기입해주세요</td>
		</tr>
	</table>
	<br>
	<div>
	<input type="password" id="pwdInput" name="pwdInput" 
	placeholder="비밀번호 입력" maxlength="20">
	</div>
	<div>
	<br>
	<input type="button" value="탈퇴" onclick="func()">
	</div>
	</div>
</form>
</body>
</html>