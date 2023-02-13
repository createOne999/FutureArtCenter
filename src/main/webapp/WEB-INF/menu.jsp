<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div align="center">
	<table>
		<tr>
			<td width="80"><a href="/"></a></td>

			<!-- 공지사항을 메뉴에 추가한다. -->
			<td width="120"><a href="/NoticeVO/list"></a></td>
			
			<!-- FAQ를 메뉴에 추가한다. -->
			<td width="120"><a href="/FAQVO/list"></a></td>
			
			<!-- 관리자 공지사항을 메뉴에 추가한다. -->
			<td width="120"><a href="/AdminNoticeVO/list"></a></td>
			
		</tr>
	</table>
</div>
<hr>