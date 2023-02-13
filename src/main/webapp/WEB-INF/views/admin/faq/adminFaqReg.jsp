<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- faq 등록 파일 -->

 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>글쓰기</title>
</head>
<body>
<div style="text-align: center;">
<h3>글쓰기</h3>
<hr>
<form action="register" method="post">
    <table style="width: 700px; margin: auto">
    
        <tr>
            <td width="70" style="background-color: dodgerblue; color: cornsilk">제목</td>
            <td><input type="text" name="faq_title"/></td>
        </tr>
        <tr>
            <td style="background-color: dodgerblue; color: cornsilk">내용</td>
            <td><textarea name="faq_content" cols="40" rows="10"></textarea></td>
        </tr>
        <tr>
            <td width="70" style="background-color: dodgerblue; color: cornsilk">카테고리</td>
            <td><input type="text" name="faq_category"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록"/>
                <button><a href="/admin/faq/list">취소</a></button>
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>

<script>

//글쓰기
function fn_addtoBoard(){
    
    var form = document.getElementById("AdminFaqReg");
    
    form.action = "<c:url value='/admin/faq/adminFaqList'/>";
    form.submit();
    
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("AdminFaqReg");
    
    form.action = "<c:url value='/admin/faq/adminFaqList'/>";
    form.submit();
    
}
</script>