<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	#columnchart_material{
		margin-top: 40px;
	}
	
	#year{
		margin-top: 40px;
	}
</style>

<div id="columnchart_material" style="width: 800px; height: 500px;">
	
</div>
<div>
	<select id="year">
		<%-- 가입 연도값으로 select 생성, 선택한 select 로 차트 데이터 변경 --%>
		<c:forEach items="${UserMonthList }" var="monthList" varStatus="status">
			<c:set var="month" value="${fn:split(monthList.MONTH, '-') }" />
			<c:if test="${month[1] == 1 and status.count == 1}">
				<option value="<fmt:parseNumber integerOnly="true" value="${(status.count -1)/12}" />" selected="selected">20${month[0] }년</option>
			</c:if>
			<c:if test="${month[1] == 1 and status.count != 1}">
				<option value="<fmt:parseNumber integerOnly="true" value="${(status.count -1)/12}" />">20${month[0] }년</option>
			</c:if>
		</c:forEach>
	</select>
</div>

<script type="text/javascript">
$(document).ready(function(){
	// 구글 막대 차트 로딩
	google.charts.load('current', {'packages':['bar']}).then(function(){
		var data = [];
		<%-- 차트 데이터 전처리 --%>
		<c:forEach items="${UserMonthList }" var="monthList" varStatus="status">
			<%-- 연도와 월 구분 --%>
			<c:set var="month" value="${fn:split(monthList.MONTH, '-') }" />
			<%-- 1월일 경우 변수 선언 value = 연도별로 구분 --%>
			<c:if test="${month[1] == 1 }">
		data[<fmt:parseNumber integerOnly="true" value="${(status.count -1)/12}" />] = google.visualization.arrayToDataTable([
		 ['Month', '회원가입', '탈퇴한 회원']
			</c:if>
		,['${monthList.MONTH }', ${monthList.REGISTERED_USERS }, ${monthList.REGOUTED_USERS }]
			<%-- 12월일 경우 닫기 --%>
			<c:if test="${month[1] == 12 }">
		]);
			</c:if>
		</c:forEach>
	
	//google.charts.setOnLoadCallback(drawChart);
	var selectedyear = 0; // 선택된 연도 순서 0, 1 ,2
	var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	var options = {
		    chart: {title: '월별 회원 통계',uration: 100 }
		     };
	var year = document.getElementById('year');// select 값 가져오기
	year.addEventListener('change', drawChart, false);// 차트 값 변경 이벤트

	drawChart();
	function drawChart() {
		selectedyear = year.options[year.selectedIndex].value; // 선택된 연도의 번호 저장
		console.log(selectedyear);
		chart.draw(data[selectedyear], google.charts.Bar.convertOptions(options));
	}
	});
});
</script>
