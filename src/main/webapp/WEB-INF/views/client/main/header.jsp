<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="nav justify-content-end">
	<c:if test="${user == null }">
		<li class="nav-item">
			<a class="nav-link" href="/login/loginForm">로그인</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/user/agreement">회원가입</a>
		</li>
	</c:if>
	<c:if test="${user != null }">
		<strong>( ${user.user_id } )</strong>
		<li class="nav-item">
			<a class="nav-link" href="/login/logout.do">로그아웃</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/info/ticketinglist">마이페이지</a>
		</li>
	</c:if>
</ul>