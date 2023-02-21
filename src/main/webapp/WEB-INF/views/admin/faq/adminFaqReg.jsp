<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>

.faq_submit {
	background-color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

.can {
	background-color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

</style>

<!-- faq 등록 파일 -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
	<div style="text-align: center;">
		<h3>글쓰기</h3>
		<br>
		<hr>
		<form action="adminFaqReg" id="faq_RegForm" method="post">

		
		
			<table style="width: 700px; margin: auto">

				<tr>
					<td width="70"
						style="background-color: #5C350E; color: cornsilk">제목</td>
					<td><input type="text" name="faq_title" id="faq_title" /></td>
				</tr>
				<tr>
					<td style="background-color: #5C350E; color: cornsilk">내용</td>
					<td><textarea id="faq_content" name="faq_content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
				<td style="background-color: #5C350E; color: cornsilk">카테고리</td>
					<td><select name="faq_category">
								<option value="0">예매 / 취소</option>
								<option value="1">결제</option>
								<option value="2">기타</option>
							</select></td>
				</tr>
				<br>
				<tr>
					<td colspan="2" align="center"><button type="submit" id="btn-Reg" class="faq_submit" >등록</button>
						<button class="can">
							<a href="/admin/faq/list">취소</a>
						</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>


<script>

	// faq 등록 버튼
	$(".faq_submit").click(function(){
		 
		if (!$("#faq_title").val()){
			alert("제목을 입력해 주세요");
			return false;
		}
		
		if (!$("#faq_content").val()){
			alert("내용을 입력해 주세요");
			return false;
		}
		
		// faq 메서드 서버 요청
		$("#faq_RegForm").attr("action", "/admin/faq/register");
        $("#faq_RegForm").submit();
       
    })

	//글쓰기
	function fn_addtoBoard() {

		var form = document.getElementById("AdminFaqReg");

		form.action = "<c:url value='/admin/faq/adminFaqList'/>";
		form.submit();

	}

	//목록
	function fn_cancel() {

		var form = document.getElementById("AdminFaqReg");

		form.action = "<c:url value='/admin/faq/adminFaqList'/>";
		form.submit();

	}
</script>