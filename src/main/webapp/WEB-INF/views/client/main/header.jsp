<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div align="center">
	<table>
		<tr>

			<!-- 로그인 하지 않은 상태 -->
			<c:if test = "${user == null }">
			<a href="/login/loginForm">로그인</a>
			&nbsp;&nbsp;&nbsp;<a href="/user/agreement">회원가입</a>
			</c:if>
			
			<!-- 로그인한 상태 -->
			<c:if test = "${user != null }">
			<strong>( ${user.user_id } )</strong>
			&nbsp;&nbsp;&nbsp;<a href="/login/logout.do">로그아웃</a>
			&nbsp;&nbsp;&nbsp;<a href="/info/ticketinglist">마이페이지</a>
			</c:if>

		</tr>
	</table>
</div>