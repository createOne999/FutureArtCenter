<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

  
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/css/notice/adminNoticeList.css">
    <title>공지사항</title>
</head>

<body>
<div class="content">
	<div class="well">
		<div class="title">
	    	<p class="sub-header">공지사항 리스트</p>
	    </div>
	    <div class="reg">
	    	<a href="/admin/notice/register"><button type="button" id="notice_reg">새글 등록</button></a>
	    </div>
    </div>
    <table>
        <tr id="col0">
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
     <!-- 페이징 네비게이션 -->
<div class="paging">
<c:if test="${pagination.prev}"><a href="${pagination.startPage - 1}">&laquo;</a></c:if>

<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx"><a href="/admin/notice/list${pagination.makeQuery(idx)}">${idx}</a></c:forEach>

<c:if test="${pagination.next && pagination.endPage > 0}"><a href="${pagination.endPage +1}">&raquo;</a></c:if>

</div>
    
             <!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
<a href="/admin/notice/adminNoticeRead${pagination.makeQuery(pagination.pageRequest.page)}&notice_no=${AdminNoticeVO.notice_no}"></a>
        
</div>
</body>
</html>
  
 