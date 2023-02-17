<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>ticket read concert</title>

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

#ticket {
	text-align: center;
	border-collapse: collapse;
}

.td_ticket {
	width: 200px;
	border: solid 2px #c0c0c0;
	background-color: #dcdcdc;
		font-size: 14px;
}

.td_ticket_value {
	width: 250px;
	border: solid 1px #d2b48c;
		font-size: 14px;
}


#button {
	background-color: #d2b48c;
	margin-top: 50px;
	margin-bottom: 100px;
	font-size: 15px;
	border: none;
	width: 150px;
	padding: 3px; 
	border-radius: 5px;   
       }
</style>

<!-- 마이페이지 예매 내역 > 콘서트 티켓 보기 -->
</head>
<body>
<form id="concertTicketForm" method="get" action="concertTicketRead">
<br>
<div align="left">
	<table id="mypage">
		<tr align="center">
			<td id="title">마이페이지</td>
			<td id="td"><a href="ticketinglist">예매 내역</a></td>
			<td id="td"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td id="td"><a href="read">회원 정보</a></td>
			<td id="td"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
</div>
	<br><br>
	<div>
		<table id="ticket">
			<tr>
				<td rowspan="5">
				<img src="poster?showPoster=${concertTicket.SHOW_POSTER }" height="200px">
				</td>
				<td class="td_ticket">티켓번호</td>
				<td class="td_ticket_value">${concertTicket.TICKETING_CODE1 }</td>
			</tr>
			<tr>
				<td class="td_ticket">공연명</td>
				<td class="td_ticket_value">${concertTicket.SHOW_NAME }</td>
			</tr>
			<tr>
				<td class="td_ticket">공연일</td>
				<td class="td_ticket_value"><fmt:formatDate value="${concertTicket.SHOW_DATE }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="td_ticket">공연관 / 좌석</td>
				<td class="td_ticket_value">2관 / ${concertTicket.TICKETING_SIT1 }</td>
			</tr>
			<tr>
				<td class="td_ticket">회차 / 시작시간, 종료시간</td>
				<td class="td_ticket_value">${concertTicket.TICKETING_ROUND }회차 / 
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
		<table id="ticket">
			<tr>
				<td rowspan="5">
				<img src="poster?showPoster=${concertTicket.SHOW_POSTER }" height="200px">
				</td>
				<td class="td_ticket">티켓번호</td>
				<td class="td_ticket_value">${concertTicket.TICKETING_CODE2 }</td>
			</tr>
			<tr>
				<td class="td_ticket">공연명</td>
				<td class="td_ticket_value">${concertTicket.SHOW_NAME }</td>
			</tr>
			<tr>
				<td class="td_ticket">공연일</td>
				<td class="td_ticket_value"><fmt:formatDate value="${concertTicket.SHOW_DATE }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="td_ticket">공연관 / 좌석</td>
				<td class="td_ticket_value">2관 / ${concertTicket.TICKETING_SIT2 }</td>
			</tr>
			<tr>
				<td class="td_ticket">회차 / 시작시간, 종료시간</td>
				<td class="td_ticket_value">${concertTicket.TICKETING_ROUND }회차 / 
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
		<input type="button" id="button" value="확인"></a>
	</div>
</form>
</body>
