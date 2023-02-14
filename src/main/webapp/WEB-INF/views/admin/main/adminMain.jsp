<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title> <!-- 
		<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script> -->
		<script type="text/javascript">
			function regPopUp(){
				window.open("/admin/reg/adminReg", "공연등록", "width=600, height=500, top=50, left=200");
			};		
			<!-- 진행중 -->
			function change_concert(c, number){
				var result = '#show_c' + number;
				var show_number = '#status_concert' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",					//전송방식
						url: "/admin/concert/status", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status1:c, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드 update=리턴값 받는부분
							alert("통신성공");
							if(update == 1){
								$(result).text("진행중");
								
							}
						},
						error: function(XMLHttpRequest, request, error){
							alert("통신실패" + +request.responseText);
						}
					});
			}
			
			function change_media(m, number){
				var result = '#show_m' + number;
				var show_number = '#status_media' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",					//전송방식
						url: "/admin/media/status", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status1:m, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드
							alert("통신성공");
							if(update == 1){
								$(result).text("진행중");
							}
						},
						error: function(XMLHttpRequest){
							alert("통신실패")
						}
					});
			}
			
			function change_talk(t, number){
				var result = '#show_t' + number;
				var show_number = '#status_talk' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",				//전송방식
						url: "/admin/talk/status", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status1:t, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드
							alert("통신성공");
							if(update == 1){
								$(result).text("진행중");
							}
						},
						error: function(XMLHttpRequest){
							alert("통신실패");
						}
					});
			}
			<!-- 진행중 end -->
			
			<!-- 종료 -->
			function change_concert_End(c, number){
				var result = '#show_c' + number;
				var show_number = '#status_concert2' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",						//전송방식
						url: "/admin/concert/statusEnd", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status2:c, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드 update=리턴값 받는부분
							alert("통신성공");
							if(update == 1){
								$(result).text("종료");
							}
						},
						error: function(XMLHttpRequest, request, error){
							alert("통신실패" + +request.responseText);
						}
					});
			}
			
			function change_media_End(m, number){
				var result = '#show_m' + number;
				var show_number = '#status_media' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",					//전송방식
						url: "/admin/media/statusEnd", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status2:m, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드
							alert("통신성공");
							if(update == 1){
								$(result).text("종료");
							}
						},
						error: function(XMLHttpRequest){
							alert("통신실패");
						}
					});
			}
			
			function change_talk_End(t, number){
				var result = '#show_t' + number;
				var show_number = '#status_talk' + number;
				var status_ing = $(show_number).val();
					$.ajax({
						type: "get",					//전송방식
						url: "/admin/talk/statusEnd", 	//전송페이지
						dataType: "json",
						data: {'show_status' : status_ing, show_status2:t, show_no:number},
						success: function(update){ //전송 성공시 실행될 코드
							alert("통신성공");
							if(update == 1){
								$(result).text("종료");
							}
						},
						error: function(XMLHttpRequest){
							alert("통신실패");
						}
					});
			}
			<!-- 종료 end -->
			$(function(){
				var chkObj = document.getElementsByName("checkShow");
				var rowCnt = chkObj.length;
				
				$("input[name='allCheck']").click(function(){
					var chk_listArr = $("input[name='checkShow']");
					for (var i = 0; i < chk_listArr.length; i++) {
						chk_listArr[i].checked = this.checked;
					}
				});
				
				$("input[name='checkShow']").click(function(){
					if ($("input[name='checkShow']:checked").length == rowCnt) {
						$("input[name='allCheck']")[0].checked = true;
					}
					else{
						$("input[name='allCheck']")[0].checked = false;
					}
				});
			});
			
			function deleteBtn(){
				var url = "delete";
				var valueArr = new Array();
				var list = $("input[name='checkShow']");
				for (var i = 0; i < list.length; i++) {
					if (list[i].checked) {
						valueArr.push(list[i].value);
					}
				}
				if (valueArr.length == 0) {
					alert("선택된 공연이 없습니다.");
				}
				else{
					var chk = confirm("정말 삭제하시겠습니까?");
					$.ajax({
						url: "/admin/media/delete",
						type: 'POST',
						traditional: true,
						async : false,
						data: {
							valueArr : valueArr
						},
						success: function(remove){
							if (remove = 1) {
								location.replace("/admin/main")
								
								$.ajax({
									url: "/admin/talk/delete",
									type: 'POST',
									traditional: true,
									async : false,
									data: {
										valueArr : valueArr
									},
									success: function(remove){
										if (remove = 1) {
											location.replace("/admin/main")
											
											$.ajax({
												url: "/admin/concert/delete",
												type: 'POST',
												traditional: true,
												async : false,
												data: {
													valueArr : valueArr
												},
												success: function(remove){
													if (remove = 1) {
														location.replace("/admin/main")
													}
												}
											});
										}
									}
								});
							}
						}
					});
				}
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
						
					<div class="inputShow">
						<button type="button" id="register_Btn" onclick="regPopUp()">공연 등록하기</button>
						<input type="button" id="delete_Btn" class="delete_Btn" value="삭제" onclick="deleteBtn()">
					</div>
				</form>
			</div>
			
			<form:form id="form" method="post" action="status">
			<div class="list">
				<table border="1">
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