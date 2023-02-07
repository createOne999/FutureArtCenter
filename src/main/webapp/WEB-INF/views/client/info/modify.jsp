<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user info modify</title>
<!-- 마이페이지 > 회원 정보 > 회원 정보 수정 -->
<script type="text/javascript">

function func(){
	
// 수정 정보 유효성 검사
	// 입력 비밀번호
	var pwd = $("#user_pwd").val(); 
	// 정규식
	var pwdRegExp = /^[a-zA-z0-9!@#$%^&*]{8,20}$/; 
	// 비밀번호 유효성검사
	if (!pwdRegExp.test(pwd)) {
        alert("[현재 비밀번호]정보가 바르게 입력되지 않았습니다.");
        modifyForm.user_pwd.focus();
        return false;
    }

	// 변경 비밀번호(변경 시)
	var pwdChange = $("#user_pwdChange").val();
	// 비밀번호 확인(변경 시)
	var pwdCheck = $("#user_pwdCheck").val();
	
	if (pwdChange != "") {
		if (!pwdRegExp.test(pwdChange)) {
	        alert("[변경 비밀번호]정보가 바르게 입력되지 않았습니다.");
	        modifyForm.user_pwdChange.focus();
	        return false;
	    }
		
		if (pwdChange != pwdCheck) {
	        alert("[비밀번호 확인]정보가 바르게 입력되지 않았습니다.");
	        modifyForm.user_pwdCheck.focus();
	        return false;
	    }
	}
	
	// 입력 핸드폰번호
	var name = $("#user_name").val();
	// 정규식
    var nameRegExp = /^[a-zA-Z가-힣]{2,5}$/; 
	// 유효성검사
    if (!nameRegExp.test(name)) {
        alert("[이름]정보가 바르게 입력되지 않았습니다.");
        modifyForm.user_name.focus();
        return false;
    }
	
	// 입력 핸드폰번호
	var phone = $("#user_phone").val();
	// 정규식
    var phoneRegExp = /^(01)(\d{9})$/; 
	// 유효성검사
    if (!phoneRegExp.test(phone)) {
        alert("[핸드폰번호]정보가 바르게 입력되지 않았습니다.");
        modifyForm.user_phone.focus();
        return false;
    }
	
	// 회원 정보 수정 처리
	modifyForm.submit();
	//alert("회원 정보가 변경되었습니다.");
}
</script>
<script>
	// 비밀번호 일치 결과
	var success='${success}';
	if(success==='일치'){
		alert("회원 정보가 변경되었습니다.");
	} 
</script>
<script>
	// 비밀번호 불일치 결과
	var fail='${fail}';
	if(fail==='불일치'){
		alert("비밀번호가 일치하지 않습니다.");
	}
</script>
</head>
<body>
<form id="modifyForm" method="post" action="userInfoModify">
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
	<div align="center"><h3>&nbsp;&nbsp;&nbsp;회원 정보 수정</h3></div>
	<table border="1">
		<tr>
			<td width="300">아이디</td>
			<td width="300">${user.user_id }</td>
		</tr>
		<tr>
			<td>현재 비밀번호 (필수입력)</td>
			<td>
			<input type="password" id="user_pwd" name="user_pwd" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td>변경 비밀번호 (변경 시)</td>
			<td>
			<input type="password" id="user_pwdChange" name="user_pwdChange" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인 (변경 시)</td>
			<td>
			<input type="password" id="user_pwdCheck" name="user_pwdCheck" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
			<input type="text" id="user_name" name="user_name" 
			value="${user.user_name }" maxlength="5" required >
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
			<fmt:formatDate value="${user.user_birth}" pattern="YYYY-MM-dd" type="date" />
			</td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>
			<input type="text" id="user_phone" name="user_phone" 
			value="${user.user_phone }" maxlength="11" required >
			</td>
		</tr>
		<tr>
			<td><label for="agree_SMS">마케팅 목적 SMS 수신 여부 (선택) </label>
			<td>
			<input type="radio" name="agree_SMS" value=0 <c:if test="${user.agree_SMS eq '0'}">checked</c:if>>수신
			<input type="radio" name="agree_SMS" value=1 <c:if test="${user.agree_SMS ne '0'}">checked</c:if>>미수신	
			</td>
		</tr>
	</table>
	<br>
	<input type="button" value="저장" onclick="func()">
	</div>
</form>
</body>
</html>