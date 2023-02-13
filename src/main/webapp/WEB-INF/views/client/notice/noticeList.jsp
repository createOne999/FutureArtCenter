<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
									
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>



<script>
	var result = "${msg}";

	if (result === "SUCCESS") {

	}
</script>