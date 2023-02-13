<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>ticketing list</title>
<!-- 마이페이지-메인 : 예매 내역 -->
</head>
<script>
	// 예매 취소 처리 비밀번호 불일치 결과
	var fail='${fail}';
	if(fail==='불일치'){
		alert("비밀번호가 일치하지 않습니다.");
	} 
</script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
<body>
	<div align="left" id="title"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
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
			<td>예매취소</td>
			<td>예매티켓</td>
		</tr>
		
		
			<!-- 콘서트 예매 내역 -->
			<c:forEach items="${concertInfoList }" var="concert">
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
					<c:if test = "${concert.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td>
				<input type="hidden" value="${concert.TICKETING_NO }" id="concertNo">
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->

					<fmt:formatDate value="${concert.SHOW_DATE }" pattern="yyyyMMdd" var="concertDate" />
						<c:if test = "${today < concertDate }" >
							<a href='/info/ticketCancelConcert?ticketing_no=${concert.TICKETING_NO }'>
							<input type="button" value="예매 취소"></a>
						</c:if>
				</td>
				<td>
					<a href='/info/ticketReadConcert?ticketing_no=${concert.TICKETING_NO }'>
					<input type="button" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 미디어 예매 내역 -->
			<c:forEach items="${mediaInfoList }" var="media">
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
					<c:if test = "${media.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td>
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->
					<fmt:formatDate value="${media.SHOW_DATE }" pattern="yyyyMMdd" var="mediaDate" />
					<c:if test = "${today < mediaDate }" >
						<a href='/info/ticketCancelMedia?ticketing_no=${media.TICKETING_NO }'>
						<input type="button" value="예매 취소"></a>
					</c:if>
				</td>
				<td>
					<a href='/info/ticketReadMedia?ticketing_no=${media.TICKETING_NO }'>
					<input type="button" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 강연 예매 내역 -->
			<c:forEach items="${talkInfoList }" var="talk">
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
					<c:if test = "${talk.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td>
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->
					<fmt:formatDate value="${talk.SHOW_DATE }" pattern="yyyyMMdd" var="talkDate" />
					<c:if test = "${today < talkDate }" >
						<a href='/info/ticketCancelTalk?ticketing_no=${talk.TICKETING_NO }'>
						<input type="button" value="예매 취소"></a>
					</c:if>
				</td>
				<td>
					<a href='/info/ticketReadTalk?ticketing_no=${talk.TICKETING_NO }'>
					<input type="button" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
