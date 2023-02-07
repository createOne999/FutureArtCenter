<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<form id="readForm" method="get" action="userInfoRead">
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
	<table border="1">
		<tr>
			<td width="200">아이디</td>
			<td width="200">${user.user_id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${user.user_name }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
			<fmt:formatDate value="${user.user_birth}" pattern="YYYY-MM-dd" type="date" />
			
			</td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>${user.user_phone }</td>
		</tr>
		<tr>
			<td>SMS 수신 여부</td>
			<td>
				<c:if test="${user.agree_SMS eq '0'}">수신</c:if>
				<c:if test="${user.agree_SMS ne '0'}">미수신</c:if>
			</td>
		</tr>
	</table>
	<br>
	<a href="modify"><input type="button" value="수정"></a>
	</div>
</form>
</body>
</html>