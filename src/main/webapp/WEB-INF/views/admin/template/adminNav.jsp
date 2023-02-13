<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home test</title>
		<link rel="stylesheet" type="text/css" href="/css/adminNav.css">
		<script type="text/javascript">
			$(function(){
				$('.nav_main > li').click(function(){
					$('.sub_nav').stop().slideUp()
					$(this).find('.sub_nav').stop().slideToggle();
				});
			})
		</script>
	</head>
	<body>
		<div class="main_aside">
			<nav>
				<ul class="nav_main">
					<li class="main"><a href="/admin/main">공연 관리</a>
						<ul class="sub_nav">
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
						</ul>
					</li>
					
					<li class="main"><a href="/admin/main">예매 좌석 조회</a>
						<ul class="sub_nav">
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
						</ul>
					</li>
					
					<li class="main"><a href="/admin/main">매출 현황</a>
						<ul class="sub_nav">
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
						</ul>
					</li>
					
					<li class="main"><a href="/admin/main">회원 현황</a>
						<ul class="sub_nav">
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
						</ul>
					</li>
					
					<li class="main"><a href="/admin/notice/list">게시판 관리</a>
						<ul class="sub_nav">
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
							<li><a href="#">서브메뉴</a></li>
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- <div class="article_first">
				<a href="/admin/main">공연 관리</a>
			</div>
			<div class="article_second">
				<a href="/admin/main">예매 좌석 조회</a>
			</div>
			<div class="article_third">
				<a href="/admin/main">매출 현황</a>
			</div>
			<div class="article_fourth">
				<a href="/admin/main">회원 현황</a>
			</div>
			<div class="article_five">
				<a href="/admin/main">게시판 관리</a>
			</div> -->
		</div>
	</body>
	
	
</html>