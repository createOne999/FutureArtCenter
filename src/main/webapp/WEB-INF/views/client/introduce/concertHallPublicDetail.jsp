<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.future {
	background-color: #FFFFFF;
	color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

.concertHall {
	background-color: #ccb6a3;
	color: #FFFFFF;
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
<meta charset="UTF-8">
<div>
<button type="button" class="future" onclick="location.href='/future/futurePublicDetail'">미래의 전당 소개</button>
<button type="button" class="concertHall" onclick="location.href='/future/concertHallPublicDetail'">공연장 안내</button>
<button type="button" class="way" onclick="location.href='/future/wayPublicDetail'">오시는 길</button>
</div>
<body>
</br>
<h3 class="mb-3">공연장 안내</h3>
<img src="../image/좌석_0001.png" class="sit1" width="750" height="600">
<img src="../image/좌석_0002.png" class="sit2" width="750" height="600">
<br />
<br />
<br />
</body>
</html>