<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판 수정 -->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/media/adminMediaReg.css">

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
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
</head>
<body>
	<div class="container">
		<div class="py-5 text-center">
			<h2>게시글 수정</h2>
		</div>
		<form th:action="adminNoticeMod" th:object="${adminNoticeMod}"
			method="post" enctype="multipart/form-data" id="notice_ModForm">

			<div>
				<td width="70" style="background-color: dodgerblue; color: cornsilk">제목</td>
				<td><input type="text" name="notice_title" id="notice_title" /></td>
			</div>
			<div>
				<tr>
					<td class="col1">포스터</td>
					<td class="col2"><img id="posterIMG" /></td>
					<td class="col3"><input type="file" name="poster"
						id="notice_poster" onchange="readURL(this);" /></td>
				</tr>
			</div>
			<div>
				<td style="background-color: dodgerblue; color: cornsilk">내용</td>
				<td><textarea name="notice_content" cols="40" rows="10" id="notice_content" ></textarea></td>
			</div>
			


			<hr class="my-4">
			
			

			<button type="button" id="btn-modify" class="notice_sub">수정</button>


			<button class="btn btn-secondary" type="button">
				<td class="txt_ct"><a
					href="${path}/admin/notice/adminNoticeRead?notice_no=${AdminNoticeVO.notice_no}">취소</a></td>
			</button>

		</form>

	</div>
</body>

<script>

//faq 등록 버튼
$(".notice_sub").click(function(){
	 
	if (!$("#notice_title").val()){
		alert("제목을 입력해 주세요");
		return false;
	}
	
	if (!$("#notice_content").val()){
		alert("내용을 입력해 주세요");
		return false;
	}
	
	// faq 메서드 서버 요청
	$("#notice_ModForm").attr("action", "/admin/faq/adminNoticeMod");
    $("#notice_ModForm").submit();
   
})

</script>