<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="main_content" width="100%" height="66%">
	<div id="title_space" width="80%" height="5%"><h3>공연예매</h3></div>
	<div id="select_space" width="80%" height="15%">
		<span width="50%"><a href="/show/showlist">진행중인 공연리스트</a></span> <span width="50%"><a href="/show/showplan">예정 공연리스트</a></span>
	</div>
	
	<div id="main_body">
		<div>
			<hr>
			<h4>미디어 목록</h4>
			<c:choose>
				<c:when test="${empty mediaList }">
				등록된 미디어 공연이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${mediaList }" var="media">
						<span style="display:inline-block;  border: 1px solid; height: 360px; vertical-align: top;">
							<a href="/show/detail/showdetailmedia?showNo=${media.showNo }">
								<img alt="${media.showPoster }" src="poster?show_no=${media.showNo }&showPoster=${media.showPoster}" height="200px">
							</a>
							<hr style="margin: 0">
							<table>
								<tr>
									<td align="center" style="font-weight: bold;">공연명</td><td>:</td><td>${media.showName }</td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 시작일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showStartdate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 종료일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showClosedate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연관</td><td>:</td><td>1관</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${media.showRound == 1 }">
											<td align="center" style="font-weight: bold;">공연 시간</td><td>:</td><td>${media.showTime1 }</td>
										</c:when>
										<c:when test="${media.showRound == 2 }">
											<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>: </td><td>${media.showTime1 }</td>
											</tr><tr>
											<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>: </td><td>${media.showTime2 }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</span>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<hr>
			<h4>강연목록</h4>
			<c:choose>
				<c:when test="${empty talkList }">
				등록된 강연이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${talkList }" var="talk">
						<span style="display:inline-block;  border: 1px solid; height: 360px; vertical-align: top;">
							<a href="/show/detail/showdetailtalk?showNo=${talk.showNo }">
								<img alt="${talk.showPoster }" src="poster?show_no=${talk.showNo }&showPoster=${talk.showPoster}" height="200px">
							</a>
							<hr style="margin: 0">
							<table>
								<tr>
									<td align="center" style="font-weight: bold;">공연명</td><td>:</td><td>${talk.showName }</td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 시작일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showStartdate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 종료일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showClosedate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연관</td><td>:</td><td>1관</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${talk.showRound == 1 }">
											<td align="center" style="font-weight: bold;">공연 시간</td><td>:</td><td>${talk.showTime1 }</td>
										</c:when>
										<c:when test="${talk.showRound == 2 }">
											<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>: </td><td>${talk.showTime1 }</td>
											</tr><tr>
											<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>: </td><td>${talk.showTime2 }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</span>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<hr>
			<h4>콘서트 목록</h4>
			<c:choose>
				<c:when test="${empty concertList }">
				등록된 콘서트가 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${concertList }" var="concert">
						<span style="display:inline-block; border: 1px solid; height: 360px; vertical-align: top; ">
							<a href="/show/detail/showdetailconcert?showNo=${concert.showNo }">
								<img alt="${concert.showPoster }" src="poster?show_no=${concert.showNo }&showPoster=${concert.showPoster}" height="200px">

							</a>
							<hr style="margin: 0">
							<table>
								<tr>
									<td align="center" style="font-weight: bold;">공연명</td><td>:</td><td>${concert.showName }</td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 시작일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showStartdate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 종료일</td><td>:</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showClosedate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연관</td><td>:</td><td>2관</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${concert.showRound == 1 }">
											<td align="center" style="font-weight: bold;">공연 시간</td><td>:</td><td>${concert.showTime1 }</td>
										</c:when>
										<c:when test="${concert.showRound == 2 }">
											<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>: </td><td>${concert.showTime1 }</td>
											</tr><tr>
											<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>: </td><td>${concert.showTime2 }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</span>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div><!-- end main_body -->
</div><!-- end main_content -->
<style>
h4 {
	margin: 0;
}
</style>