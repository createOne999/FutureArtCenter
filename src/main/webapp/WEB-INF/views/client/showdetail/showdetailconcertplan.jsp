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
</style>
<div class="main_content">
	<!-- 공연번호 저장용 -->
	<form name="showNo" id="showNo" method="post">
		<input type="hidden" name="showNo" value="${showVO.showNo }">
	</form>
	<!-- 공연 정보 -->
	<div class="title_space">
		<h3>예매</h3>
		<a href="/show/showplan?mPage=${mPage }&tPage=${tPage}&cPage=${cPage}" style="display: inline-block; margin-left: auto; ">
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
				<td>2관</td>
			</tr>
			<tr>
				<td>공연금액</td>
				<td>${showVO.showPrice } / 1매</td>
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
	<div>
		<fieldset class="border bg-secondary-subtle col-md-6">
			<fmt:formatDate value="${ticketingStartDate}" pattern="yyyy-MM-dd"/> 일부터 예매 가능합니다.		
		</fieldset>
	</div>
	<!-- 작품소개, 관람안내 -->
	<div class="mt-2">
		<span >
			<input type="button" value="작품소개" id="introContent" name="introContent" class="btn btn-outline-secondary">
		</span>
		<span>
			<input type="button" value="관람안내" id="viewGuide" name="viewGuide" class="btn btn-outline-secondary">
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

</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#detailContent").show();
		$("#detailViewGuide").hide();	

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
