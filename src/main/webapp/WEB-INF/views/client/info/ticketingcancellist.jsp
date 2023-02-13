<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing cancel list</title>
<!-- 마이페이지 > 예매 취소 내역 -->
</head>
<script>
	// 예매 취소 결과 메시지
	var success='${success}';
	if(success==='일치'){
		alert("예매 취소 완료");
		location.href("ticketingcancellist");
	} 
</script>
<body>
	<div align="left"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
	<div align="center" id="info_tab">
	<table border="5">
		<tr align="center">
			<td width="150"><a href="ticketinglist">예매 내역</a></td>
			<td width="150"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td width="150"><a href="read">회원 정보</a></td>
			<td width="150"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
	</div>
	<br><br>
	<div>
		<table border="1">
		<tr>
			<td>예매일</td>
			<td>공연명</td>
			<td>공연일</td>
			<td>공연 회차(시작시간,종료시간)</td>
			<td>매수</td>
			<td>결제수단</td>
			<td>결제금액</td>
			<td>예매상태</td>
			<td>취소일</td>
			<td>환불금액</td>
		</tr>
			<!-- 콘서트 예매 취소 내역 -->
			<c:forEach items="${concertCancelList }" var="concert">
			<tr>
				<td><fmt:formatDate value="${concert.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${concert.SHOW_NAME }</td>
				<td><fmt:formatDate value="${concert.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${concert.TICKETING_ROUND }회차 (
					<c:if test="${concert.TICKETING_ROUND == 1 }">
						${concert.SHOW_TIME1 }
					</c:if>
					<c:if test="${concert.TICKETING_ROUND == 2 }">
						${concert.SHOW_TIME2 }
					</c:if>)
				</td>
				<td>${concert.TICKETING_AMOUNT }매</td>
				<td>
					<c:if test = "${concert.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${concert.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td align="right"><fmt:formatNumber value="${concert.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td>
					<c:if test = "${concert.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td><fmt:formatDate value="${concert.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td align="right"><fmt:formatNumber value="${concert.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
			
			<!-- 미디어 예매 취소 내역 -->
			<c:forEach items="${mediaCancelList }" var="media">
			<tr>
				<td><fmt:formatDate value="${media.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${media.SHOW_NAME }</td>
				<td><fmt:formatDate value="${media.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${media.TICKETING_ROUND }회차 (
					<c:if test="${media.TICKETING_ROUND == 1 }">
						${media.SHOW_TIME1 }
					</c:if>
					<c:if test="${media.TICKETING_ROUND == 2 }">
						${media.SHOW_TIME2 }
					</c:if>)
				</td>
				<td>${media.TICKETING_AMOUNT }매</td>
				<td>
					<c:if test = "${media.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${media.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td align="right"><fmt:formatNumber value="${media.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td>
					<c:if test = "${media.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td><fmt:formatDate value="${media.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td align="right"><fmt:formatNumber value="${media.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
			
			<!-- 강연 예매 취소 내역 -->
			<c:forEach items="${talkCancelList }" var="talk">
			<tr>
				<td><fmt:formatDate value="${talk.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${talk.SHOW_NAME }</td>
				<td><fmt:formatDate value="${talk.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td>${talk.TICKETING_ROUND }회차 (
					<c:if test="${talk.TICKETING_ROUND == 1 }">
						${talk.SHOW_TIME1 }
					</c:if>
					<c:if test="${talk.TICKETING_ROUND == 2 }">
						${talk.SHOW_TIME2 }
					</c:if>)
				</td>
				<td>${talk.TICKETING_AMOUNT }매</td>
				<td>
					<c:if test = "${talk.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${talk.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td align="right"><fmt:formatNumber value="${talk.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td>
					<c:if test = "${talk.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td><fmt:formatDate value="${talk.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td align="right"><fmt:formatNumber value="${talk.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>