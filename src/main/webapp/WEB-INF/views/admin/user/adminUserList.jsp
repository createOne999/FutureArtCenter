<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.content{
				margin-top: 50px;
			}
			
			.sub-header{
				font-size: 20px;
			}
			
			table{
				margin-top: 10px;
			}
		</style>
	</head>
	<body>
		<div class="content">
			<div class="title">
				<p class="sub-header">가입 회원 정보</p>
			</div>
			<table border="1">
				<tr>
					<th class="tac">회원번호</th>
					<th class="tac">아이디</th>
					<th class="tac">이름</th>
					<th class="tac">생년월일</th>
					<th class="tac">핸드폰 번호</th>
					<th class="tac">회원 가입일</th>
				</tr>
				
				<c:forEach var="UserVO" items="${member_list}">
					<tr>
						<td>${UserVO.user_no}</td>
						<td>${UserVO.user_id}</td>
						<td>${UserVO.user_name}</td>
						<td><fmt:formatDate value="${UserVO.user_birth}" pattern="YYYY-MM-dd" type="date" /></td>
						<td>${UserVO.user_phone}</td>
						<td><fmt:formatDate value="${UserVO.user_regdate}" pattern="YYYY-MM-dd" type="date" /></td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="title">
				<p class="sub-header">탈퇴 회원 정보</p>
			</div>
			<table border="1">
				<tr>
					<th class="tac">회원번호</th>
					<th class="tac">아이디</th>
					<th class="tac">이름</th>
					<th class="tac">생년월일</th>
					<th class="tac">핸드폰 번호</th>
					<th class="tac">회원 가입일</th>
					<th class="tac">회원 탈퇴일</th>
				</tr>
				<c:forEach var="UserVO" items="${member_out_list}">
					<tr>
						<td>${UserVO.user_no}</td>
						<td>${UserVO.user_id}</td>
						<td>${UserVO.user_name}</td>
						<td><fmt:formatDate value="${UserVO.user_birth}" pattern="YYYY-MM-dd" type="date" /></td>
						<td>${UserVO.user_phone}</td>
						<td><fmt:formatDate value="${UserVO.user_regdate}" pattern="YYYY-MM-dd" type="date" /></td>
						<td><fmt:formatDate value="${UserVO.user_outdate}" pattern="YYYY-MM-dd" type="date" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>