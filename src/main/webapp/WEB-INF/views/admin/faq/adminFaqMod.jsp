<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


 <!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
</head>
<body>
<div class="container">
    <div class="py-5 text-center">
        <h2>faq 수정</h2>
    </div>
    <form th:action="adminFaqMod" th:object="${adminFaqMod}" method="post" id="faq_ModForm">
    
    <input type="hidden" name="faq_no" value="${AdminFaqVO.faq_no}">
    
    <div>
            <td width="70" style="background-color: dodgerblue; color: cornsilk">제목</td>
            <td><input type="text" name="faq_title" id="faq_title" /></td>
        </div>
        <div>
            <td style="background-color: dodgerblue; color: cornsilk">내용</td>
            <td><textarea name="faq_content" cols="40" rows="10" id="faq_content" ></textarea></td>
        </div>
        <tr>
				<td>카테고리</td>
					<td><select name="faq_category">
								<option value="0">예매 / 취소</option>
								<option value="1">결제</option>
								<option value="2">기타</option>
							</select></td>
				</tr>
        
        
        <hr class="my-4">
        
        <button type="button" id="btn-modify" class="faq_sub">수정</button>


        <button class="btn btn-secondary" type="button">
<td class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">취소</a></td>
        </button>

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