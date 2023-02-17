<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
 table {
            width: 100%;
            border: 1px solid #444444;
            border-collapse: collapse;
        }
        table th {
            border: 1px solid #444444;
            text-align: center;
            height: 30px;
            background-color: #5C350E;
            color: cornsilk;
        }
        table td {
            border: 1px solid #444444;
            text-align: center;
        }       
    </style>
</head>

<body>
<h3 class="mb-3">공지사항</h3>
</body>
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
			<c:forEach items="${list}" var="NoticeVO">
				<tr>
				 <!-- <th scope="row">${NoticeVO.notice_no}</th> -->
					 <td>${NoticeVO.notice_no}</td>
					 <td align="left"><a href="${path}/notice/noticeDetail?notice_no=${NoticeVO.notice_no}">${NoticeVO.notice_title}</a></td>
					
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${NoticeVO.notice_date}" /></td> 
							
<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
<a href="/notice/noticeDetail${pagination.makeQuery(pagination.pageRequest.page)}&notice_no=${NoticeVO.notice_no}"></a>

							
									
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<!-- 페이징 네비게이션 -->
<div>
<c:if test="${pagination.prev}"><a href="${pagination.startPage - 1}">&laquo;</a></c:if>

<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx"><a href="/notice/noticeList${pagination.makeQuery(idx)}">${idx}</a></c:forEach>

<c:if test="${pagination.next && pagination.endPage > 0}"><a href="${pagination.endPage +1}">&raquo;</a></c:if>

</div>
</html>

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {

	}
</script>