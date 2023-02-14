<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home test</title>
		<link rel="stylesheet" type="text/css" href="/css/adminNav.css">
		<script type="text/javascript">
		 function collapse(element) {
	            let before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
	            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
	                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
	                before.classList.remove("active");                  // 버튼 비활성화
	            }
	            element.classList.toggle("active");         // 활성화 여부 toggle

	            let content = element.nextElementSibling;
	            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
	                content.style.maxHeight = null;         // 접기
	            } else {
	                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
	            }
	        }

		</script>
	</head>
	<body>
		<div class="main_aside">
			<div class="nav_body">
				<button type="button" class="collapsible" onclick="collapse(this);">공연 관리</button>
			    <div class="sub_menu">
			        <p><a href="/admin/main">공연정보</a></p>
				</div>
				<button type="button" class="collapsible" onclick="collapse(this);">예매 좌석조회</button>
			    <div class="sub_menu">
			        <p><a href="#">1관 예매 좌석조회</a></p>
			        <p><a href="#">2관 예매 좌석조회</a></p>
				</div>
				<button type="button" class="collapsible" onclick="collapse(this);">매출 현황</button>
			    <div class="sub_menu">
			        <p><a href="/admin/sales/adminSalesList">예매 현황 리스트</a></p>
			        <p><a href="/admin/sales/adminRefundList">환불 정보</a></p>
			        <p><a href="#">월별 매출 현황</a></p>
			        <p><a href="#">주간 예약 현황</a></p>
				</div>
				<button type="button" class="collapsible" onclick="collapse(this);">회원 현황</button>
			    <div class="sub_menu">
			        <p><a href="/admin/user/list">가입 회원 정보</a></p>
			        <p><a href="/admin/user/chart">회원 통계</a></p>
				</div>
				<button type="button" class="collapsible" onclick="collapse(this);">게시판 관리</button>
			    <div class="sub_menu">
			        <p><a href="/admin/notice/list">공지사항</a></p>
			        <p><a href="/admin/faq/list">FAO</a></p>
				</div>
			</div>
		</div>
	</body>
	
	
</html>