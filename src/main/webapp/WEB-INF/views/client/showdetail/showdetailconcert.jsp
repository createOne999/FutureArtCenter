<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="main_content">
	<!-- 공연번호 저장용 -->
	<form action="/ticketing/concertpayment" method="post" id="ticketingForm" name="ticketingForm" >
		<input type="hidden" name="showNo" value="${showVO.showNo }">

		<!-- 공연 정보 -->
		<div class="title_space">
			<h3>예매</h3>
		</div>
		<div class="post_space" style="display: inline-block; border: 1px solid; vertical-align: middle;">${showVO.showPoster }</div>
		<div class="select_space" style="display: inline-block; vertical-align: middle;">
			<table border="1">
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
					<td>1회차: ${showVO.showTime1 }<br> 
					<c:if test="${not empty showVO.showTime2 }">
					2회차: ${showVO.showTime2 }
					</c:if>
					</td>
				</tr>
				<tr>
					<td>공연관</td>
					<td>2관</td>
				</tr>
				<tr>
					<td>공연금액</td>
					<td>${showVO.showPrice }/ 1매</td>
				</tr>
				<tr>
					<td>아티스트</td>
					<td>${showVO.concertArtist }</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${showVO.concertGenre }</td>
				</tr>
				<tr>
					<td>밴드명</td>
					<td>${showVO.concertBandname }</td>
				</tr>
			</table>
		</div>
		<!-- 예매단 -->
		<c:if test="${user.user_id == null or user.user_id == ''}">
			<div>
				<fieldset>
					<div align="center">
						<h4>로그인 후에 예매 할 수 있습니다.</h4>
					</div>
				</fieldset>
			</div>
		</c:if>
		<c:if test="${user.user_id != null and user.user_id != '' }">
			<div>
				<fieldset>
					<table border="1" style="text-align: center;">
						<tr>
							<td>
								<!-- 예매 가능 날짜 --> 
								<select id="showDate" name="showDate">
									<c:forEach items="${ticketingDateList }" var="date">
										<option value="<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />">
											=====<fmt:formatDate pattern="yyyy-MM-dd" value="${date }" />=====
										</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<c:choose>
									<c:when test="${showVO.showRound == 2 }">
										회차선택 1회차 ${showVO.showTime1 }
										<input type="radio" id="1Round" name="ticketingRound" value="1" >
										<br>
										회차선택 2회차 ${showVO.showTime2 }
										<input type="radio" id="2Round" name="ticketingRound" value="2">
									</c:when>
									<c:otherwise>
										회차 ${showVO.showTime1 }
										<input type="radio" id="1Round" name="ticketingRound" value="1" checked="checked">
									</c:otherwise>
								</c:choose></td>
							<td>
								좌석1 : <input type="text" id="ticketingSit1" name="ticketingSit1" readonly="readonly" ><br>
								좌석2 : <input type="text" id="ticketingSit2" name="ticketingSit2" readonly="readonly" disabled="disabled"><br>
								<input type="button" value="좌석선택" id="seatbtn" name="seatbtn"><br> 
							</td>
						</tr>
						<tr>
							<td>
							매수선택 1매 <input type="radio" id="1ticket" name="ticketingAmount" value="1"> <br> 
							매수선택 2매 <input type="radio" id="2ticket" name="ticketingAmount" value="2">
							</td>
							<td colspan="2">
								총금액 : <input type="text" id="ticketingPayamount" readonly="readonly">
								<input type="button" value="예매하기" id="ticketing_btn" name="ticketing_btn">
							</td>
						</tr>
					</table>
				</fieldset>
	
			</div>
		</c:if>
		<!-- 작품소개, 관람안내 -->
		<div>
			<span> 
				<input type="button" value="작품소개" id="content">
			</span> 
			<span> 
				<input type="button" value="관람안내" id="viewGuide">
			</span>
		</div>
		<!-- 상세내용 -->
		<div id="detail">
			<div id="detailContent">
				${showVO.showContent1 }
				${showVO.showContent2 }
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
					<p>좌석 안내</p><br>
					<table border="1">
						<tr>
							<td colspan="13">무대</td>
						</tr>
						<tr>
							<td rowspan="5">길</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td rowspan="5">길</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td rowspan="5">길</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
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
						1) 본 공연은 전석 지정 좌석제로 운영되며 지정된 좌석 이외에 다른 좌석으로 이동하실 수 없습니다.<br>
						2) 1인 1매 티켓을 소지하여야 입장이 가능합니다. 티켓 미소지 시 어떠한 사유로도 입장이 불가합니다.<br>
						3) 입장은 공연 시작 1시간 전부터 진행되며 현장 진행 상황에 따라 변동될 수 있습니다.<br>
						4) 공연 시작 후에는 입장이 제한될 수 있습니다.<br>
						5) 공연 시작 후에는 원활한 운영과 다른 관객들의 관람을 방해하지 않기 위해 지정된 시간에만 입장이 가능합니다.<br>
						6) 공연장 내 생수를 제외한 음료 및 음식물 반입이 금지 되어 있으며 꽃다발, 풍선, LED 등은 반입이 불가합니다.
						7) 본인의 부주의로 인한 분실, 도난 등에는 책임을 지지 않으니 귀중품 보관에 유의해 주시기 바랍니다.<br>
						8) 공연중 사진 및 동영상 촬영, 녹음, 영상 중계 등 저작권을 침해하는 모든 행위를 금지합니다. 적발시 녹음, 녹취된 자료 삭제 및 퇴장 조치되오니 협조 부탁드립니다.<br>
						9) 타 관람객의 관람에 불편이 되는 행동, 공연 중 이동 및 퇴장은 삼가해 주시기 바랍니다.<br>
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
		
		$("#ticketing_btn").on("click", function(){
			const dateInputString = $("#showDate").val();
			const dateInput = new Date(dateInputString);
			
			if(!$("input[name='ticketingAmount']").is(':checked')){
				alert("매수선택을 선택하지 않았습니다.");
				return false;
			}
			if (!$("input[name='ticketingRound']").is(':checked')) {
				alert("회차를 선택하지 않았습니다.");
				return false;	
			}
			if (!$("#ticketingSit1").val()) {
				alert("좌석을 선택하지 않았습니다.");
				return false;
			}
			if ($("#2ticket").is(':checked')) {
				if(!$("#ticketingSit2").val()){
					alert("2번째 좌석을 선택하지 않았습니다.");
					return false;
				}
			}
			
			const chkTicketing = confirm("결제페이지로 이동합니다.");
			
			if (chkTicketing) {
				$("input[name='showDate']").val(Date.parse(dateInput));
				$("#ticketingForm").attr("action", "/ticketing/concertpayment");
				$("#ticketingForm").attr("target", "_self");
				$("#ticketingForm").submit();	
			}
		});
		
		$("input[name='ticketingAmount']").change(function(){
			// 모든 라디오 순회
			$("input[name='ticketingAmount']").each(function(){
				var val = $(this).val();
				var checked = $(this).prop('checked');
				
				if(checked){
					$("#ticketingPayamount").attr("value", ${showVO.showPrice} * val);
					
				}
				if (val == 2) {
					if(checked){
						$("#ticketingSit2").attr("disabled", false);
					}else{
						$("#ticketingSit2").attr("disabled", true);
					}
				}
			});
		});
		
		$("#seatbtn").on("click", function(){
			const pop_title = "좌석선택";
			
			if(!$("input[name='ticketingAmount']").is(':checked')){
				alert("매수선택을 선택하지 않았습니다.");
				return false;
			}
			if (!$("input[name='ticketingRound']").is(':checked')) {
				alert("회차를 선택하지 않았습니다.");
				return false;	
			}
			
			
			window.open("",pop_title, "_blank");
			let ticketingFrm = document.ticketingForm;
			ticketingFrm.action = "/show/detail/seatselect";
			ticketingFrm.method = "post";
			ticketingFrm.target = pop_title;
			ticketingFrm.submit();
		});
		
		$("#content").on("click", function(){
			$("#detailContent").show();
			$("#detailViewGuide").hide();
		});
		
		$("#viewGuide").on("click",function(){
			$("#detailContent").hide();
			$("#detailViewGuide").show();
		});
		
	});
</script>
