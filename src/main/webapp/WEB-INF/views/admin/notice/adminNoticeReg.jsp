<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판 등록 파일 -->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/css/media/adminMediaReg.css">

<script src="/js/notice/adminNoticeReg.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $
		{
			"#AdminNoticeVO"
		}
		;

		function getOriginalName(fileName) {
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
	});
</script>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>글쓰기</h3>
		<hr>
		<form action="register" method="post" enctype="multipart/form-data">
			<table style="width: 700px; margin: auto">

				<tr>
					<td width="70"
						style="background-color: dodgerblue; color: cornsilk">제목</td>
					<td><input type="text" name="notice_title" /></td>
				</tr>
				<tr>
					<td class="col1">포스터</td>
					<td class="col2"><img id="posterIMG" /></td>
					<td class="col3"><input type="file" name="poster"
						id="notice_poster" onchange="readURL(this);" /></td>
				</tr>
				<tr>
					<td style="background-color: dodgerblue; color: cornsilk">내용</td>
					<td><textarea name="notice_content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td width="70"
						style="background-color: dodgerblue; color: cornsilk">날짜</td>
					<td><input type="date" name="notice_date" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록" />
						<button>
							<a href="/admin/notice/list">취소</a>
						</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

<script>
	//글쓰기
	function fn_addtoBoard() {

		var form = document.getElementById("AdminNoticeReg");

		form.action = "<c:url value='/admin/notice/adminNoticeList'/>";
		form.submit();

	}

	//목록
	function fn_cancel() {

		var form = document.getElementById("AdminNoticeReg");

		form.action = "<c:url value='/admin/notice/adminNoticeList'/>";
		form.submit();

	}
</script>