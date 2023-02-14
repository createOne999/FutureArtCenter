<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="content">
			<div class="title">
				<p class="sub-header">예매 현황 리스트</p>
			</div>
			<table border="1">
				<tr>
					<th class="tac">회원 번호</th>
					<th class="tac">아이디</th>
					<th class="tac">공연 번호</th>
					<th class="tac">예매 번호</th>
					<th class="tac">티켓 코드</th>
					<th class="tac">예매 매수</th>
					<th class="tac">예매일</th>
					<th class="tac">결제수단</th>
					<th class="tac">최종 결제 금액</th>
					<th class="tac">예매 취소여부</th>
				</tr>
				
				<c:forEach items="${salesConcertList}" var="ticketing2">
					<tr>
						<td>${ticketing2.USER_NO}</td>
						<td>${ticketing2.USER_ID}</td>
						<td>${ticketing2.SHOW_NO}</td>
						<td>${ticketing2.TICKETING_NO}</td>
						<td>${ticketing2.TICKETING_CODE1}</td>
						<td>${ticketing2.TICKETING_AMOUNT}</td>
						<td><fmt:formatDate value="${ticketing2.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
						<td>
							<c:if test="${ticketing2.TICKETING_PAYMENT eq '0'}">카드</c:if>
							<c:if test="${ticketing2.TICKETING_PAYMENT eq '1'}">계좌번호</c:if>
						</td>
						<td>${ticketing2.TICKETING_PAYAMOUNT}</td>
						<td>
							<c:if test="${ticketing2.TICKETING_CANCEL eq '0'}">예매중</c:if>
							<c:if test="${ticketing2.TICKETING_CANCEL eq '1'}">취소</c:if>
						</td>
					</tr>
				</c:forEach>
				
				<c:forEach items="${salesMediaList}" var="ticketing0">
					<tr>
						<td>${ticketing0.USER_NO}</td>
						<td>${ticketing0.USER_ID}</td>
						<td>${ticketing0.SHOW_NO}</td>
						<td>${ticketing0.TICKETING_NO}</td>
						<td>${ticketing0.TICKETING_CODE1}</td>
						<td>${ticketing0.TICKETING_AMOUNT}</td>
						<td><fmt:formatDate value="${ticketing0.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
						<td>
							<c:if test="${ticketing0.TICKETING_PAYMENT eq '0'}">카드</c:if>
							<c:if test="${ticketing0.TICKETING_PAYMENT eq '1'}">계좌번호</c:if>
						</td>
						<td>${ticketing0.TICKETING_PAYAMOUNT}</td>
						<td>
							<c:if test="${ticketing0.TICKETING_CANCEL eq '0'}">예매중</c:if>
							<c:if test="${ticketing0.TICKETING_CANCEL eq '1'}">취소</c:if>
						</td>
					</tr>
				</c:forEach>
				
				<c:forEach items="${salesTalkList}" var="ticketing1">
					<tr>
						<td>${ticketing1.USER_NO}</td>
						<td>${ticketing1.USER_ID}</td>
						<td>${ticketing1.SHOW_NO}</td>
						<td>${ticketing1.TICKETING_NO}</td>
						<td>${ticketing1.TICKETING_CODE1}</td>
						<td>${ticketing1.TICKETING_AMOUNT}</td>
						<td><fmt:formatDate value="${ticketing1.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
						<td>
							<c:if test="${ticketing1.TICKETING_PAYMENT eq '0'}">카드</c:if>
							<c:if test="${ticketing1.TICKETING_PAYMENT eq '1'}">계좌번호</c:if>
						</td>
						<td>${ticketing1.TICKETING_PAYAMOUNT}</td>
						<td>
							<c:if test="${ticketing1.TICKETING_CANCEL eq '0'}">예매중</c:if>
							<c:if test="${ticketing1.TICKETING_CANCEL eq '1'}">취소</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>