<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="main_content" >
	<div id="title_space" >
		<h3>예정공연</h3>
	</div>
	<div id="select_space" >
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item">
				<a class="nav-link" href="/show/showlist">진행중인 공연리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/show/showplan">예정 공연리스트</a>
			</li>
		</ul>
	</div>
	<div id="main_body">
		<div>
			<hr>
			<h4>미디어 목록</h4>
			<c:choose>
				<c:when test="${empty mediaMainList }">
				등록된 미디어 공연이 없습니다.
				</c:when>
				<c:otherwise>
					<%-- 3개만 출력 --%>
					<c:forEach items="${mediaMainList }" var="media" begin="0" end="2" step="1">
						<span style="display:inline-block;  border: 1px solid; height: 450px; vertical-align: top;">
							<a href="/show/detail/showdetailmediaplan?showNo=${media.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
								<img alt="${media.showPoster }" src="poster?show_no=${media.showNo }&showPoster=${media.showPoster}" height="200px">
							</a>
							<hr style="margin: 0">
							<table class="table">
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
			<h4>강연 목록</h4>
			<c:choose>
				<c:when test="${empty talkMainList }">
				등록된 강연이 없습니다.
				</c:when>
				<c:otherwise>
					<%-- 3개만 출력 --%>
					<c:forEach items="${talkMainList }" var="talk" begin="0" end="2" step="1">
						<span style="display:inline-block;  border: 1px solid; height: 450px; vertical-align: top;">
							<a href="/show/detail/showdetailtalkplan?showNo=${talk.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
								<img alt="${talk.showPoster }" src="poster?show_no=${talk.showNo }&showPoster=${talk.showPoster}" height="200px">
							</a>	
							<hr style="margin: 0">					
							<table class="table">
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
				<c:when test="${empty concertMainList }">
				등록된 콘서트가 없습니다.
				</c:when>
				<c:otherwise>
					<%-- 3개만 출력 --%>
					<c:forEach items="${concertMainList }" var="concert" begin="0" end="2" step="1">
						<span style="display:inline-block; border: 1px solid; height: 450px; vertical-align: top;">
							<a href="/show/detail/showdetailconcertplan?showNo=${concert.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
								<img alt="${concert.showPoster }" src="poster?show_no=${concert.showNo }&showPoster=${concert.showPoster}" height="200px">
							</a>
							<hr style="margin: 0">
							<table class="table">
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
		<hr>
		<h4>미디어</h4>
		<table class="table table-bordered">
			<tr>
				<th>공연명</th>
				<th>공연시작일</th>
				<th>공연종료일</th>
				<th>공연관</th>
			</tr>
			<c:choose>
				<c:when test="${empty mediaList }">
					<tr>
						<td colspan="4">
							등록된 미디어가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${mediaList }" var="media">
						<tr>
							<td>
								<a href="/show/detail/showdetailmediaplan?showNo=${media.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
									${media.showName }
								</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showStartdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showClosedate }" /></td>
							<td>1관</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 미디어 페이징 네비게이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<%-- 이전페이지가 존재할 경우 --%>
				<c:if test="${mediaPagination.prev }">
					<li class="page-item">	
						<a class="page-link" aria-label="Previous"  href="/show/showplan?mPage=${mediaPagination.startPage -1}&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 이전페이지가 존재하지 않을 경우 --%>
				<c:if test="${!mediaPagination.prev }">
					<li class="page-item disabled">	
						<a class="page-link" aria-label="Previous"  href="/show/showplan?mPage=${mediaPagination.startPage -1}&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				
				<c:forEach begin="${mediaPagination.startPage }" end="${mediaPagination.endPage }" var="idx">
					<%-- 페이지 번호가 현재일 경우 --%>
					<c:if test="${idx == mediaPagination.pageRequest.page }">
						<li class="page-item active" aria-current="page">
							<span class="page-link">${idx }</span>
						</li>
					</c:if>
					<%-- 페이지 번호가 현재가 아닐경우 --%>
					<c:if test="${idx != mediaPagination.pageRequest.page }">
						<li class="page-item">
							<a class="page-link" href="/show/showplan?mPage=${idx }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">${idx }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<%-- 다음페이지가 존재할 경우 --%>
				<c:if test="${mediaPagination.next && mediaPagination.endPage > 0 }">			
					<li class="page-item">	
						<a class="page-link" aria-label="Next" href="/show/showplan?mPage=${mediaPagination.endPage + 1 }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 다음페이지가 존재하지 않을 경우 --%>
				<c:if test="${!(mediaPagination.next && mediaPagination.endPage > 0) }">
					<li class="page-item disabled">	
						<a class="page-link" aria-label="Next" href="/show/showplan?mPage=${mediaPagination.endPage + 1 }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<hr>
		<h4>강연</h4>
		<table class="table table-bordered">
			<tr>
				<th>공연명</th>
				<th>공연시작일</th>
				<th>공연종료일</th>
				<th>공연관</th>
			</tr>
			<c:choose>
				<c:when test="${empty talkList }">
					<tr>
						<td colspan="4">
							등록된 강연이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${talkList }" var="talk">
						<tr>
							<td>
								<a href="/show/detail/showdetailtalkplan?showNo=${talk.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
								${talk.showName }
								</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showStartdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showClosedate }" /></td>
							<td>1관</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
		<!-- 강연 페이징 네비게이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">	
				<%-- 이전페이지가 존재할 경우 --%>
				<c:if test="${talkPagination.prev }">
					<li class="page-item">
						<a class="page-link" aria-label="Previous" href="/show/showplan?tPage=${talkPagination.startPage -1}&mPage=${mediaPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-label="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 이전페이지가 존재하지 않을 경우 --%>
				<c:if test="${!talkPagination.prev }">
					<li class="page-item disabled">
						<a class="page-link" aria-label="Previous" href="/show/showplan?tPage=${talkPagination.startPage -1}&mPage=${mediaPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-label="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				
				<c:forEach begin="${talkPagination.startPage }" end="${talkPagination.endPage }" var="idx">
					<%-- 페이지 번호가 현재일 경우 --%>
					<c:if test="${idx == talkPagination.pageRequest.page }">
						<li class="page-item active" aria-current="page">
							<span class="page-link">${idx }</span>
						</li>
					</c:if>
					<%-- 페이지 번호가 현재가 아닐 경우 --%>
					<c:if test="${idx != talkPagination.pageRequest.page }">
						<li class="page-item">
							<a class="page-link" href="/show/showplan?tPage=${idx }&mPage=${mediaPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">${idx }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<%-- 다음페이지가 존재할 경우 --%>
				<c:if test="${talkPagination.next && talkPagination.endPage > 0 }">
					<li class="page-item">
						<a class="page-link" aria-label="Next" href="/show/showplan?tPage=${talkPagination.endPage + 1 }&mPage=${mediaPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="ture">&raquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 다음페이지가 존재하지 않을 경우 --%>
				<c:if test="${!(talkPagination.next && talkPagination.endPage > 0) }">
					<li class="page-item disabled">
						<a class="page-link" aria-label="Next" href="/show/showplan?tPage=${talkPagination.endPage + 1 }&mPage=${mediaPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
							<span aria-hidden="ture">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<hr>
		<h4>콘서트</h4>
		<table class="table table-bordered">
			<tr>
				<th>공연명</th>
				<th>공연시작일</th>
				<th>공연종료일</th>
				<th>공연관</th>
			</tr>
			<c:choose>
				<c:when test="${empty concertList }">
					<tr>
						<td colspan="4">
							등록된 콘서트가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${concertList }" var="concert">
						<tr>
							<td>
								<a href="/show/detail/showdetailconcertplan?showNo=${concert.showNo }&mPage=${mediaPagination.pageRequest.page }&tPage=${talkPagination.pageRequest.page}&cPage=${concertPagination.pageRequest.page}">
								${concert.showName }
								</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showStartdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showClosedate }" /></td>
							<td>2관</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</table>
		<!-- 콘서트 페이징 네비게이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<%-- 이전페이지가 존재할 경우 --%>
				<c:if test="${concertPagination.prev }">
					<li class="page-item">
						<a class="page-link" aria-label="Previous" href="/show/showplan?cPage=${concertPagination.startPage -1}&mPage=${mediaPagination.pageRequest.page}&tPage=${talkPagination.pageRequest.page}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 이전페이지가 존재하지 않을 경우 --%>
				<c:if test="${!concertPagination.prev }">
					<li class="page-item disabled">
						<a class="page-link" aria-label="Previous" href="/show/showplan?cPage=${concertPagination.startPage -1}&mPage=${mediaPagination.pageRequest.page}&tPage=${talkPagination.pageRequest.page}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				
				<c:forEach begin="${concertPagination.startPage }" end="${concertPagination.endPage }" var="idx">
					<%-- 페이지 번호가 현재일 경우 --%>	
					<c:if test="${idx == concertPagination.pageRequest.page }">
						<li class="page-item active" aria-current="page">
							<span class="page-link">${idx }</span>
						</li>
					</c:if>
					<%-- 페이지 번호가 현재가 아닐 경우 --%>
					<c:if test="${!(idx == concertPagination.pageRequest.page) }">
						<li class="page-item" aria-current="page">
							<a class="page-link" href="/show/showplan?cPage=${idx }&mPage=${mediaPagination.pageRequest.page}&tPage=${talkPagination.pageRequest.page}">
								${idx }
							</a>
						</li>
					</c:if>
				</c:forEach>
				
				<%-- 다음페이지가 존재할 경우 --%>
				<c:if test="${concertPagination.next && concertPagination.endPage > 0 }">
					<li class="page-item">	
						<a class="page-link" aria-label="Next" href="/show/showplan?cPage=${concertPagination.endPage + 1 }&mPage=${mediaPagination.pageRequest.page}&tPage=${talkPagination.pageRequest.page}">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<%-- 다음페이지가 존재하지 않을 경우 --%>
				<c:if test="${!(concertPagination.next && concertPagination.endPage > 0) }">
					<li class="page-item disabled">	
						<a class="page-link" aria-label="Next" href="/show/showplan?cPage=${concertPagination.endPage + 1 }&mPage=${mediaPagination.pageRequest.page}&tPage=${talkPagination.pageRequest.page}">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div><!-- end main_body -->
</div><!-- end main_content -->
<style>
h4 {
	margin: 0;
}
</style>