<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.content{
	width: 450px;
	height: 300px;
	border: 2px solid #5C350E;
	margin-top: 10px;
	background-color: #FFFFFF;
}
#faq_content {
	width: 100%;
	height: 100%;
	float: left; 
}

#faq_btn{
	text-align: center;
	margin-top: 10px;
}

#faq_btn tr{
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

.title{
	padding: 10px;
	padding-right: 10px;
	width: 80px;
	background-color: #5C350E;
	color: #FFFFFF;
}

#modify_btn {
	padding: 2px 20px 2px 20px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
	font-size: 15px;
}

#btn-delete {
	padding: 2px 20px 2px 20px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
}

#list_btn {
	padding: 2px 20px 2px 20px;
	margin-right: 15px;
	background-color: #000000;
	color: #FFFFFF;
}

.mb-3{
	font-weight: bold;
	font-size: 20px;
	margin-top: 40px;
}

#one{
	height: 40px;
}
</style>
<div>
<form:form modelAttribute="AdminFaqVO">
	<form:hidden path="faq_no" />
	<body>
		<h3 class="mb-3">faq</h3>
	</body>
	<div class="content">
	<table id="faq_content">
		<tr id="one">
			<td class="title" >번호</td>
			<td>${AdminFaqVO.faq_no}</td>
			<td><font color="red"><form:errors path="faq_no" /></font></td>
		</tr>
		<tr>
			<td class="title">제목</td>
			<td>${AdminFaqVO.faq_title}</td>
			<td><font color="red"><form:errors path="faq_title" /></font></td>
		</tr>
		<tr>
			<td class="title">내용</td>
			
			<td>${AdminFaqVO.faq_content}</td>
			<td><font color="red"><form:errors path="faq_content" /></font></td>
		</tr>
	</table>
	</form:form>
	</div>
	
	

<div>
		<br><br>
		<a href="${path}/admin/faq/modify?faq_no=${AdminFaqVO.faq_no}" id="modify_btn">수정</a>
		<button id="btn-delete" onclick="location.href='/admin/faq/delete?faq_no=${AdminFaqVO.faq_no}'">삭제</button>
			<button type="button" id="list_btn"
				onclick="location.href='/admin/faq/list'">목록</button>
				
</div>
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