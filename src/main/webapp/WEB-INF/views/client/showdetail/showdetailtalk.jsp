<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<div class="main_content">
	<%-- 공연번호 저장용 --%>
	<form action="/ticketing/talkpayment" method="post" id="ticketingForm">
		<input type="hidden" name="showNo" value="${showVO.showNo }">

		<%-- 공연 정보 --%>
		<div class="title_space">
			<h3>예매</h3>
			<a href="/show/showlist" style="display: inline-block; margin-left: auto; ">
				<input type="button" value="목록" class="btn btn-outline-secondary">
			</a>
		</div>
		<div class="post_space" style="display: inline-block; border: 1px solid; vertical-align: middle;">
			<img alt="${showVO.showPoster }" src="poster?show_no=${showVO.showNo }&showPoster=${showVO.showPoster}" height="200px">
		</div>
		<div class="select_space" style="display: inline-block; vertical-align: middle;">
			<table border="1" class="table">
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
					<c:choose>
						<c:when test="${showVO.showRound == 1 }">
							<td>1회차: ${showVO.showTime1 }<br></td>
						</c:when>
						<c:when test="${showVO.showRound == 2 }">
							<td>1회차: ${showVO.showTime1 }<br> 
								2회차: ${showVO.showTime2 }</td>
						</c:when>
					</c:choose>
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
		<!-- 예매단 -->
		<c:if test="${user.user_id == null or user.user_id == ''}">
			<div>
				<fieldset class="border bg-secondary-subtle col-md-6">
					<div align="center">
						<h4>로그인 후에 예매 할 수 있습니다.</h4>
					</div>
				</fieldset>
			</div>
		</c:if>
		<c:if test="${user.user_id != null and user.user_id != '' }">
			<div class="w-50 p-3">
				<fieldset>
					<table  border="1" style="text-align: center;" class="table table-bordered">
						<tr>
							<td>
								<c:choose>
									<c:when test="${showVO.showRound == 2 }">
										회차선택 1회차 ${showVO.showTime1 }
										<input type="radio" id="1Round" name="ticketingRound" value="1">
										<br>
										회차선택 2회차 ${showVO.showTime2 }
										<input type="radio" id="2Round" name="ticketingRound" value="2">
									</c:when>
									<c:otherwise>
										회차 ${showVO.showTime1 }
										<input type="radio" id="1Round" name="ticketingRound" value="1">
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<%-- 날짜 + 회차를 합쳐, 잔여 좌석수를 추가 --%>
								<select id="showDate" name="showDate" class="form-select">
									<option disabled="disabled" selected="selected" >=====날짜:남은좌석수=====</option>
									<%-- 날짜 리스트 반복 --%>
									<c:forEach items="${ticketingDateList }" var="date">
										<%-- 비교를 위해 형식변경 --%>
										<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" var="tempDate"/>
										<%-- date 가 mediaRestTicket과 일치여부 확인 --%>
										<c:set var="seatChecked" value="0" />
										<c:set value="30" var="talkRestTicketChecked" />
										<c:forEach items="${talkRestTicketList }" var="talkRestTicket">
											<fmt:formatDate value="${talkRestTicket.showDate }" pattern="yyyy-MM-dd" var="tempTicketDate"/>
											<c:if test="${seatChecked == 0 }">
												<c:choose>
													<c:when test="${tempDate == tempTicketDate && talkRestTicket.ticketingRound == 1}">
														<c:set var="seatChecked" value="1" />
														<c:set var="talkRestTicketChecked1" value="${talkRestTicket.ticketingAmount }" />
													</c:when>
													<c:when test="${tempDate == tempTicketDate && talkRestTicket.ticketingRound == 2}">
														<c:set var="seatChecked" value="2" />
														<c:set var="talkRestTicketChecked2" value="${talkRestTicket.ticketingAmount }" />
													</c:when>
												</c:choose>
											</c:if>
											<%-- 같은 날짜에서 다른 회차 둘다 예매내역이 있을 경우 --%>
											<c:if test="${seatChecked == 1 }">
												<c:if test="${talkRestTicket.ticketingAmount == 2}">
													<c:set value="3" var="seatChecked" />
												</c:if>
											</c:if>
										</c:forEach>
										<c:choose>
											<%-- 어떤 날의 1회차 내역이 있을경우 --%>
											<c:when test="${seatChecked == 1 }">
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round1">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:${talkRestTicketChecked1 }:=====
												</option>
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round2">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:30:=====
												</option>
											</c:when>
											<%-- 어떤 날의 2회차 내역이 있을경우 --%>
											<c:when test="${seatChecked == 2 }">
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round1">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:30:=====
												</option>
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round2">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:${talkRestTicketChecked2 }:=====
												</option>
											</c:when>
											<%-- 어떤 날의 1,2 회차 내역 모두 있을 경우 --%>
											<c:when test="${seatChecked == 3 }">
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round1">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:${talkRestTicketChecked1 }:=====
												</option>
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />" class="round2">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:${talkRestTicketChecked2 }:=====
												</option>
											</c:when>
											<%-- 어떤 날의 예매정보가 없을 경우 --%>
											<c:otherwise>
												<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />">
													=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />:30:=====
												</option>	
											</c:otherwise>
										</c:choose>				
									</c:forEach>
								</select>
							</td>
							<td>
								매수선택 1매
								<input type="radio" id="1ticket" name="ticketingAmount" value="1">
								<br>
								매수선택 2매
								<input type="radio" id="2ticket" name="ticketingAmount" value="2">
							</td>
							
						</tr>
						<tr>
							
							<td colspan="2">
								<div class="input-group">
									<span class="input-group-text">총금액</span>
									<input type="text" id="ticketingPayamount" readonly="readonly" class="form-control w-25" aria-label="With textarea">
								</div>
							</td>
							<td>
								<input type="button" value="예매하기" id="ticketing_btn" name="ticketing_btn" class="btn btn-primary">
							</td>
						</tr>
					</table>
				</fieldset>
				
			</div>
		</c:if>
		<!-- 작품소개, 관람안내 -->
		<div class="mt-2">
			<span>
				<input type="button" value="작품소개" id="introContent" class="btn btn-outline-secondary">
			</span>
			<span>
				<input type="button" value="관람안내" id="viewGuide" class="btn btn-outline-secondary">
			</span>
		</div>
		<!-- 상세내용 -->
		<div id="detail">
			<div id="detailContent">
				<p>${showVO.showContent1 }</p>
				<img alt="${showVO.showContent2 }" src="poster?show_no=${showVO.showNo }&showPoster=${showVO.showContent2 }" style="max-width: 600px">
			</div>
			<div id="detailViewGuide">
				<!-- 코로나 19관람 수칙 -->
				<div>
					<p>
						코로나 19관람 수칙
						<br><br>
						코로나 19 예방 및 안전한 공연 진행을 위하여 관객 여러분의 적극적인 협조 부탁드립니다.
						아래의 안내사항은 정부 및 지자체 지침에 따라 변경될 수 있습니다.
					</p>
					<p>
						1. 마스크 착용 안내<br>
						1) 공연장 입장 전 발열 체크, 손 소독, 마스크 착용 여부 확인 등의 예방 절차를 진행합니다.<br>
						2) 공연장 내부에서는 반드시 마스크를 착용해 주시기 바랍니다.<br>
						3) 공연을 관람하실 때에도 마스크 착용은 필수이며 마스크 미착용 및 안정 수칙을 위반하는 행위 적발 시 퇴장될 수 있습니다.<br>
					</p>
					<p>
						2. 관객 간 거리 두기<br>
						공연장 로비에서의 대기 및 입/퇴장 시 거리 두기를 유지하여 이동할 수 있도록 진행요원의 안내를 따라 주시기 바랍니다.<br>
					</p>
					<p>
						3. 공연장 입장 불가 관람객<br>
						아래의 사항에 해당될 경우 공연장 입장이 불가합니다.<br>
						1) 코로나 19 양성 반응으로 보건 당국으로부터 자가격리를 안내받은 경우<br>
						2) 공연 관람 당일 발열(37.5도 이상) 증상 혹은 호흡기 증상<br>
						(기침, 인후통, 가래, 콧물 등) 이 있는 경우
					</p>
				</div>
				<!-- 좌석안내 -->
				<div>
					
					<p>
						1) 위의 좌석 배치도는 예매 시 이해를 돕기 위한 이미지이며, 무대 연출에 따라 변경될 수 있으니 양해 부탁드립니다.<br>
						2) 주변 관람객의 신장 차이, 공연 관람 위치 및 구조물, 카메라, 기타 연출상의 이유로 일부 시야가 제한될 수 있으며, 공연 당일 시야 방해로 인한 티켓 환불 및 변경은 불가하오니 양해 부탁드립니다.
					</p>
				</div>
				<!-- 티켓예매안내 -->
				<div>
					<p>티켓 예매 안내</p>
					<p>
						1) 본 공연은 회차당 1인 2매까지 예매가 가능합니다.<br>
						2) 본 공연은 만 7세 이상 관람가로 관람 연령 미만은 티켓 소지 여부와 상관 없이 입장이 불가하며 관람 등급 제한으로 인한 당일 현장 취소, 환불, 변경을 불가합니다.<br>
						3) 티켓의 취소, 환불은 공연 당일 1일 전까지 가능합니다.<br>
						4) 공연 당일에는 변경 및 환불이 불가합니다.
					</p>
				</div>
				<!-- 입장 및 공연 관람 유의사항 -->
				<div>
					<p>입장 및 공연 관람 유의사항</p>
					<p>
						1) 1인 1매 티켓을 소지하여야 입장이 가능합니다. 티켓 미소지 시 어떠한 사유로도 입장이 불가합니다.<br>
						2) 입장은 공연 시작 1시간 전부터 진행되며 현장 진행 상황에 따라 변동될 수 있습니다.<br>
						3) 공연 시작 후에는 입장이 제한될 수 있습니다.<br>
						4) 공연 시작 후에는 원활한 운영과 다른 관객들의 관람을 방해하지 않기 위해 지정된 시간에만 입장이 가능합니다.<br>
						5) 공연장 내 생수를 제외한 음료 및 음식물 반입이 금지 되어 있으며 꽃다발, 풍선, LED 등은 반입이 불가합니다.
						6) 본인의 부주의로 인한 분실, 도난 등에는 책임을 지지 않으니 귀중품 보관에 유의해 주시기 바랍니다.<br>
						7) 공연중 사진 및 동영상 촬영, 녹음, 영상 중계 등 저작권을 침해하는 모든 행위를 금지합니다. 적발시 녹음, 녹취된 자료 삭제 및 퇴장 조치되오니 협조 부탁드립니다.<br>
						8) 타 관람객의 관람에 불편이 되는 행동, 공연 중 이동 및 퇴장은 삼가해 주시기 바랍니다.<br>
					</p>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#detailContent").show();
		$("#detailViewGuide").hide();
		$(".round1").hide();
		$(".round2").hide();
		
		$("#ticketing_btn").on("click", function(){
			const dateInputString = $("#showDate").val();
			const dateInput = new Date(dateInputString);
			
			if (!$("input[name='ticketingRound']").is(':checked')) {
				alert("회차를 선택하지 않았습니다.");
				return false;	
			}
			if (!$("#showDate option:selected").length > 0) {
				alert("날짜를 선택하지 않았습니다.");
				return false;
			}
			if(!$("input[name='ticketingAmount']").is(':checked')){
				alert("매수선택을 선택하지 않았습니다.");
				return false;
			}
			
			var showNo = $("input[name='showNo']").val();
			var ticketingRound = $("input[name='ticketingRound']").val();
			var ticketingAmount = $("input[name='ticketingAmount']").val();
			var showObject = {showDate : new Date(dateInput), showNo : showNo, ticketingRound : ticketingRound, ticketingAmount : ticketingAmount};
			let chkTicketing = false;
			console.log(showObject);
			// 잔여좌석 검사
			$.ajax({
				url: "/ticketing/talkCheck",
				type: "post",
				data: JSON.stringify(showObject),
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function(data){
					if (data.result === "SUCCESS") {
						chkTicketing = confirm("결제페이지로 이동합니다.");
						if (chkTicketing) {
							//$("#showDate").val(dateInput);
							$("input[name='showDate']").val(Date.parse(dateInput));
							$("#ticketingForm").submit();	
						}
					}else if(data.result === "FAIL"){
						alert("좌석이 매진되었습니다.");
					}
				},
				error: function(){
					alert("통신에 실패했습니다.");
				}
			});
		});
		
		// 예매 회차 선택시 특정 회차의 날짜 보여줌
		$("input[name='ticketingRound'").on('change', function(){
			// 회차선택시 날짜, 매수 초기화
			$("#showDate option:eq(0)").prop('selected', true);
			
			$("input[name='ticketingAmount']").prop('checked', false);
			
			$("#ticketingPayamount").attr("value", '');
			
			if ($("#1Round").is(":checked")) {
				$(".round1").show();
				$(".round2").hide();
			}
			if ($("#2Round").is(":checked")) {
				$(".round1").hide();
				$(".round2").show();
			}
		});
		
		// 날짜 선택시 회차 미선택 확인, 매수 초기화
		// 날짜 선택시 해당 날짜,회차 별 예매가능 인원에 따라, 예매 매수를 제한함
		// 남은 인원 1 일때 1매만 가능
		// 남은 인원 0 일때 예매불가
		$("#showDate").on('change', function(){
			if (!$("input[name='ticketingRound']").is(':checked')) {
				alert("회차를 선택하지 않았습니다.");
				$("#showDate option:eq(0)").prop('selected', true);
				return false;	
			}
			
			$("input[name='ticketingAmount']").prop('checked', false);
			
			$("#ticketingPayamount").attr("value", '');
			
			let selectedDate = $("#showDate option:selected").text();
			let restTicket = selectedDate.split(':');
			if (restTicket[1] == 1) {// 한좌석 남았을 때 매수 2 비활성화
				alert("한 좌석 남았습니다.");
				$("#1ticket").attr("disabled", false);
				$("#2ticket").attr("disabled", true);
			}else if (restTicket[1] == 0) {// 남은 좌석 없을때 매수선택 비활성화
				alert("남은 좌석이 없습니다.");
				$("#1ticket").attr("disabled", true);
				$("#2ticket").attr("disabled", true);
			}else {// 남은 좌석 2 이상일때 매수선택 모두 활성화
				$("#1ticket").attr("disabled", false);
				$("#2ticket").attr("disabled", false);
			}
		});
		
		// 티켓 매수 선택시 매수에 따라 총 금액 변경, 회차 미선택 날짜 미선택 확인
		$("input[name='ticketingAmount']").on('change', function(){
			if (!$("input[name='ticketingRound']").is(':checked')) {
				alert("회차를 선택하지 않았습니다.");
				$("input[name='ticketingAmount']").prop('checked', false);
				return false;	
			}
			if ($("#showDate option:selected").index() == 0) {
				alert("날짜를 선택하지 않았습니다.");
				$("input[name='ticketingAmount']").prop('checked', false);
				return false;
			}
			// 모든 라디오 순회
			$("input[name='ticketingAmount']").each(function(){
				var val = $(this).val();
				var checked = $(this).prop('checked');
				
				if(checked){
					$("#ticketingPayamount").attr("value", ${showVO.showPrice} * val);	
				}
			});
		});
		
		
		
		
		
		$("#introContent").on("click", function(){
			$("#detailContent").show();
			$("#detailViewGuide").hide();
		});
		
		$("#viewGuide").on("click",function(){
			$("#detailContent").hide();
			$("#detailViewGuide").show();
		});
		
		
	});
</script>
