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
             <!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
<td align="center"><a href="/admin/notice/adminNoticeRead${pagination.makeQuery(pagination.pageRequest.page)}&notice_no=${AdminNoticeVO.notice_no}"></a></td>
        
</div>
</body>
</html>
  
  <!-- 페이징 네비게이션 -->
<div>
<c:if test="${pagination.prev}"><a href="${pagination.startPage - 1}">&laquo;</a></c:if>

<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx"><a href="/admin/notice/list${pagination.makeQuery(idx)}">${idx}</a></c:forEach>

<c:if test="${pagination.next && pagination.endPage > 0}"><a href="${pagination.endPage +1}">&raquo;</a></c:if>

</div>