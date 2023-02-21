<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

table {
width:60%;
	font-size: 15px;
	margin-left: 50px;
	border-collapse: collapse; 
}



.title {
	border-bottom: 1px solid none;
	width: 100px;
	height: 50px;
	color: white;
	text-align: center;
	background-color: #5C350E;
}

.list-btn {
	background-color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

input {
	border: none;
}

textarea {
    width: 80%;
    height: 15em;
    border: none;
    resize: none;
  }

</style>


<form:form modelAttribute="NoticeVO">
	<form:hidden path="notice_no" />
	<body>
		<h3 class="mb-3">공지사항 상세 페이지</h3>
	</body>
	<table>
			<c:if test="${NoticeVO.notice_poster ne 'none'}">
				<img
					src="notice_poster?notice_no=${NoticeVO.notice_no }&noticePoster=${NoticeVO.notice_poster}"
					height="200px">
			</c:if>
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
		<td class="title" >내용</td>
			<td><form:textarea path="notice_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_content" /></font></td>
		</tr>

		<tr>
		<td class="title" >날짜</td>
			<td><form:input path="notice_date" readonly="true" /></td>
			<td><font color="red"><form:errors path="notice_date" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="button" class="list-btn"
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

<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
 <style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
  </style>