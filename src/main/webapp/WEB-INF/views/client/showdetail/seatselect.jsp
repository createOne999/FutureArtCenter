<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiles Layout Main</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 배열 선언
		let arr = [];
		
		// 좌석 checkbox 클릭시 이벤트
		$("input[name='seat']").change(function(){
			//선택한 좌석 checkbox 의 개수
			var count = $("input:checked[name='seat']").length;
			
			// 선택한 좌석 개수 > 티켓매수 일때 선택불가
			if (count > $("input[name='ticketingAmount']:checked", opener.document).val()) {
				$(this).prop("checked", false);
				alert("더이상 선택할 수 없습니다.");
			}
			// 체크박스 체크시 red, 아닐시 기본 색상처리
			if ($(this).is(":checked")) {
				$(this).parent().css('background-color', 'red');
				arr.push($(this).val());
			}else if(!$(this).is(":checked")){
				$(this).parent().css('background-color','white');
				// 해제시 배열에서 제거
				arr.splice($.inArray($(this).val(), arr), 1);
			}
		});
		
		
		// 좌석 선택 버튼 클릭
		$("#seatselect").on("click", function(){
			
			console.log(arr);
			// 체크한 값의 크기만큼 부모창으로 보내기
			$("#ticketingSit1", opener.document).val(arr[0]);
			if ($("input[name='ticketingAmount']:checked", opener.document).val() == 2) {
				$("#ticketingSit2", opener.document).val(arr[1]);
			}
			
			window.close();
		});
		
	});
</script>
<style>
 html,body {
    width:100%;
    height:100%;
    margin:0px;
    padding:0px;
    font-family:sans-serif;
} 

 *{
    padding: 0;
    margin: 0 ;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    color: #000000;
}
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
footer {
	padding-top:20px;
	width: 100%;
	height: 100px;
	background-color: #696969;
	bottom: 0;
	left: 0;
	position : absolute;
}  
 html,body {
    width:100%;
    height:100%;
    margin:0px;
    padding:0px;
    font-family:sans-serif;
    min-height: 500px;
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
body {
	text-align:center;
    vertical-align:middle;
}
fieldset {
	display: inline-block;
    vertical-align:middle;
}

</style>
</head>
<body>
<table border="1" class="table table-bordered">
	<tr>
		<td colspan="13" align="center" height="50px">무대</td>
	</tr>
	<%-- 줄반복 --%>
	<c:forEach begin="1" end="5" var="i">
		<tr>
			<%-- 열반복 --%>
			<c:forEach begin="1" end="10" var="j">
				<%-- 왼쪽 복도 --%>
				<c:if test="${i == 1 and j == 1 }">
					<td rowspan="5">
						복<br>
						도
					</td>
				</c:if>
				<%-- 좌석이 이미 선택 되었는지 확인 --%>
				<c:set var="restSitCheck" value="0" />
				<c:forEach items="${restSitList }" var="restSit">
					<c:if test="${restSitCheck == 0 }">	
						<c:if test="${restSit == (i-1)*10 + j }">
							<c:set var="restSitCheck" value="1" />
						</c:if>
					</c:if>
				</c:forEach>
				
				<%-- 좌석이 이미 선택시 orange 배경처리 --%>
				<c:choose>
					<c:when test="${restSitCheck == 1 }">			
						<td style="background-color: orange; vertical-align: middle; text-align: center;">
							<label for="sit${(i-1)*10 + j }" style="height: 30px; width: 30px; display: inline-block; ">${(i-1)*10+j }</label>
							<input type="checkbox" name="seat" id="sit${(i-1)*10 +j }" class="seat" value="${(i-1)*10 + j }" disabled="disabled" style="display: none;">
						</td>
					</c:when>
					<c:otherwise>
						<td style="vertical-align: middle; text-align: center;">
							<label for="sit${(i-1)*10 + j }" style="height: 30px; width: 30px; display: inline-block; ">${(i-1)*10+j }</label>
							<input type="checkbox" name="seat" id="sit${(i-1)*10 +j }" class="seat" value="${(i-1)*10 + j }" style="display: none;" >
						</td>
					</c:otherwise>
				</c:choose>
				<%-- 가운데 복도 --%>
				<c:if test="${i == 1 and j == 5 }">
					<td rowspan="5">
						복<br>
						도
					</td>
				</c:if>
				<%-- 오른쪽 복도 --%>
				<c:if test="${i == 1 and j == 10 }">
					<td rowspan="5">
						복<br>
						도
					</td>
				</c:if>
			</c:forEach><%-- 열반복 종료 --%>
		</tr>
	</c:forEach><%-- 줄반복 종료 --%>
	<tr>
		<td colspan="5"></td>
		<td colspan="3" align="center">입구</td>
		<td colspan="5"></td>
	</tr>
</table>
<h5>좌석을 예매할 매수만큼 선택해 주세요.</h5>
<div>
	<fieldset style="width:200px;" class="border bg-secondary-subtle col-md-6">
		<legend>색 구분</legend>
		<table>
			<tr>
				<td><input type="color" value="#FF0000" disabled="disabled" class="form-control form-control-color"></td>
				<td><label>선택한 좌석</label></td>
			</tr>
			<tr>
				<td><input type="color" value="#FF7F00" disabled="disabled" class="form-control form-control-color"></td>
				<td><label>예매된 좌석</label></td>
			</tr>
			<tr>
				<td><input type="color" value="#FFFFFF" disabled="disabled" class="form-control form-control-color"></td>
				<td><label>남은 좌석</label></td>
			</tr>
		</table>
		
	</fieldset>
</div>
<input type="button" value="선택완료" name="seatselect" id="seatselect" class="btn btn-outline-secondary">
<!-- 푸터 부분 -->	
<footer>
	<tiles:insertAttribute name="footer" />
</footer>
</body>
</html>