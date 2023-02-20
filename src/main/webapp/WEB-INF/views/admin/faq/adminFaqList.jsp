<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

  
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FutureArtCenter</title>
	<link rel="stylesheet" type="text/css" href="/css/faq/adminFaqList.css">
</head>
<body>
<div class="content">
	<div class="well">
		<div class="title">
		    <p class="sub-header">faq 목록</p>
		</div>
		<div class="reg">
	    	<a href="/admin/faq/register">새글 등록</a>
	    </div>
    </div>
    <table border="1">
        <tr id="col0">
		<th align="center" width="320">제목</th>
        </tr>
        <c:forEach items="${list}" var="AdminFaqVO">
            <tr>
                <td class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">${AdminFaqVO.faq_title}</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>