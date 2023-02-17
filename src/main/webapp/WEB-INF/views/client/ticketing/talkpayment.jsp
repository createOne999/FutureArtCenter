<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style>
/* 부트스트랩 방지 */
#header .header_login *{
    text-decoration: none;
}
#header .header_nav *{
    text-decoration: none;
    color: #000000;
}
#header .menu_main li a:hover{
	color: #ccb6a3;
}
#header h1{
	font-size: 2em;
}
/* 기본 css가 부트스트랩에 영향 방지 */
.slide{
	height: auto;
	top: 0;
	padding-top: 0;
	overflow: auto;
}
.nav-pills .nav-link.active{
	background-color: #ccb6a3;
}
.nav{
	--bs-nav-link-color: #000000;
}
.header_title h1{
	margin-bottom: 0;
	font-weight: bold;
}
.btn-outline-secondary {
    --bs-btn-color: #ccb6a3;
    --bs-btn-border-color: #ccb6a3;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #ccb6a3;
    --bs-btn-hover-border-color: #ccb6a3;
    --bs-btn-focus-shadow-rgb: 108,117,125;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #ccb6a3;
    --bs-btn-active-border-color: #ccb6a3;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #ccb6a3;
    --bs-btn-disabled-bg: transparent;
    --bs-btn-disabled-border-color: #ccb6a3;
    --bs-gradient: none;
}
.btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #ccb6a3;
    --bs-btn-border-color: #ccb6a3;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #ccb6a3;
    --bs-btn-hover-border-color: #ccb6a3;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #ccb6a3;
    --bs-btn-active-border-color: #ccb6a3;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #ccb6a3;
    --bs-btn-disabled-border-color: #ccb6a3;
}
.table{
	border-color: #ccb6a3;
}
</style>
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
				<table border="1" class="table">
					<tr>
						<th>공연명</th>
						<td>${showVO.showName }</td>
					</tr>
					<tr>
						<th>공연기간</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${showVO.showStartdate }" /> - <fmt:formatDate pattern="yyyy-MM-dd" value="${showVO.showClosedate }" /></td>
					</tr>
					<tr>
						<th>공연시간</th>
						<td>
							1회차: ${showVO.showTime1 }<br>
							<c:if test="${showVO.showTime2 != ','}">
							2회차: ${showVO.showTime2 }
							</c:if>
						</td>
					</tr>
					<tr>
						<th>공연관</th>
						<td>1관</td>
					</tr>
					<tr>
						<th>공연금액</th>
						<td>${showVO.showPrice } / 1매</td>
					</tr>
					<tr>
						<th>강연자</th>
						<td>${showVO.talkUser }</td>
					</tr>
					<tr>
						<th>강연주제</th>
						<td>${showVO.talkSubject }</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<fieldset>
					<table  border="1" style="text-align: center;" class="table table-bordered">
						<tr>
							<td>
								<!-- 예매 가능 날짜 -->
								<input type="text" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ticketingVO.showDate }" />" id="showDate" name="showDate" class="form-control"/>	
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
								<div class="input-group w-50">
									<span class="input-group-text">매수</span>
									<input type="text" id="ticketingAmount" name="ticketingAmount" value="${ticketingVO.ticketingAmount }" readonly="readonly" class="form-control" aria-label="With textarea">
								</div>
							</td>
							<td>
								<div class="input-group w-50">
									<span class="input-group-text">총금액</span>
									<input type="text" id="ticketingPayamount" readonly="readonly" class="form-control" aria-label="With textarea">
								</div>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div>
				<fieldset>
					<label for="card">카드</label>
					<input type="radio" id="card" name="ticketingPayment" value="0" >
					<label for="wallet">계좌이체</label>
					<input type="radio" id="wallet" name="ticketingPayment" value="1">
					<input type="button" id="BtnPay" value="결제하기" class="btn btn-primary">
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
