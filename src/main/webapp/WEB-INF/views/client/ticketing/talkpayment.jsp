<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:if test="${user.user_id == null or user.user_id == ''}">
	<div>
		<fieldset>
			<div align="center">
				<h4>로그인 후에 예매 할 수 있습니다.</h4>
			</div>
		</fieldset>
	</div>
</c:if>
<c:if test="${user.user_id != null and user.user_id != ''}">
	<div class="main_content">
	<!-- 공연번호 저장용 -->
		<form action="/ticketing/talkpaymenting" method="post" id="payment">
			<input type="hidden" name="showNo" value="${showVO.showNo }">
			<!-- 공연 정보 -->
			<div class="title_space">
				<h3>결제</h3>
			</div>
			<div class="post_space" style="display: inline-block; border: 1px solid; vertical-align: middle;">${showPoster }</div>
			<div class="select_space" style="display: inline-block; vertical-align: middle;">
				<table border="1"  >
					<tr>
						<td>공연명</td>
						<td>${showVO.showName }</td>
					</tr>
					<tr>
						<td>공연기간</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${showVO.showStartdate }" /> - <fmt:formatDate pattern="yyyy-MM-dd" value="${showVO.showClosedate }" /></td>
					</tr>
					<tr>
						<td>공연시간</td>
						<td>
							1회차: ${showVO.showTime1 }<br>
							<c:if test="${not empty showVO.showTime2 }">
							2회차: ${showVO.showTime2 }
							</c:if>
						</td>
					</tr>
					<tr>
						<td>공연관</td>
						<td>1관</td>
					</tr>
					<tr>
						<td>공연금액</td>
						<td>${showVO.showPrice } / 1매</td>
					</tr>
					<tr>
						<td>강연자</td>
						<td>${showVO.talkUser }</td>
					</tr>
					<tr>
						<td>강연주제</td>
						<td>${showVO.talkSubject }</td>
					</tr>
				</table>
			</div>
			<div>
				<fieldset>
					<table  border="1" style="text-align: center;">
						<tr>
							<td>
								<!-- 예매 가능 날짜 -->
								<input type="text" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ticketingVO.showDate }" />" id="showDate" name="showDate" />	
							</td>
							<td>
								<c:choose>
									<c:when test="${ticketingVO.ticketingRound == 1 }">
										회차선택 1회차 ${showVO.showTime1 }
										<input type="radio" id="1Round" name="ticketingRound" value="1" readonly="readonly" checked="checked">
									</c:when>
									<c:when test="${ticketingVO.ticketingRound == 2 }">
										회차선택 2회차 ${showVO.showTime2 }
										<input type="radio" id="2Round" name="ticketingRound" value="2" readonly="readonly" checked="checked">
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								매수
								<input type="text" id="ticketingAmount" name="ticketingAmount" value="${ticketingVO.ticketingAmount }" readonly="readonly">
							</td>
							<td>
								총금액 : <input type="text" id="ticketingPayamount" readonly="readonly">
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div>
				<fieldset>
					<label for="card">카드</label>
					<input type="radio" id="card" name="ticketingPayment" value="0" >
					<label for="wallet">계좌번호</label>
					<input type="radio" id="wallet" name="ticketingPayment" value="1">
					<input type="button" id="BtnPay" value="결제하기">
				</fieldset>
			</div>
		</form>
	</div>
</c:if>
<script type="text/javascript">
	$(document).ready(function(){
		const dateInputString = $("#showDate").val();
		const dateInput = new Date(dateInputString);
		
		$("#BtnPay").on("click", function(){
			
			if (!$("input[name='ticketingPayment']").is(":checked")) {
				alert("결제방법을 선택해 주세요");
				return false;
			}
			
			const isPay = confirm("결제하시겠습니까?");
			
			if (isPay) {
				var showNo = $("input[name='showNo']").val();
				var ticketingRound = $("input[name='ticketingRound']").val();
				var ticketingAmount = $("input[name='ticketingAmount']").val();
				var showObject = {showDate : new Date(dateInput), showNo : showNo, ticketingRound : ticketingRound, ticketingAmount : ticketingAmount};

				// 잔여좌석 검사
				$.ajax({
					url: "/ticketing/talkCheck",
					type: "post",
					data: JSON.stringify(showObject),
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function(data){
						if (data.result === "SUCCESS") {
							alert("결제되었습니다.");
							$("#payment").submit();
						}else if(data.result === "FAIL"){
							alert("좌석이 매진되었습니다.");
						}
					},
					error: function(){
						alert("통신에 실패했습니다.");
					}
					
				});// ajax End
				
			}else{
				alert("결제를 취소합니다.");
			}// isPay end
		});
	});
	
	//총금액 계산
	$("#ticketingPayamount").attr("value", ${showVO.showPrice} * $("#ticketingAmount").val());	

</script>
