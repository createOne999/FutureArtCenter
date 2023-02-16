<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MainPage</title>
		<script src="https://kit.fontawesome.com/b6529ca95b.js" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/js/main/main.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js" defer="defer"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js" defer="defer"></script>
	   	<script type="text/javascript" src="/js/main/slide.js" defer="defer"></script>
	   	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	</head>
<script>
	// 회원 탈퇴 결과
	var out='${out}';
	if(out==='탈퇴'){
		alert("회원 탈퇴 되었습니다.");
	} 
</script>
<script>
	// 회원 탈퇴 결과
	var success='${success}';
	if(success==='일치'){
		alert("회원 정보가 수정되었습니다.");
	} 
</script>
<body onload="fullset(),call_js()">
	<!-- page ONE -->
    <section id="fullpage">
        <div class='quick'>
            <ul></ul>
        </div>
        <!-- page TWO -->
        <div class="fullsection full2" pageNum="2">
          	<div class="slide">
            	<div class="content_main">
            		<div class="title_img1"><img src="/image/quote1.png" /></div>
            		<p class="title_main1">진행중인 공연/예정 공연</p>
            		<div class="title_img2"><img src="/image/quote2.png" /></div>
            	</div>
                <div class="slideshow">
                    <a href="#"><img src="/image/poster1.jpg" alt="slide1" /></a>
                    <a href="#"><img src="/image/poster2.jpg" alt="slide2" /></a>
                    <a href="#"><img src="/image/poster3.jpg" alt="slide3" /></a>
                    <a href="#"><img src="/image/poster4.jpg" alt="slide4" /></a>
                    <a href="#"><img src="/image/poster5.jpg" alt="slide5" /></a>
                    <a href="#"><img src="/image/poster6.jpg" alt="slide6" /></a>
                    <a href="#"><img src="/image/poster7.jpg" alt="slide7" /></a>
                </div>
                <div class="slideshow_nav">
                    <a href="#" class="prev"><i class="fa-solid fa-arrow-left"></i></a>
                    <a href="#" class="next"><i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
           </div>   
       
        <div class="fullsection full1" pageNum="1">
            <div class="section_body">
                <div class="section_title">
                	<div class="content_main2">
	            		<div class="title_img1"><img src="/image/quote3.png" /></div>
	            		<p class="title_main2">미래의 전당 소개</p>
	            		<div class="title_img2"><img src="/image/quote4.png" /></div>
            		</div>
                    <p class="content">
                    	공연, 전시, 강연 등 다양한 문화 예술 활동을 선보일 새로운 복합문화공간 입니다.
                    	이제 여러분들과 함께 소통하고, 즐길 수 있는 공간으로 도약하고자 합니다.
						기존의 문화재에서 만나던 예술적 가치를 더 새로워진 공간에서 더욱 좋은 문화 콘텐츠와 서비스를 통해
						일상 속 수준높은 문화감성을 제시함으로서 백년의 역사를 계승해나가겠습니다.
                    </p>
                </div>
            </div>
          </div>
        <!-- page THREE -->
        <div class="fullsection full3" pageNum="3">
        	<div class="content_bottom">
        		<div class="notice">
        			<p class="notice_title">
        				NOTICE
        			</p>
        			<div id="notice_article">
        				<div id="n_line">
        					<p class="n_article">갤러리 전시는 무료관람 인가요?</p>
        					<p class="date">2022-01-15</p>
        				</div>
        				<div id="n_line">
	        				<p class="n_article">공연 정보를 알고 싶습니다.</p>
	        				<p class="date">2022-01-15</p>
        				</div>
        				<div id="n_line">
	        				<p class="n_article">예매 취소는 어떻게 하나요?</p>
	        				<p class="date">2022-01-15</p>
        				</div>
        				<div id="n_line">
	        				<p class="n_article">디기디기 당당당 입니다.</p>
	        				<p class="date">2022-01-15</p>
        				</div>
        			</div>
        		</div>
        	  </div>	
    </section>
    <!-- ==section== -->
</body>
</html>