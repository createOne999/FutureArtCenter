<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style>
/* 부트스트랩 방지 */
#header .header_login *{
    text-decoration: none;
}
#header .header_nav *{
    text-decoration: none;
    color: #000000;
}
#header .menu_main li a:hover{
	color: #ccb6a3;
}
#header h1{
	font-size: 2em;
}
/* 기본 css가 부트스트랩에 영향 방지 */
.slide{
	height: auto;
	top: 0;
	padding-top: 0;
	overflow: auto;
}
.nav-pills .nav-link.active{
	background-color: #ccb6a3;
}
.nav{
	--bs-nav-link-color: #000000;
}
.nav-link:hover{
	color: var(--bs-nav-pills-link-active-color);
	background-color: #ccb6a3;
}
.header_title h1{
	margin-bottom: 0;
	font-weight: bold;
}
.table {
    --bs-table-color: var(--bs-body-color);
    --bs-table-bg: transparent;
    --bs-table-border-color: var(--bs-border-color);
    --bs-table-accent-bg: transparent;
    --bs-table-striped-color: var(--bs-body-color);
    --bs-table-striped-bg: rgba(204, 182, 163, 0.3);
    --bs-table-active-color: var(--bs-body-color);
    --bs-table-active-bg: rgba(0, 0, 0, 0.1);
    --bs-table-hover-color: var(--bs-body-color);
    --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
    width: 100%;
    margin-bottom: 1rem;
    color: var(--bs-table-color);
    vertical-align: top;
    border-color: #ccb6a3;
}
.carousel-indicators{
	position: static;
}
</style>
<div id="main_content" >
	<div id="title_space"><h3>공연예매</h3></div>
	<div id="select_space">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/show/showlist">진행중인 공연리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/show/showplan">예정 공연리스트</a>
			</li>
		</ul>
	</div>
	<div id="main_body">
		<div>
			<hr>
			<h4>미디어 목록</h4>
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				<c:choose>
					<c:when test="${empty mediaList }">
					등록된 미디어 공연이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach items="${mediaList }" var="media" varStatus="status">
							<c:if test="${status.count == 1 }">
								<div class="carousel-indicators">
							</c:if>
								<c:if test="${status.count % 3 == 1 and status.count != 1}">
									<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
									<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${slideNum}" aria-label="slide ${slideNum}" style="filter: invert(100%);"></button>
								</c:if>
								<c:if test="${status.count == 1 }">
									<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
									<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${slideNum}" aria-current="true" aria-label="slide ${slideNum}" class="active" style="filter: invert(100%);"></button>
								</c:if>
							<c:if test="${status.last }">
								</div><%-- carousel-indicators end --%>
							</c:if>
						</c:forEach>
						<c:forEach items="${mediaList }" var="media" varStatus="status">
							<c:if test="${status.count == 1 }">
								<div class="carousel-inner">
							</c:if>
								<c:if test="${status.count % 3 == 1 && status.count != 1 }">
									<div class="carousel-item">
								</c:if>
								<c:if test="${status.count == 1 }">
									<div class="carousel-item active">
								</c:if>
								<span style="display:inline-block;  border: 1px solid; height: 450px; vertical-align: top;" class="bg-secondary-subtle">
									<a href="/show/detail/showdetailmedia?showNo=${media.showNo }">
										<img alt="${media.showPoster }" src="poster?show_no=${media.showNo }&showPoster=${media.showPoster}" height="200px">
									</a>
									<hr style="margin: 0">
									<table class="table table-striped">
										<tr>
											<td align="center" style="font-weight: bold;">공연명</td><td>${media.showName }</td>
										</tr>
										<tr>
											<td align="center" style="font-weight: bold;">공연 시작일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showStartdate }" /></td>
										</tr>
										<tr>
											<td align="center" style="font-weight: bold;">공연 종료일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${media.showClosedate }" /></td>
										</tr>
										<tr>
											<td align="center" style="font-weight: bold;">공연관</td><td>1관</td>
										</tr>
										<tr>
											<c:choose>
												<c:when test="${media.showRound == 1 }">
													<td align="center" style="font-weight: bold;">공연 시간</td><td>${media.showTime1 }</td>
												</c:when>
												<c:when test="${media.showRound == 2 }">
													<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>${media.showTime1 }</td>
													</tr><tr>
													<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>${media.showTime2 }</td>
												</c:when>
												<c:otherwise>
													<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>
								</span>
								<c:if test="${status.count % 3 == 0 || status.last}">
									</div><%-- carousel-item end --%>
								</c:if>
							<c:if test="${status.last }">	
								</div><%-- class inner end --%>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev" style="filter: invert(100%);">
	   				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	   				<span class="visually-hidden">Previous</span>
	 			 </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next" style="filter: invert(100%);">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
			</div>
		</div>
		<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
			<hr>
			<h4>강연목록</h4>
			<c:choose>
				<c:when test="${empty talkList }">
				등록된 강연이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${talkList }" var="talk" varStatus="status">
						<c:if test="${status.count == 1 }">
							<div class="carousel-indicators">
						</c:if>
							<c:if test="${status.count % 3 == 1 and status.count != 1}">
								<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
								<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="${slideNum}" aria-label="slide ${slideNum}" style="filter: invert(100%);"></button>
							</c:if>
							<c:if test="${status.count == 1 }">
								<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
								<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="${slideNum}" aria-current="true" aria-label="slide ${slideNum}" class="active" style="filter: invert(100%);"></button>
							</c:if>
						<c:if test="${status.last }">
							</div><%-- carousel-indicators end --%>
						</c:if>
					</c:forEach>
					<c:forEach items="${talkList }" var="talk" varStatus="status">
						<c:if test="${status.count == 1 }">
							<div class="carousel-inner">
						</c:if>
							<c:if test="${status.count % 3 == 1 && status.count != 1 }">
								<div class="carousel-item">
							</c:if>
							<c:if test="${status.count == 1 }">
								<div class="carousel-item active">
							</c:if>
						<span style="display:inline-block;  border: 1px solid; height: 450px; vertical-align: top;" class="bg-secondary-subtle">
							<a href="/show/detail/showdetailtalk?showNo=${talk.showNo }">
								<img alt="${talk.showPoster }" src="poster?show_no=${talk.showNo }&showPoster=${talk.showPoster}" height="200px">
							</a>
							<hr style="margin: 0">
							<table class="table table-striped">
								<tr>
									<td align="center" style="font-weight: bold;">공연명</td><td>${talk.showName }</td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 시작일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showStartdate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 종료일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${talk.showClosedate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연관</td><td>1관</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${talk.showRound == 1 }">
											<td align="center" style="font-weight: bold;">공연 시간</td><td>${talk.showTime1 }</td>
										</c:when>
										<c:when test="${talk.showRound == 2 }">
											<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>${talk.showTime1 }</td>
											</tr><tr>
											<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>${talk.showTime2 }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</span>
						<c:if test="${status.count % 3 == 0 || status.last}">
							</div><%-- carousel-item end --%>
						</c:if>
						<c:if test="${status.last }">	
							</div><%-- class inner end --%>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev" style="filter: invert(100%);">
   				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
   				<span class="visually-hidden">Previous</span>
 			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next" style="filter: invert(100%);">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		</div>
		<div id="carouselExampleIndicators3" class="carousel slide" data-bs-ride="carousel">
			<hr>
			<h4>콘서트 목록</h4>
			
			<c:choose>
				<c:when test="${empty concertList }">
				등록된 콘서트가 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${concertList }" var="concert" varStatus="status"> 
						<c:if test="${status.count == 1 }">
							<div class="carousel-indicators">
						</c:if>
							<c:if test="${status.count % 3 == 1 and status.count != 1}">
								<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
								<button type="button" data-bs-target="#carouselExampleIndicators3" data-bs-slide-to="${slideNum}" aria-label="slide ${slideNum}" style="filter: invert(100%);"></button>
							</c:if>
							<c:if test="${status.count == 1 }">
								<fmt:parseNumber var="slideNum" value="${(status.count / 3) -  (status.count / 3) % 1}" integerOnly="true" />
								<button type="button" data-bs-target="#carouselExampleIndicators3" data-bs-slide-to="${slideNum}" aria-current="true" aria-label="slide ${slideNum}" class="active" style="filter: invert(100%);"></button>
							</c:if>
						<c:if test="${status.last }">
							</div><%-- carousel-indicators end --%>
						</c:if>
					</c:forEach>
					<c:forEach items="${concertList }" var="concert" varStatus="status"> 
						<c:if test="${status.count == 1 }">
							<div class="carousel-inner">
						</c:if>
							<c:if test="${status.count % 3 == 1 && status.count != 1 }">
								<div class="carousel-item">
							</c:if>
							<c:if test="${status.count == 1 }">
								<div class="carousel-item active">
							</c:if>
						<span style="display:inline-block; border: 1px solid; height: 450px; vertical-align: top; " class="bg-secondary-subtle">
							<a href="/show/detail/showdetailconcert?showNo=${concert.showNo }">
								<img alt="${concert.showPoster }" src="poster?show_no=${concert.showNo }&showPoster=${concert.showPoster}" height="200px">

							</a>
							<hr style="margin: 0">
							<table class="table table-striped">
								<tr>
									<td align="center" style="font-weight: bold;">공연명</td><td>${concert.showName }</td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 시작일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showStartdate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연 종료일</td><td><fmt:formatDate pattern="yyyy-MM-dd" value="${concert.showClosedate }" /></td>
								</tr>
								<tr>
									<td align="center" style="font-weight: bold;">공연관</td><td>2관</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${concert.showRound == 1 }">
											<td align="center" style="font-weight: bold;">공연 시간</td><td>${concert.showTime1 }</td>
										</c:when>
										<c:when test="${concert.showRound == 2 }">
											<td align="center" style="font-weight: bold;">1차 공연 시간</td><td>${concert.showTime1 }</td>
											</tr><tr>
											<td align="center" style="font-weight: bold;">2차 공연 시간</td><td>${concert.showTime2 }</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">회차번호가 잘못되었습니다. 관리자에게 문의해 주세요.</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</span>
						<c:if test="${status.count % 3 == 0 || status.last}">
								</div><%-- carousel-item end --%>
							</c:if>
						<c:if test="${status.last }">	
							</div><%-- class inner end --%>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators3" data-bs-slide="prev" style="filter: invert(100%);">
   				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
   				<span class="visually-hidden">Previous</span>
 			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators3" data-bs-slide="next" style="filter: invert(100%);">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		</div>
	</div><!-- end main_body -->
</div><!-- end main_content -->
<style>
h4 {
	margin: 0;
}
</style>