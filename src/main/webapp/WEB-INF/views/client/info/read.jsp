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

#modify_button {
	background-color: #d2b48c;
	margin-top: 50px;
	margin-bottom: 100px;
	font-size: 15px;
	border: none;
	width: 150px;
	padding: 3px; 
	border-radius: 5px;  
       }
       
#userInfo_tb {



}

.td_class {
	width: 150px;
	height: 50px;
	font-size: 15px;
}

.td_value {
	width: 150px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
	
}
</style> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user read info</title>
<!-- 마이페이지 > 회원 정보 -->
</head>
<script>
	// 비밀번호 일치 결과
	var success='${success}';
	if(success==='일치'){
		alert("회원 정보가 변경되었습니다.");
	} 
</script>
<body>
<br>
<form id="readForm" method="get" action="userInfoRead">
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
	<table id="userInfo_tb">
		<tr>
			<td class="td_class">아이디</td>
			<td class="td_value">${user.user_id }</td>
		</tr>
		<tr>
			<td class="td_class">이름</td>
			<td class="td_value">${user.user_name }</td>
		</tr>
		<tr>
			<td class="td_class">생년월일</td>
			<td class="td_value">
			<fmt:formatDate value="${user.user_birth}" pattern="YYYY-MM-dd" type="date" />
			
			</td>
		</tr>
		<tr>
			<td class="td_class">핸드폰번호</td>
			<td class="td_value">${user.user_phone }</td>
		</tr>
		<tr>
			<td class="td_class">SMS 수신 여부</td>
			<td class="td_value">
				<c:if test="${user.agree_SMS eq '0'}">수신</c:if>
				<c:if test="${user.agree_SMS ne '0'}">미수신</c:if>
			</td>
		</tr>
	</table>
	<br>
	<a href="modify"><input type="button" id="modify_button" value="수정"></a>
</form>
</body>
</html>