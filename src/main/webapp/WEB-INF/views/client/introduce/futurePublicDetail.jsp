<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.future {
	background-color: #ccb6a3;
	color: #FFFFFF;
	padding: 8px;
	border: 0;
	border-radius: 8px;
	font-size: 15px;
}

.concertHall {
	background-color: #FFFFFF;
	color: #ccb6a3;
	padding: 8px;
	border: 0;
	border-radius: 8px;
	font-size: 15px;
}

.way {
	background-color: #FFFFFF;
	color: #ccb6a3;
	padding: 8px;
	border: 0;
	border-radius: 8px;
	font-size: 15px;
}
</style>

<!DOCTYPE html>
<html>
<div>
	<button type="button" class="future"
		onclick="location.href='/future/futurePublicDetail'">미래의 전당
		소개</button>
	<button type="button" class="concertHall"
		onclick="location.href='/future/concertHallPublicDetail'">공연장
		안내</button>
	<button type="button" class="way"
		onclick="location.href='/future/wayPublicDetail'">오시는 길</button>
</div>
<body>
	<br />
	<div class="fullsection full1" pageNum="1">
		<div class="section_body">
			<div class="section_title">
				<div class="content_main2">
					<div class="title_img1">
						<img src="/image/quote3.png" />
					</div>
					<p class="title_main2">미래의 전당 소개</p>
					<div class="title_img2">
						<img src="/image/quote4.png" />
					</div>
				</div>
				<p class="content">
					<br />2023.01.17 설립 <br />미래의 전당은 남녀노소 누구나 문화생활을 즐길수있으며, <br />다양한
					장르의 공연이 열리고있습니다. <br />미래의 전당은 관객과 소통하고, 더욱 다채롭고 수준높은 문화콘텐츠를 즐길수
					있도록 노력하겠습니다. <br />매주 수요일 휴관일이며, 자세한 문의사항은 010-4624-7139로 연락바랍니다.
				</p>
			</div>
		</div>
	</div>
	<br>
</body>
</html>