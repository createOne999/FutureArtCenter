<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FutureArtCenter</title>
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/css/adminMain.css">
		<script src="/js/adminMain/main.js"></script>
	</head>
	
	<body>
		<div class="content">
			<div class="well">
				<div class="title">
					<p class="sub-header">게시판 리스트</p>
				</div>
				<form class="form-inline" id="search">
						
					<div class="inputShow">
						<button type="button" id="register_Btn" onclick="regPopUp()">공연 등록하기</button>
						<input type="button" id="delete_Btn" class="delete_Btn" value="삭제" onclick="deleteBtn()">
					</div>
				</form>
			</div>
			
			<form:form id="form" method="post" action="status">
			<div class="list">
				<table>
					<tr id="col4">
						<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
						<th class="tac">공연 번호</th>
						<th class="tac">공연명</th>
						<th class="tac">공연 회차</th>
						<th class="tac">공연 시간(시작시간,종료시간)</th>
						<th class="tac">공연 시작일</th>
						<th class="tac">공연 종료일</th>
						<th class="tac">공연 금액</th>
						<th class="tac">공연 상태</th>
						<th class="tac">상태 변경</th>
					</tr>
					<c:forEach var="AdminMediaVO" items="${media_list}" >
						<tr id="col1">
							<td><input name="checkShow" type="checkbox" class="checkShow" value="${AdminMediaVO.show_no}" /></td>
							<td>${AdminMediaVO.show_no}</td>
							<td>${AdminMediaVO.show_name}</td>
							<td>
								<c:if test="${AdminMediaVO.show_round eq '1'}">1회차</c:if>
								<c:if test="${AdminMediaVO.show_round eq '2'}">1회차,2회차</c:if>
							</td>
							<td>${AdminMediaVO.show_time1}~ ${AdminMediaVO.show_time2}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminMediaVO.show_startdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminMediaVO.show_closedate}" /></td>
							<td>${AdminMediaVO.show_price}</td>
							<td>
								<div id="show_m${AdminMediaVO.show_no}">
									<c:if test="${AdminMediaVO.show_status eq '0'}">예정</c:if>
									<c:if test="${AdminMediaVO.show_status eq '1'}">진행중</c:if>
									<c:if test="${AdminMediaVO.show_status eq '2'}">종료</c:if>
								</div>
								<input type="hidden" value="${AdminMediaVO.show_status}" id="status_media${AdminMediaVO.show_no}">
							</td>
							<td>
								<input type="button" value="진행중" id="status1" onclick="change_media(1, ${AdminMediaVO.show_no})"/>
								<input type="button" value="종료" id="status2" onclick="change_media_End(2, ${AdminMediaVO.show_no})"/>
							</td>
						</tr>
					</c:forEach>
					
					<c:forEach var="AdminTalkVO" items="${talk_list}" >
						<tr id="col2">
							<td><input name="checkShow" type="checkbox" class="checkShow" value="${AdminTalkVO.show_no}" /></td>
							<td>${AdminTalkVO.show_no}</td>
							<td>${AdminTalkVO.show_name}</td>
							<td>
								<c:if test="${AdminTalkVO.show_round eq '1'}">1회차</c:if>
								<c:if test="${AdminTalkVO.show_round eq '2'}">1회차,2회차</c:if>
							</td>
							<td>${AdminTalkVO.show_time1}, ${AdminTalkVO.show_time2}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminTalkVO.show_startdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminTalkVO.show_closedate}" /></td>
							<td>${AdminTalkVO.show_price}</td>
							<td>
								<div id="show_t${AdminTalkVO.show_no}">
									<c:if test="${AdminTalkVO.show_status eq '0'}">예정</c:if>
									<c:if test="${AdminTalkVO.show_status eq '1'}">진행중</c:if>
									<c:if test="${AdminTalkVO.show_status eq '2'}">종료</c:if>
								</div>
								<input type="hidden" value="${AdminTalkVO.show_status}" id="status_talk${AdminTalkVO.show_no}">
							</td>
							<td>
								<input type="button" value="진행중" id="status1" onclick="change_talk(1, ${AdminTalkVO.show_no})"/>
								<input type="button" value="종료" id="status2" onclick="change_talk_End(2, ${AdminTalkVO.show_no})"/>
							</td>
						</tr>
					</c:forEach>
					
					<c:forEach var="AdminConcertVO" items="${concert_list}" >
						<tr id="col3">
							<td><input name="checkShow" type="checkbox" class="checkShow" value="${AdminConcertVO.show_no}" /></td>
							<td>${AdminConcertVO.show_no}</td>
							<td>${AdminConcertVO.show_name}</td>
							<td>
								<c:if test="${AdminConcertVO.show_round eq '1'}">1회차</c:if>
								<c:if test="${AdminConcertVO.show_round eq '2'}">1회차,2회차</c:if>
							</td>
							<td>${AdminConcertVO.show_time1}, ${AdminConcertVO.show_time2}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminConcertVO.show_startdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminConcertVO.show_closedate}" /></td>
							<td>${AdminConcertVO.show_price}</td>
							<td>
								<div id="show_c${AdminConcertVO.show_no}">
									<c:if test="${AdminConcertVO.show_status eq '0'}">예정</c:if>
									<c:if test="${AdminConcertVO.show_status eq '1'}">진행중</c:if>
									<c:if test="${AdminConcertVO.show_status eq '2'}">종료</c:if>
								</div>
								<input type="hidden" value="${AdminConcertVO.show_status}" id="status_concert${AdminConcertVO.show_no}">
								<input type="hidden" value="${AdminConcertVO.show_status}" id="status_concert2${AdminConcertVO.show_no}">
							</td>
							<td>
								<input type="button" value="진행중" id="status1" onclick="change_concert(1, ${AdminConcertVO.show_no})"/>
								<input type="button" value="종료" id="status2" onclick="change_concert_End(2, ${AdminConcertVO.show_no})"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</form:form>
		</div>
	</body>
</html>