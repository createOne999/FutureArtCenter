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
	
	#sales{
		margin-top: 40px;
	}
</style>
<div id="columnchart_material" style="width: 800px; height: 500px;">

</div>

<div>
	<select id="sales">
		<c:forEach items="${AdminSalesMonth}" var="salesMonthList" varStatus="status">
			<c:set var="month" value="${fn:split(salesMonthList.MONTH, '-') }" />
			<c:if test="${month[1] == 1 and status.count == 1}">
				<option value="<fmt:parseNumber integerOnly="true" value="${(status.count -1)/12}" />" selected="selected">20${month[0] }년</option>
			</c:if>
		</c:forEach>
	</select>
</div>

<script type="text/javascript">
$(document).ready(function(){
	google.charts.load('current', {'packages':['bar']}).then(function(){
		var data = [];
		<c:forEach items="${AdminSalesMonth}" var="saleMonthList" varStatus="status">
			<c:set var="month" value="${fn:split(saleMonthList.MONTH, '-') }" />
			<c:if test="${month[1] == 1 }">
		data[<fmt:parseNumber integerOnly="true" value="${(status.count -1)/12}" />] = google.visualization.arrayToDataTable([
		 ['Month', '월별 매출현황']
			</c:if>
		,['${saleMonthList.MONTH }', ${saleMonthList.TICKET}]
			<c:if test="${month[1] == 12 }">
		]);
			</c:if>
		</c:forEach>
	
	//google.charts.setOnLoadCallback(drawChart);
	var selectedyear = 0;
	var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	var options = {
		    chart: {title: '월별 매출 통계',uration: 100 } ,
		    vAxis: {format:'decimal'}
		     };
	var sales = document.getElementById('sales');
	sales.addEventListener('change', drawChart, false);
	
	
	
	drawChart();
	function drawChart() {
		selectedyear = sales.options[sales.selectedIndex].value;
		console.log(selectedyear);
		chart.draw(data[selectedyear], google.charts.Bar.convertOptions(options));
	}
	});
});
</script>