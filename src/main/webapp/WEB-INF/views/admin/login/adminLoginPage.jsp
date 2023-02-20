<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>FutureArtCenter</title>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/css/login/adminLoginPage.css">
		<script type="text/javascript">
			$("#loginBtn").click(function(){
				if (!$("#adminId").val()) {
					alert("아이디를 입력해주세요");
					return false;
				}
				
				if (!$("#adminPwd").val()) {
					alert("비밀번호를 입력해주세요");
					return false;
				}
				
				$("#admin_login").attr("action", "admin/loginPage");
				$("#admin_login").submit();
			})
			
			<c:if test = "${fail == 0 }">
		    	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
		    </c:if>
		</script>
	</head>
	<body>
		<header>
			<div class="header_main">
				<div class="logo">
					<img src="/image/logo.png">
					<h2>FutureArtCenter</h2>
				</div>
			</div>
		</header>
		<div id="main_body">
			<p class="login">관리자 로그인</p>
			<form:form id="admin_login" method="post">
				<table>
					<tr id="id">
						<td>아이디</td>
					</tr>
					<tr>
						<td><input type="text" name="adminId" id="adminId" placeholder="ID"></td>
					</tr>
					
					<tr id="pwd">
						<td>비밀번호</td>
					</tr>
					<tr>
						<td><input type="password" name="adminPwd" id="adminPwd" placeholder="PASSWORD"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><button type="submit" id="loginBtn">로그인</button></td>
					</tr>
				</table>
			</form:form>
		</div>
	</body>
</html>
