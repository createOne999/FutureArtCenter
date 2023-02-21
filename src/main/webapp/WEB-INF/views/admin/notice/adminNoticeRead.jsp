<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.content{
	width: 600px;
	height: 450px;
	border: 2px solid #5C350E;
	margin-top: 10px;
	background-color: #FFFFFF;
}
#notice_content {
	width: 100%;
	height: 100%;
	float: left; 
}

#notice_btn{
	text-align: center;
	margin-top: 10px;
}

#notice_btn tr{
	text-align: center;
	border: 0;
}

table{
	border-collapse: collapse;
}

tr{
	width: 600px;
	border-bottom: 1px solid #CCC;
}

tr last:last-child {
	border-bottom: none;
}

.title{
	padding: 10px;
	padding-right: 10px;
	width: 80px;
	background-color: #5C350E;
	color: #FFFFFF;
}

#reg {
	padding: 2px 30px 2px 30px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
}

#btn-delete {
	padding: 2px 30px 2px 30px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
}

#list {
	padding: 2px 30px 2px 30px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
}

#notice_img{
	padding: 5px;
}

.mb-3{
	font-weight: bold;
	font-size: 20px;
	margin-top: 40px;
}
</style>

<div>
<form:form modelAttribute="AdminNoticeVO">
	<form:hidden path="notice_no" />
	<body>
		<h3 class="mb-3">공지사항 상세 페이지</h3>
	</body>
	
	<div class="content">
	<table id="notice_content">
			<div>
		<tr>
      		<td class="title" >번호</td>
			<td>${AdminNoticeVO.notice_no}</td>
			<td><font color="red"><form:errors path="notice_no" /></font></td>
		</tr>
		<tr>
      		<td class="title" >제목</td>
			<td>${AdminNoticeVO.notice_title}</td>
			<td><font color="red"><form:errors path="notice_title" /></font></td>
		</tr>
		<tr>
			<td class="title" >사진</td>
			<td id="notice_img">
			<c:if test="${AdminNoticeVO.notice_poster ne 'none'}">
				<img src="adminNotice_poster?notice_no=${AdminNoticeVO.notice_no }&adminNoticePoster=${AdminNoticeVO.notice_poster}"
					height="250px" width="500px">
			</c:if>
			<c:if test="${AdminNoticeVO.notice_poster eq 'none'}">사진 없음</c:if>
			
				
			</td>
		</tr>
		<tr>
      		<td class="title" >내용</td>
			<td>${AdminNoticeVO.notice_content}</td>
			<td><font color="red"><form:errors path="notice_content" /></font></td>
		</tr>
		<tr>
			<td class="title" >날짜</td>
			<td>${AdminNoticeVO.notice_date}</td>
			<td><font color="red"><form:errors path="notice_date" /></font></td>
		</tr>
	</table>
	</form:form>
	</div>
	<div>
	<table id="notice_btn">
	<tr >
		<td>
		<a href="${path}/admin/notice/modify?notice_no=${AdminNoticeVO.notice_no}"><button type="button" id="reg">수정</button></a>
			<button id="btn-delete"
				onclick="location.href='/admin/notice/delete?notice_no=${AdminNoticeVO.notice_no}'">삭제</button>
			<button type="button" class="btn btn-primary list-btn"
				onclick="location.href='/admin/notice/list'" id="list">목록</button></td>
	</tr>
	</table>
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