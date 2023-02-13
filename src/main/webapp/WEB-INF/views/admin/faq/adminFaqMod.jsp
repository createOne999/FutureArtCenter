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
    <form th:action="adminFaqMod" th:object="${adminFaqMod}" method="post">
    
    <div>
            <td width="70" style="background-color: dodgerblue; color: cornsilk">제목</td>
            <td><input type="text" name="faq_title"/></td>
        </div>
        <div>
            <td style="background-color: dodgerblue; color: cornsilk">내용</td>
            <td><textarea name="faq_content" cols="40" rows="10"></textarea></td>
        </div>
        
        
        <hr class="my-4">
        
        <button id="btn-modify" onclick="location.href='/admin/faq/adminFaqMod?faq_no=${AdminFaqVO.faq_no}'">수정</button>


        <button class="btn btn-secondary"type="button">
<td class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">취소</a></td>
        </button>

    </form>

</div>
</body>