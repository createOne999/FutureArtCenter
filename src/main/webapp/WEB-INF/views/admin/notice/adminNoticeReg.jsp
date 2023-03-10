<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>

.notice_submit {
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
</head>
<body>
	<div style="text-align: center;">
		<h3>글쓰기</h3>
		<hr>
		<form action="register" method="post" enctype="multipart/form-data" id="notice_RegForm">
			<table style="width: 700px; margin: auto">

				<tr>
					<td width="70"
						style="background-color: #5C350E; color: cornsilk">제목</td>
					<td><input type="text" name="notice_title" id="notice_title" /></td>
				</tr>
				<tr>
					<td width="70"
						style="background-color: #5C350E; color: cornsilk">포스터</td>
					<td class="col2"><img id="posterIMG" /></td>
					<td class="col3"><input type="file" name="poster"
						id="notice_poster" onchange="readURL(this);" /></td>
				</tr>
				<tr>
					<td style="background-color: #5C350E; color: cornsilk">내용</td>
					<td><textarea name="notice_content" cols="40" rows="10" id="notice_content"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<a href="#" class="btn-gradient red"><input type="submit" class="notice_submit" value="등록" /></a>
						<button class="can">
							<a href="/admin/notice/list">취소</a>
						</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

<script>

//notice 등록 버튼
$(".notice_submit").click(function(){
	 
	if (!$("#notice_title").val()){
		alert("제목을 입력해 주세요");
		return false;
	}
	
	if (!$("#notice_content").val()){
		alert("내용을 입력해 주세요");
		return false;
	}
	
	// notice 메서드 서버 요청
	$("#notice_RegForm").attr("action", "/admin/notice/register");
    $("#notice_RegForm").submit();
   
})

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