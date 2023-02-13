<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<div>
<button type="button" class="btn btn-primary list-btn" onclick="location.href='/future/futurePublicDetail'">미래의 전당 소개</button>
<button type="button" class="btn btn-primary list-btn" onclick="location.href='/future/concertHallPublicDetail'">공연장 안내</button>
<button type="button" class="btn btn-primary list-btn" onclick="location.href='/future/wayPublicDetail'">오시는 길</button>
</div>
<body>
<h3 class="mb-3">오시는 길</h3>
<br />대중교통 이용방법(버스번호와 노선, 지하철 정류장과 출구)
<br />주차안내 : 주차비용 안내
<br />지도 삽입(카카오지도)
</body>
</html>