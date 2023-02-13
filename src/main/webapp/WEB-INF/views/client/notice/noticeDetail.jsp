<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form:form modelAttribute="NoticeVO">
	<form:hidden path="notice_no" />
	<body>
		<h3 class="mb-3">공지사항 상세 페이지</h3>
	</body>
	<table>
		<tr>
			<td><form:input path="notice_no" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_no" /></font></td>
		</tr>
		<tr>
			<td><form:input path="notice_title" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_title" /></font></td>
		</tr>
		<tr>
			<td><a
				href='FileDownloadAction.bo?file_name=${AdminNoticeVO.notice_poster}'>${AdminNoticeVO.notice_poster}</a></td>
			<img
				src="notice_poster?notice_no=${NoticeVO.notice_no }&noticePoster=${NoticeVO.notice_poster}"
				height="200px">
		</tr>
		<tr>
			<td><form:textarea path="notice_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_content" /></font></td>
		</tr>

		<tr>
			<td><form:input path="notice_date" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_date" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="button" class="btn btn-primary list-btn"
		onclick="location.href='/notice/noticeList'">목록</button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#NoticeVo");

		console.log(formObj);

		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>