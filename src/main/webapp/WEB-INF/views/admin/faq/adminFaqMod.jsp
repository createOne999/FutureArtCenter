<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<style>

.faq_sub {
	background-color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

.txt_ct {
	background-color: #ccb6a3;
	padding: 8px;
    border: 0;
    border-radius: 8px;
    font-size: 15px;
}

</style>

 <!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8">
</head>
<body>
<div class="container">
    <div class="py-5 text-center">
        <h2>faq 수정</h2>
    </div>
    <form th:action="adminFaqMod" th:object="${adminFaqMod}" method="post" id="faq_ModForm">
    <table style="width: 700px; margin: auto">
    
    <input type="hidden" name="faq_no" value="${AdminFaqVO.faq_no}">
    
    <div>
    <tr>
            <td width="70" style="background-color: #5C350E; color: cornsilk">제목</td>
            <td><input type="text" name="faq_title" id="faq_title" /></td>
            </tr>
        </div>
        <div>
        <tr>
            <td style="background-color: #5C350E; color: cornsilk">내용</td>
            <td><textarea name="faq_content" cols="40" rows="10" id="faq_content" ></textarea></td>
            </tr>
        </div>
        <tr>
				<td style="background-color: #5C350E; color: cornsilk">카테고리</td>
					<td><select name="faq_category">
								<option value="0">예매 / 취소</option>
								<option value="1">결제</option>
								<option value="2">기타</option>
							</select></td>
				</tr>
        
        
        <hr class="my-4">
        <tr>
        <td colspan="2" align="left">
        <button type="button" id="btn-modify" class="faq_sub">수정</button>
        
		<button type="button" class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">취소</a></button>
        </td>
        </tr>
</table>
    </form>

</div>
</body>
</html>
<script>

//faq 등록 버튼
$(".faq_sub").click(function(){
	 
	if (!$("#faq_title").val()){
		alert("제목을 입력해 주세요");
		return false;
	}
	
	if (!$("#faq_content").val()){
		alert("내용을 입력해 주세요");
		return false;
	}
	
	// faq 메서드 서버 요청
	$("#faq_ModForm").attr("action", "/admin/faq/adminFaqMod");
    $("#faq_ModForm").submit();
   
})

</script>