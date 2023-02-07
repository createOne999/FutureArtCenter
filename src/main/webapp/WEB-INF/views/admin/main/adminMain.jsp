<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title> 
		<!-- <script src="/js/adminReg/adminReg.js"></script> -->
		<script type="text/javascript">
			function regPopUp(){
				window.open("/admin/reg/adminReg", "공연등록", "width=600, height=500, top=50, left=200");
			};
		
			function closePopup() {
				//자신을 실행시킨 본 창은 opener 객체로 인식된다
				var nickNameObj = opener.document.testForm.nickName;
				var flagObj = opener.document.testForm.flag;
				
				//nickName 초기화 시키기
				nickNameObj.value = "";
				//nickName으로 마우스 커서 옮기기
				//nickNameObj.focus();
				
				// flag를 "ok"로 변경
				flagObj.value = "ok";
				
				//자신(팝업)을 종료한다.
				self.close();
			};
			
			function change(e){
				const value = e.value;
				
				document.getElementById('result').innerText = value;
			}
		</script>
		<style type="text/css">
			.content{
				margin-top: 50px;
			}
			.well{
				display: flex;
			}
			
			.title {
				margin: 0;
			}
			
			.form-inline{
				margin: 0;
				width: 500px;
				display: flex;
				justify-content: space-between;
			}
			
			.sub-header{
				font-size: 20px;
			}
		
			.select_menu{
				display: flex;
			}
			#search1 {
				margin-right: 25px;
				margin-left: 10px;
			}
			
			#search2 {
				margin-right: 15px;
			}
			
			
			
			.list{
				margin-top: 10px;
				float: left;
			}
			
			select{
				padding: 3px;
			}
			
			button{
				padding: 1px 3px 1px 3px;
			}
		</style>
	</head>
	
	<body>
		<div class="content">
			<div class="well">
				<div class="title">
					<p class="sub-header">게시판 리스트</p>
				</div>
				<form class="form-inline" id="search">
					<div class="select_menu">
						<div class="form-group" id="kind">
							<select id="search1" name="search" onchange="change(this)">
								<option value="media">미디어</option>
								<option value="concert">콘서트</option>
								<option value="talk">강연</option>
							</select>
						</div>
						
						<div class="form-group" id="state">
							<select id="search2" name="search" class="form-control">
								<option value="proceeding">공연중</option>
								<option value="scheduled">진행예정</option>
							</select>
						</div>
						<button type="button" class="search_Btn" id="search_Btn" onclick="search()">조회</button>
					</div>
					<div class="inputShow">
						<button type="button" id="register_Btn" onclick="regPopUp()">공연 등록하기</button>
					</div>
				</form>
			</div>
			
			<div class="list">
				<table border="1">
					<tr id="col4">
						<th class="tac">공연 번호</th>
						<th class="tac">공연명</th>
						<th class="tac">공연 회차</th>
						<th class="tac">공연 시간</th>
						<th class="tac">공연 시작일</th>
						<th class="tac">공연 종료일</th>
						<th class="tac">공연 금액</th>
						<th class="tac">공연 상태</th>
					</tr>
					<c:forEach var="AdminMediaVO" items="${media_list}" >
						<tr id="col1">
							<td>${AdminMediaVO.show_no}</td>
							<td>${AdminMediaVO.show_name}</td>
							<td>
								<c:if test="${AdminMediaVO.show_round eq '1'}">1회차</c:if>
								<c:if test="${AdminMediaVO.show_round eq '2'}">1회차,2회차</c:if>
							</td>
							<td>${AdminMediaVO.show_time1}, ${AdminMediaVO.show_time2}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminMediaVO.show_startdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminMediaVO.show_closedate}" /></td>
							<td>${AdminMediaVO.show_price}</td>
							<td>
								<c:if test="${AdminMediaVO.show_status eq '0'}">예정</c:if>
								<c:if test="${AdminMediaVO.show_status eq '1'}">진행중</c:if>
								<c:if test="${AdminMediaVO.show_status eq '2'}">종료</c:if>
							</td>
						</tr>
					</c:forEach>
					
					<c:forEach var="AdminTalkVO" items="${talk_list}" >
						<tr id="col2">
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
								<c:if test="${AdminTalkVO.show_status eq '0'}">예정</c:if>
								<c:if test="${AdminTalkVO.show_status eq '1'}">진행중</c:if>
								<c:if test="${AdminTalkVO.show_status eq '2'}">종료</c:if>
							</td>
						</tr>
					</c:forEach>
					
					<c:forEach var="AdminConcertVO" items="${concert_list}" >
						<tr id="col3">
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
								<c:if test="${AdminConcertVO.show_status eq '0'}">예정</c:if>
								<c:if test="${AdminConcertVO.show_status eq '1'}">진행중</c:if>
								<c:if test="${AdminConcertVO.show_status eq '2'}">종료</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>