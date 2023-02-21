<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#come{
width:800px;
}
.subway {font-family:"Comic Sans MS"; color:#5C350E; text-align: left;}
.subway1 {font-family:"Comic Sans MS"; color:green; text-align: right;}
.subway2 {font-family:"Comic Sans MS"; color:green; text-align: right;}
.bus {font-family:"Comic Sans MS"; color:#5C350E; text-align: left;}
.bus1 {font-family:"Comic Sans MS"; color:blue; text-align: right;}
.car {font-family:"Comic Sans MS"; color: #5C350E; text-align: center;}

.future {
	background-color: #FFFFFF;
	color: #ccb6a3;
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
	background-color: #ccb6a3;
	color: #FFFFFF;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

</style>
</head>
<body>
<div>
<button type="button" class="future" onclick="location.href='/future/futurePublicDetail'">미래의 전당 소개</button>
<button type="button" class="concertHall" onclick="location.href='/future/concertHallPublicDetail'">공연장 안내</button>
<button type="button" class="way" onclick="location.href='/future/wayPublicDetail'">오시는 길</button>
</div>

</br>
<div id="come">
<h3 class="mb-3">오시는 길</h3>

<h2><div class="subway">지하철</div></h2>
<div class="subway1">2호선 왕십리역 11번 출구</div>
<div class="subway2">도보 1분</div></br>
<h2><div class="bus">버스</div></h2>
<div class="bus1">왕십리역(04135) 463, 2016, 4211</div>
<div class="bus1">왕십리2동 주민센터(04109) 302, 463, 2012, 2013, 2014, 2016</div>
<br />
<div class="car">주차는 지하 1층에 주차하여 주시고 주차비용은 나가실 때 영수증을 보여주시면 무료로 사용 가능 합니다.</div>
<br />
<br />
<br />
</div>

<img src="../image/소개페이지 지도_0006.png" class="sit1" width="750" height="500">
<br />
<br />
</body>
</html>