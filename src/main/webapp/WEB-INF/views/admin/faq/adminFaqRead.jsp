<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>


table {
width:100%;
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

.content {
	border: 1px solid none;
	width: 500px;
	border: thin;
}

input {
	border: none;
}

#btn-delete {
	width: 50px;
	background-color: #CD853F;
	border: none;
	border-radius: 5px;
}

.btnbtn-primarylist-btn {
	width: 50px;
	background-color: #CD853F;
	border: none;
	border-radius: 5px;
	
}

.one{
	width: 50px;
	background-color: #CD853F;
	border: none;
	color: black;
	border-radius: 5px;
}

.mb-3{
	text-align: center;
}

</style>
<div>
<form:form modelAttribute="AdminFaqVO">
	<form:hidden path="faq_no" />
	<body>
		<h3 class="mb-3">faq 상세 페이지</h3>
		<br><br>
	</body>
	<table>
		<tr>
		<td class="title" >번호</td>
			<td class="content"><form:input path="faq_no" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_no" /></font></td>
		</tr>
		<tr>
		<td class="title">제목</td>
			<td class="content"><form:input path="faq_title" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_title" /></font></td>
		</tr>
		<tr>
		<td class="title">내용</td>
			<td class="content"><form:input path="faq_content" readonly="true" /></td>
			<td><font color="red"><form:errors path="faq_content" /></font></td>
		</tr>
	</table>
</form:form>

<div>
		<br><br>
		<button type="button" class="one"><a href="${path}/admin/faq/modify?faq_no=${AdminFaqVO.faq_no}">수정</a></button>
		<button id="btn-delete" onclick="location.href='/admin/faq/delete?faq_no=${AdminFaqVO.faq_no}'">삭제</button>
			<button type="button" class="btnbtn-primarylist-btn"
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