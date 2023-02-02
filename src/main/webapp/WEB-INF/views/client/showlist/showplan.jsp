<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="main_content" width="100%" height="66%">
	<div id="title_space" width="80%" height="5%">
		<h3>예정공연</h3>
	</div>
	<div id="select_space" width="80%" height="15%">
		<span width="50%"><a href="/show/showlist">진행중인 공연리스트</a></span> <span
			width="50%"><a href="/show/showplan">예정 공연리스트</a></span>
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
						<span style="display:inline-block;  border: 1px solid;">
							<a href="/show/detail/showdetailmediaplan?showNo=${media.showNo }">
								${media.showPoster }
							</a>
							<br>
							공연명: ${media.showName }<br> 
							공연 시작일: <fmt:formatDate pattern="yyyy-MM-dd" value="${media.showStartdate }" /><br>
							공연 종료일: <fmt:formatDate pattern="yyyy-MM-dd" value="${media.showClosedate }" /><br>
							공연관: 1관<br>
							<c:choose>
								<c:when test="${media.showRound == 1 }">
									공연 시간: ${media.showTime1 }<br>
								</c:when>
								<c:when test="${media.showRound == 2 }">
									1차 공연 시간: ${media.showTime1 }<br>
									2차 공연 시간: ${media.showTime2 }<br>
								</c:when>
								<c:otherwise>
									회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.
								</c:otherwise>
							</c:choose>
						</span>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<hr>
			<h4>강연 목록</h4>
			<c:choose>
				<c:when test="${empty talkList }">
				등록된 강연이 없습니다.
			</c:when>
				<c:otherwise>
					<c:forEach items="${talkList }" var="talk">
						<span style="display:inline-block;  border: 1px solid">
							<a href="/show/detail/showdetailtalkplan?showNo=${talk.showNo }">
								${talk.showPoster }
							</a>		
							<br>				
							공연명: ${talk.showName }<br> 
							공연 시작일: <fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showStartdate }" /><br>
							공연 종료일: <fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showClosedate }" /><br>
							공연관: 1관<br>
							<c:choose>
								<c:when test="${talk.showRound == 1 }">
									공연 시간: ${talk.showTime1 }<br>
								</c:when>
								<c:when test="${talk.showRound == 2 }">
									1차 공연 시간: ${talk.showTime1 }<br>
									2차 공연 시간: ${talk.showTime2 }<br>
								</c:when>
								<c:otherwise>
									회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.
								</c:otherwise>
							</c:choose>
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
						<span style="display:inline-block; border: 1px solid">
							<a href="/show/detail/showdetailconcertplan?showNo=${concert.showNo }">
								${concert.showPoster }
							</a>
							<br>
							공연명: ${concert.showName }<br> 
							공연 시작일: <fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showStartdate }" /><br>
							공연 종료일: <fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showClosedate }" /><br>
							공연관: 2관<br>
							<c:choose>
								<c:when test="${concert.showRound == 1 }">
									공연 시간: ${concert.showTime1 }<br>
								</c:when>
								<c:when test="${concert.showRound == 2 }">
									1차 공연 시간: ${concert.showTime1 }<br>
									2차 공연 시간: ${concert.showTime2 }<br>
								</c:when>
								<c:otherwise>
									회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.
								</c:otherwise>
							</c:choose>					
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