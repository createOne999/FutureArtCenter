<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

  
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항</title>
    <!--  <style>
        table {
            width: 100%;
            border: 1px solid #444444;
            border-collapse: collapse;
        }
        table th {
            border: 1px solid #444444;
            text-align: center;
            height: 40px;
            background-color: dodgerblue;
            color: cornsilk;
        }
        table td {
            border: 1px solid #444444;
            text-align: center;
        }
    </style> -->
</head>
<body>
<div style="text-align: center;">
    <h1>게시판 목록</h1>
    <table border="1">
        <tr>
		<th align="center" width="80">번호</th>
		<th align="center" width="320">제목</th>
		<th align="center" width="180">등록일</th>
        </tr>
        <c:forEach items="${list}" var="AdminNoticeVO">
            <tr>
                <td>${AdminNoticeVO.notice_no}</td>
                <td class="txt_ct"><a href="${path}/admin/notice/adminNoticeRead?notice_no=${AdminNoticeVO.notice_no}">${AdminNoticeVO.notice_title}</a></td>
                <td><fmt:formatDate value="${AdminNoticeVO.notice_date}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/admin/notice/register">새글 등록</a>
</div>
</body>
</html>
  
  

<%-- <body>
<h3 class="mb-3">공지사항</h3>
</body>
<button type="button" class="btn btn-primary register-btn"
		onclick="location.href='/admin/notice/register'">등록</button>
		<a href="adminNoticeReg">새글 등록</a>
<table border="1">
	<tr>
		<th align="center" width="80">번호</th>
		<th align="center" width="320">제목</th>
		<th align="center" width="180">등록일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="3"></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="AdminNoticeVO">
				<tr>
				<td align="center">${AdminNoticeVO.notice_no}</td>
				<td align="left"><a href="${path}/admin/notice/adminNoticeRead?notice_no=${AdminNoticeVO.notice_no}"><c:out value="${AdminNoticeVO.notice_title}" /></a></td>
				<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${AdminNoticeVO.notice_date}" /></td>
				
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>



<script>
	var result = "${msg}";

	if (result === "SUCCESS") {

	}
</script> --%>