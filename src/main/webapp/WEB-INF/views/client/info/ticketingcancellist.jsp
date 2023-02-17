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

#ticketlist_tb {
	font-size: 16px;
	border-collapse: collapse;
}

.td_list {
	border-bottom: solid 3px #bc8f8f;
	padding: 5px 20px 5px 20px;
	text-align: center;
}

.td_list_value {
	border-bottom: solid 1px #d2b48c;
	padding: 10px 20px 10px 20px;
	text-align: center;
}


</style> 
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
<br>
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="td"><a href="ticketinglist">예매 내역</a></td>
			<td id="checked"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td id="td"><a href="read">회원 정보</a></td>
			<td id="td"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
</div>
	<br><br>
	<div>
		<table id="ticketlist_tb">
		<tr>
			<td class="td_list">예매일</td>
			<td class="td_list">공연명</td>
			<td class="td_list">공연일</td>
			<td class="td_list">공연 회차(시작시간,종료시간)</td>
			<td class="td_list">매수</td>
			<td class="td_list">결제수단</td>
			<td class="td_list">결제금액</td>
			<td class="td_list">예매상태</td>
			<td class="td_list">취소일</td>
			<td class="td_list">환불금액</td>
		</tr>
			<!-- 콘서트 예매 취소 내역 -->
			<c:forEach items="${concertCancelList }" var="concert">
			<tr>
				<td class="td_list_value"><fmt:formatDate value="${concert.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${concert.SHOW_NAME }</td>
				<td class="td_list_value"><fmt:formatDate value="${concert.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${concert.TICKETING_ROUND }회차 (
					<c:if test="${concert.TICKETING_ROUND == 1 }">
						${concert.SHOW_TIME1 }
					</c:if>
					<c:if test="${concert.TICKETING_ROUND == 2 }">
						${concert.SHOW_TIME2 }
					</c:if>)
				</td>
				<td class="td_list_value">${concert.TICKETING_AMOUNT }매</td>
				<td class="td_list_value">
					<c:if test = "${concert.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${concert.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td class="td_list_value"><fmt:formatNumber value="${concert.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td class="td_list_value">
					<c:if test = "${concert.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td class="td_list_value"><fmt:formatDate value="${concert.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value"><fmt:formatNumber value="${concert.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
			
			<!-- 미디어 예매 취소 내역 -->
			<c:forEach items="${mediaCancelList }" var="media">
			<tr>
				<td class="td_list_value"><fmt:formatDate value="${media.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${media.SHOW_NAME }</td>
				<td class="td_list_value"><fmt:formatDate value="${media.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${media.TICKETING_ROUND }회차 (
					<c:if test="${media.TICKETING_ROUND == 1 }">
						${media.SHOW_TIME1 }
					</c:if>
					<c:if test="${media.TICKETING_ROUND == 2 }">
						${media.SHOW_TIME2 }
					</c:if>)
				</td>
				<td class="td_list_value">${media.TICKETING_AMOUNT }매</td>
				<td class="td_list_value">
					<c:if test = "${media.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${media.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td class="td_list_value"><fmt:formatNumber value="${media.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td class="td_list_value">
					<c:if test = "${media.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td class="td_list_value"><fmt:formatDate value="${media.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value"><fmt:formatNumber value="${media.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
			
			<!-- 강연 예매 취소 내역 -->
			<c:forEach items="${talkCancelList }" var="talk">
			<tr>
				<td class="td_list_value"><fmt:formatDate value="${talk.TICKETING_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${talk.SHOW_NAME }</td>
				<td class="td_list_value"><fmt:formatDate value="${talk.SHOW_DATE }" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value">${talk.TICKETING_ROUND }회차 (
					<c:if test="${talk.TICKETING_ROUND == 1 }">
						${talk.SHOW_TIME1 }
					</c:if>
					<c:if test="${talk.TICKETING_ROUND == 2 }">
						${talk.SHOW_TIME2 }
					</c:if>)
				</td>
				<td class="td_list_value">${talk.TICKETING_AMOUNT }매</td>
				<td class="td_list_value">
					<c:if test = "${talk.TICKETING_PAYMENT == 0 }">카드</c:if>
					<c:if test = "${talk.TICKETING_PAYMENT == 1 }">계좌이체</c:if>
				</td>
				<td class="td_list_value"><fmt:formatNumber value="${talk.TICKETING_PAYAMOUNT }" pattern="#,###" /> 원</td>
				<td class="td_list_value">
					<c:if test = "${talk.TICKETING_CANCEL == 1 }">취소완료</c:if>
				</td>
				<td class="td_list_value"><fmt:formatDate value="${talk.TICKETING_CANCEL_DATE}" pattern="YYYY-MM-dd" type="date" /></td>
				<td class="td_list_value"><fmt:formatNumber value="${talk.TICKETING_CANCEL_AMOUNT }" pattern="#,###" /> 원</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>