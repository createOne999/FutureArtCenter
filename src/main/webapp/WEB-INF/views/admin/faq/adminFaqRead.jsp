<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form:form modelAttribute="AdminFaqVO">
	<form:hidden path="faq_no" />
	<body>
		<h3 class="mb-3">faq 상세 페이지</h3>
	</body>
	<table>
		<tr>
			<td><form:textarea path="faq_no" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_no" /></font></td>
		</tr>
		<tr>
			<td><form:input path="faq_title" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_title" /></font></td>
		</tr>
		<tr>
			<td><form:textarea path="faq_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_content" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<tr align="center" valign="middle">
		<td>
		
		<a href="${path}/admin/faq/modify?faq_no=${AdminFaqVO.faq_no}">수정</a>
		<button id="btn-delete" onclick="location.href='/admin/faq/delete?faq_no=${AdminFaqVO.faq_no}'">삭제</button>
			<button type="button" class="btn btn-primary list-btn"
				onclick="location.href='/admin/faq/list'">목록</button></td>
	</tr>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#AdminFaqVo");

		console.log(formObj);

		$("#btnEdit").on("click", function() {
			var faq_no = $("#AdminFaqNo");
			var faq_noVal = faq_no.val();
			self.location = "modify?faq_no=" + faq_noVal;
		});
		$("#btnDelete").on("click", function() {
			formObj.attr("action", "delete");
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>