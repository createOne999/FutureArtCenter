<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>ticket read concert</title>
<!-- 마이페이지 예매 내역 > 콘서트 티켓 보기 -->
</head>
<body>
<form id="concertTicketForm" method="get" action="concertTicketRead">
	<div align="left"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
	<table border="5">
		<tr align="center">
			<td width="150"><a href="ticketinglist">예매 내역</a></td>
			<td width="150"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td width="150"><a href="read">회원 정보</a></td>
			<td width="150"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
	<br><br>
	<div>
		<table border="1">
			<tr>
				<td rowspan="5">${concertTicket.SHOW_POSTER }</td>
				<td>티켓번호</td>
				<td>${concertTicket.TICKETING_CODE1 }</td>
			</tr>
			<tr>
				<td>공연명</td>
				<td>${concertTicket.SHOW_NAME }</td>
			</tr>
			<tr>
				<td>공연일</td>
				<td><fmt:formatDate value="${concertTicket.SHOW_DATE }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>공연관 / 좌석</td>
				<td>2관 / ${concertTicket.TICKETING_SIT1 }</td>
			</tr>
			<tr>
				<td>회차 / 시작시간, 종료시간</td>
				<td>${concertTicket.TICKETING_ROUND }회차 / 
					<c:if test="${concertTicket.TICKETING_ROUND == 1 }">
					${concertTicket.SHOW_TIME1 }
					</c:if>
					<c:if test="${concertTicket.TICKETING_ROUND == 2 }">
					${concertTicket.SHOW_TIME2 }
					</c:if>
				</td>
			</tr>
		</table>
		
<!-- 티켓번호 2 존재할 경우 -->
	<c:if test="${concertTicket.TICKETING_CODE2 != NULL }">		
		<table border="1">
			<tr>
				<td rowspan="5">${concertTicket.SHOW_POSTER }</td>
				<td>티켓번호</td>
				<td>${concertTicket.TICKETING_CODE2 }</td>
			</tr>
			<tr>
				<td>공연명</td>
				<td>${concertTicket.SHOW_NAME }</td>
			</tr>
			<tr>
				<td>공연일</td>
				<td><fmt:formatDate value="${concertTicket.SHOW_DATE }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>공연관 / 좌석</td>
				<td>2관 / ${concertTicket.TICKETING_SIT2 }</td>
			</tr>
			<tr>
				<td>회차 / 시작시간, 종료시간</td>
				<td>${concertTicket.TICKETING_ROUND }회차 / 
					<c:if test="${concertTicket.TICKETING_ROUND == 1 }">
					${concertTicket.SHOW_TIME1 }
					</c:if>
					<c:if test="${concertTicket.TICKETING_ROUND == 2 }">
					${concertTicket.SHOW_TIME2 }
					</c:if>
				</td>
			</tr>
		</table>
	</c:if>
	</div>
	<br><br>
	<!-- 확인 버튼 클릭 시 예매내역으로 돌아감 -->
	<div>
		<a href="ticketinglist">
		<input type="button" value="확인"></a>
	</div>
</form>
</body>
