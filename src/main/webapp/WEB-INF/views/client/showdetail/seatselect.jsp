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
			if (arr.length == 2) {
				$("#ticketingSit2", opener.document).val(arr[1]);
			}
			
			window.close();
		});
		
	});
</script>
<table border="1">
	<%-- 줄반복 --%>
	<c:forEach begin="1" end="5" var="i">
		<tr>
			<%-- 열반복 --%>
			<c:forEach begin="1" end="10" var="j">
				<%-- 좌석이 되었는지 확인 --%>
				<c:set var="restSitCheck" value="0" />
				<c:forEach items="${restSitList }" var="restSit">
					<c:if test="${restSitCheck == 0 }">
						<c:choose>
							<c:when test="${restSit == (i-1)*10 + j }">
								<c:set var="restSitCheck" value="1" />
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach>
				<%-- 좌석이 이미 선택시 orange 배경처리 --%>
				<c:choose>
					<c:when test="${restSitCheck == 1 }">			
						<td style="background-color: orange">
							<label for="sit${(i-1)*10 + j }">${(i-1)*10+j }</label>
							<input type="checkbox" name="seat" id="sit${(i-1)*10 +j }" class="seat" value="${(i-1)*10 + j }" disabled="disabled" style="visibility: hidden;">
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<label for="sit${(i-1)*10 + j }">${(i-1)*10+j }</label>
							<input type="checkbox" name="seat" id="sit${(i-1)*10 +j }" class="seat" value="${(i-1)*10 + j }" style="visibility: hidden;" >
						</td>
					</c:otherwise>
				</c:choose>
			</c:forEach><%-- 열반복 종료 --%>
		</tr>
	</c:forEach><%-- 줄반복 종료 --%>
</table>
<input type="button" value="선택완료" name="seatselect" id="seatselect">