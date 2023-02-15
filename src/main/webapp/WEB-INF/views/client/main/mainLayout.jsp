<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiles Layout Main</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style type="text/css">
#fullscreen {
	width: 100%;
	height: auto;
	min-height: 900px;
	padding-bottom: 80px;
}
#header {
	width: 100%;
	height: 20%;
}
#content {
	width: 100%;
	height: auto;
	min-height: 66%;

}
footer {
	width: 100%;
	height: 80px;
	background-color: #ccb6a3;
	bottom: 0;
	left: 0;
	position : relative;
  	transform : translateY(100%);
}
</style>
</head>
<body>

	<div id="fullscreen">
		<div id="header">
			<tiles:insertAttribute name="header" />
			<div align="center">
				<nav class="navbar navbar-expand-lg bg-body-tertiary">
					<div class="container-fluid">
						<a class="navbar-brand" href="/main">로고</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      						<span class="navbar-toggler-icon"></span>
    					</button>
    					<div class="collapse navbar-collapse" id="navbarSupportedContent">
    						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
    							<li class="nav-item">
    								<a class="nav-link" href="/show/showlist">공연</a>
    							</li>
    							<li class="nav-item">
    								<a class="nav-link" href="/future/futurePublicDetail">소개</a>
    							</li>
    							<li class="nav-item">
    								<a class="nav-link" href="/notice/noticeList">공지사항</a>
    							</li>
    							<li class="nav-item">
    								<a class="nav-link" href="/faq/faqlist">고객센터</a>
    							</li>
    						</ul>
    					</div><!-- end navbarSupportedContent -->
					</div><!-- end container-fluid -->
				</nav>
			</div><!-- end center -->
		</div><!-- end header -->
		<div id="content">
			<div align="center">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>