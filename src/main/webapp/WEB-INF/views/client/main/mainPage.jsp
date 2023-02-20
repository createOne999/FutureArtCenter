<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MainPage</title>
		<script src="https://kit.fontawesome.com/b6529ca95b.js" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/js/main/main.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	   	<script type="text/javascript" src="/js/main/slide.js"></script>
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
<style>
.faq_title {
    text-align: center;
    color: #000000;
    font-size: 20px;
    height: 20%;
}
.faq {
    width: 40%;
    height: 70%;
    float: right;
}
.n_article a:hover{
	color: #ccb6a3;
    font-weight: bold;
}
</style>
<body onload="fullset(),call_js()">
	<!-- page ONE -->
    <section id="fullpage">
         <div class='quick'>
            <ul></ul>
        </div>
        <!-- page TWO -->
        <div class="fullsection full2" pageNum="2">
          	<div class="slide">
                <div class="slideshow">
                    <a href="/show/showlist"><img src="/image/poster1.jpg" alt="slide1" /></a>
                    <a href="/show/showlist"><img src="/image/poster2.jpg" alt="slide2" /></a>
                    <a href="/show/showlist"><img src="/image/poster3.jpg" alt="slide3" /></a>
                    <a href="/show/showlist"><img src="/image/poster4.jpg" alt="slide4" /></a>
                    <a href="/show/showlist"><img src="/image/poster5.jpg" alt="slide5" /></a>
                    <a href="/show/showlist"><img src="/image/poster6.jpg" alt="slide6" /></a>
                    <a href="/show/showlist"><img src="/image/poster7.jpg" alt="slide7" /></a>
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
        				<%-- 공지사항 출력 --%>
        				<c:forEach items="${noticeList}" var="NoticeVO" varStatus="status">
        					<%-- 최대 4개 까지 출력 --%>
        					<c:if test="${status.count <= 4 }">
	        					<div id="n_line">
	        						<p class="n_article"><a href="${path}/notice/noticeDetail?notice_no=${NoticeVO.notice_no}">${NoticeVO.notice_title}</a></p>
	        						<p class="date"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${NoticeVO.notice_date}" /></p>
	        					</div>
        					</c:if>
        				</c:forEach>
        			</div>
        		</div>
        		<div class="faq">
        			<p class="faq_title">
        				FAQ
        			</p>
        			<div id="faq_article">
        				<%-- 공지사항 출력 --%>
        				<c:forEach items="${faqList}" var="FAQVO" varStatus="status">
        					<%-- 최대 4개 까지 출력 --%>
        					<c:if test="${status.count <= 4 }">
	        					<div id="n_line">
	        						<p class="n_article">
	        							<a href="/faq/faqlist">
	        							<c:if test="${FAQVO.faq_category==0}">[예매] &nbsp&nbsp</c:if>
										<c:if test="${FAQVO.faq_category==1}">[환불 / 취소] &nbsp&nbsp</c:if>
										<c:if test="${FAQVO.faq_category==2}">[기타] &nbsp&nbsp</c:if>
										${FAQVO.faq_title}
										</a>
									</p>		
	        					</div>
        					</c:if>
        				</c:forEach>
        			</div>
        		</div>
       		</div><!-- end content-bottom -->
		</div>
    </section>
    <!-- ==section== -->
</body>
</html>