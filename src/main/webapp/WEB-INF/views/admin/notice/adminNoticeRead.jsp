<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

table {
	width: 100%;
	font-size: 20px;
	margin-left: 50px;
	border-collapse: collapse; 
	
}

input {
	border: none;
}

.title {
	border-bottom: 1px solid none;
	width: 100px;
	height: 50px;
	color: white;
	text-align: center;
	background-color: #5C350E;
	font-size: 20px;
}

</style>

<div>
<form:form modelAttribute="AdminNoticeVO">
	<form:hidden path="notice_no" />
	<body>
		<h3 class="mb-3">공지사항 상세 페이지</h3>
		<br>
	</body>
	<table>
		<tr>
		<td class="title" >번호</td>
			<td><form:input path="notice_no" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_no" /></font></td>
		</tr>
		<tr>
		<td class="title" >제목</td>
			<td><form:input path="notice_title" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_title" /></font></td>
		</tr>
		<tr>
			<img
				src="adminNotice_poster?notice_no=${AdminNoticeVO.notice_no }&adminNoticePoster=${AdminNoticeVO.notice_poster}"
				height="200px">
		</tr>
		<tr>
		<td class="title" >내용</td>
			<td><form:input path="notice_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_content" /></font></td>
		</tr>
		<tr>
		<td class="title" >날짜</td>
			<td><form:input path="notice_date" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_date" /></font></td>
		</tr>
	</table>
</form:form>
<br>
<div>
	<tr align="center" valign="middle">
		<td><a
			href="${path}/admin/notice/modify?notice_no=${AdminNoticeVO.notice_no}">수정</a>
			<button id="btn-delete"
				onclick="location.href='/admin/notice/delete?notice_no=${AdminNoticeVO.notice_no}'">삭제</button>
			<button type="button" class="btn btn-primary list-btn"
				onclick="location.href='/admin/notice/list'">목록</button></td>
	</tr>
</div>
</div>
<script>
	$(document).ready(function() {

		var formObj = $("#AdminNoticeVo");

		console.log(formObj);

		$("#btnEdit").on("click", function() {
			var notice_no = $("#AdminNoticeNo");
			var notice_noVal = notice_no.val();
			self.location = "modify?notice_no=" + notice_noVal;
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