<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

  
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>faq</title>
    
</head>
<body>
<div style="text-align: center;">
    <h1>faq 목록</h1>
    <table border="1">
        <tr>
		<th align="center" width="320">제목</th>
        </tr>
        <c:forEach items="${list}" var="AdminFaqVO">
            <tr>
                <td class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">${AdminFaqVO.faq_title}</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/admin/faq/register">새글 등록</a>
</div>
</body>
</html>