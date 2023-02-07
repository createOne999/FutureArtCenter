<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Tiles Layout Main</title>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		
	</head>
	<body>
		<h1>관리자 로그인</h1>

	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<form method="post" action="/login">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="username" value=""></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" value=""></td>
			</tr>
			<tr>
				<td>아이디 저장</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="submit">로그인</button></td>
			</tr>
			<sec:csrfInput />
		</table>
		
	</form>
	</body>
</html>
