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

#button_ticketCancel {
	background-color: #d8bfd8;
	font-size: 13px;
	border: none;
	width: 70px;
	padding: 5px; 
	border-radius: 5px;  
       }
       
#button_ticketRead {
	background-color: #f0e68c;
	font-size: 13px;
	border: none;
	width: 70px;
	padding: 5px; 
	border-radius: 5px;  
       }
</style> 
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
<br>
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="checked"><a href="ticketinglist">예매 내역</a></td>
			<td id="td"><a href="ticketingcancellist">예매 취소 내역</a></td>
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
			<td class="td_list">예매취소</td>
			<td class="td_list">예매티켓</td>
		</tr>
		
		
			<!-- 콘서트 예매 내역 -->
			<c:forEach items="${concertInfoList }" var="concert">
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
					<c:if test = "${concert.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td class="td_list_value">
				<input type="hidden" value="${concert.TICKETING_NO }" id="concertNo">
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->

					<fmt:formatDate value="${concert.SHOW_DATE }" pattern="yyyyMMdd" var="concertDate" />
						<c:if test = "${today < concertDate }" >
							<a href='/info/ticketCancelConcert?ticketing_no=${concert.TICKETING_NO }'>
							<input type="button" id="button_ticketCancel" value="예매 취소"></a>
						</c:if>
				</td>
				<td class="td_list_value">
					<a href='/info/ticketReadConcert?ticketing_no=${concert.TICKETING_NO }'>
					<input type="button" id="button_ticketRead" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 미디어 예매 내역 -->
			<c:forEach items="${mediaInfoList }" var="media">
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
					<c:if test = "${media.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td class="td_list_value">
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->
					<fmt:formatDate value="${media.SHOW_DATE }" pattern="yyyyMMdd" var="mediaDate" />
					<c:if test = "${today < mediaDate }" >
						<a href='/info/ticketCancelMedia?ticketing_no=${media.TICKETING_NO }'>
						<input type="button" id="button_ticketCancel" value="예매 취소"></a>
					</c:if>
				</td>
				<td class="td_list_value">
					<a href='/info/ticketReadMedia?ticketing_no=${media.TICKETING_NO }'>
					<input type="button" id="button_ticketRead" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 강연 예매 내역 -->
			<c:forEach items="${talkInfoList }" var="talk">
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
					<c:if test = "${talk.TICKETING_CANCEL == 0 }">결제완료</c:if>
				</td>
				<td class="td_list_value">
					<!-- 공연일 1일 전까지 예매취소 버튼 활성화 -->
					<fmt:formatDate value="${talk.SHOW_DATE }" pattern="yyyyMMdd" var="talkDate" />
					<c:if test = "${today < talkDate }" >
						<a href='/info/ticketCancelTalk?ticketing_no=${talk.TICKETING_NO }'>
						<input type="button" id="button_ticketCancel" value="예매 취소"></a>
					</c:if>
				</td>
				<td class="td_list_value">
					<a href='/info/ticketReadTalk?ticketing_no=${talk.TICKETING_NO }'>
					<input type="button" id="button_ticketRead" value="티켓보기"></a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
