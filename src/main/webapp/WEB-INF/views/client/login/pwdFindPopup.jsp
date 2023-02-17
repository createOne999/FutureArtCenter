<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password find inputPage</title>

<style>
.form_title {
	background-color: #ccb6a3;
	font-size: 17px;
	font-weight: bold;
	padding: 10px;
	        }
 .form_message {
	font-size: 15px;
	padding: 15px;
	        }

#find_button {
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

</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script type="text/javascript">

function pwdFind(){
	
	// 입력 아이디 
	var user_id=$("#user_id").val(); 
	// 정규식
	var idRegExp = /^[a-z0-9]{4,20}$/; 
	// 아이디 유효성검사
	if (!idRegExp.test(user_id)) {
		alert("[아이디]모든 항목이 올바르게 입력되어야 합니다.");
		return false;
	}
	
	// 입력 이름
	var name = $("#user_name").val();
	// 정규식
	var nameRegExp = /^[a-zA-Z가-힣]{2,5}$/; 
	// 유효성 검사
    if (!nameRegExp.test(name)) {
        alert("[이름]모든 항목이 올바르게 입력되어야 합니다.");
        return false;
    }
	
	// 입력 생년월일
	var birth = $("#user_birth").val();
	// 정규식
    var birthRegExp = /^(1|2)(\d{7})$/; 
	// 생년월일 유효성 검사
    if (!birthRegExp.test(birth)) {
        alert("[생년월일]모든 항목이 올바르게 입력되어야 합니다.");
        return false;
    }
	
	// 입력 핸드폰번호
	var phone = $("#user_phone").val();
	// 정규식
    var phoneRegExp = /^(01)(\d{9})$/; 
	// 유효성검사
    if (!phoneRegExp.test(phone)) {
        alert("[핸드폰번호]모든 항목이 올바르게 입력되어야 합니다.");
        return false;
    }
		$("#pwdFindform").submit();
		 
}
</script>
<body>
	<form id="pwdFindform" method="post" action="userPwdFind">
	<div class="form_title">
		비밀번호 찾기
	</div>
	<div class="form_message">
		회원님의 정보를 입력하세요
	</div>
	<div align="center">
	<table>
	<tr>
		<td>아이디</td>	
		<td><input type="text"  id="user_id" name="user_id" maxlength="20"></td>
	</tr>
	<tr>
		<td>이름</td>	
		<td><input type="text"  id="user_name" name="user_name" maxlength="5" ></td>
	</tr>
	<tr>
		<td>생년월일</td>	
		<td><input type="text" id="user_birth" name="user_birth" placeholder="예)20230101" maxlength="8"></td>
	</tr>
	<tr>
		<td>핸드폰번호</td>
		<td><input type="text" id="user_phone" name="user_phone" placeholder="예)01012345678" maxlength="11"></td>
	</tr>
	</table>
	<br>
	<input type="button" id="find_button" value="찾기" onclick="pwdFind()">
	</div>
	</form>
</body>
</html>