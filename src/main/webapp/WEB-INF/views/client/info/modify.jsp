<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

#save_button {
	background-color: #d2b48c;
	margin-top: 50px;
	margin-bottom: 100px;
	font-size: 15px;
	border: none;
	width: 150px;
	padding: 3px; 
	border-radius: 5px;  
}

#userModify_tb {
	margin-top: 30px;
}

.td_class {
	height: 40px;
	width: 250px;
	font-size: 15px;
}

.td_value {
	width: 300px;
	font-size: 16px;
}

 input {
	padding: 4px;
	font-size: 14px;
	border: solid 1px #bc8f8f;
	border-radius: 5px;
	width:250px;
} 

#radio {
	width:50px;
}      
       
</style> 
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
<br>
<form id="modifyForm" method="post" action="userInfoModify">
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="td"><a href="ticketinglist">예매 내역</a></td>
			<td id="td"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td id="checked"><a href="read">회원 정보</a></td>
			<td id="td"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
</div>
	<br><br>
	<div align="center"><h3>&nbsp;&nbsp;&nbsp;회원 정보 수정</h3></div>
	<table id="userModify_tb">
		<tr>
			<td class="td_class">아이디</td>
			<td class="td_value">${user.user_id }</td>
		</tr>
		<tr>
			<td class="td_class">현재 비밀번호 (필수입력)</td>
			<td class="td_value">
			<input type="password" id="user_pwd" name="user_pwd" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td class="td_class">변경 비밀번호 (변경 시)</td>
			<td class="td_value">
			<input type="password" id="user_pwdChange" name="user_pwdChange" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td class="td_class">비밀번호 확인 (변경 시)</td>
			<td class="td_value">
			<input type="password" id="user_pwdCheck" name="user_pwdCheck" 
			maxlength="20" placeholder="영문대소문자,숫자,!@#$%^&* 8-20자" required >
			</td>
		</tr>
		<tr>
			<td class="td_class">이름</td>
			<td class="td_value">
			<input type="text" id="user_name" name="user_name" 
			value="${user.user_name }" maxlength="5" required >
			</td>
		</tr>
		<tr>
			<td class="td_class">생년월일</td>
			<td class="td_value">
			<fmt:formatDate value="${user.user_birth}" pattern="YYYY-MM-dd" type="date" />
			</td>
		</tr>
		<tr>
			<td class="td_class">핸드폰번호</td>
			<td class="td_value">
			<input type="text" id="user_phone" name="user_phone" 
			value="${user.user_phone }" maxlength="11" required >
			</td>
		</tr>
		<tr>
			<td class="td_class"><label for="agree_SMS">마케팅 목적 SMS 수신 여부 (선택) </label>
			<td class="td_value">
			<input type="radio" id="radio" name="agree_SMS" value=0 <c:if test="${user.agree_SMS eq '0'}">checked</c:if>>수신
			<input type="radio" id="radio" name="agree_SMS" value=1 <c:if test="${user.agree_SMS ne '0'}">checked</c:if>>미수신	
			</td>
		</tr>
	</table>
	<br>
	<input type="button" id="save_button" value="저장" onclick="func()">
	</div>
</form>
</body>
</html>