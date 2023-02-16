<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<input type="button" value="선택완료" name="seatselect" id="seatselect" class="btn btn-outline-secondary">