<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

ul, li{
    margin:0;
    padding:0;
    list-style: none;
}  

<!-- 헤더_로그인 -->
.header_login {
    height: 40px;
    background-color: #ccb6a3;
    text-align: end;
    font-size: 17px;
    padding: 0 60px;
    line-height: 40px;
    border-bottom: #f7f0ee;
}

.signup {
	float: center;
	padding: 20px;
	color: #faf0e6;
	width: 140px;
    font-size: 17px;
    font-weight: bold;
}

.user {
	float: center;
	padding: 20px;
	color: #faf0e6;
    font-size: 17px;
    font-weight: bold;
}

<!-- 헤더_메뉴 -->

 .header_main {
    width: 100%;
    position:fixed;
    z-index:100000;
    flex-direction: column;
}

.header_login {
    height: 40px;
    background-color: #ccb6a3;
    text-align: end;
    font-size: 17px;
    padding: 0 60px;
    line-height: 40px;
    border-bottom: #f7f0ee;
}


.header_sub {
	height: 80px;
    display: flex;
    background-color: #FFFFFF;
    justify-content: space-between;
    border-bottom: 1px solid #f7f0ee;
    padding: 0 20px 0 50px;
}

.header_title {
    display: flex;
    margin: 0;
    align-items: center;
}

.header_title img {
    width: 60px;
    height: 60px;
    margin: 0;
}

.header_title h1 {
    color: #ccb6a4;
    padding-left: 20px;
}

/* nav_menu=================== */
 .header_nav {
    margin: 0;
    padding-right: 60px;
    padding-top: 10px;
    transition: all 2s;
}

.header_nav ul{
    display: flex;
}

.menu_main li {
    
    width: 150px;
    font-size: 18px;
    font-weight: bold;
    line-height: 60px;
    text-align: end;
}

.menu_main li a:hover {
	color: #ccb6a3;
	width: 150px;
    font-size: 19px;
    font-weight: bold;
    line-height: 60px;
    text-align: end;
}

.menu_sub {
	display: none;
}

.header_nav:hover .menu_sub {
    width: 100%;
    height: 280px;
    position: absolute;
    background-color: #f0f3ee;
    margin-top: 10px;
    display: block;
    border-radius: 0 0 5px 5px; 
}

.main_active {
    display: block;
}

.menu_sub li {
    width: 140px;
    padding: 15px 0;
    font-size: 15px;
    text-align: center;
    font-weight: 700;
}

.menu_sub li a:hover {
    color: #ccb6a3;
}  
</style>
<header class="header_main">
<!-- 헤더_로그인 -->
	<div class="header_login">
		<c:if test="${user == null }">
				<a class="signup" href="/login/loginForm">로그인</a>
				<a class="signup" href="/user/agreement">회원가입</a>
		</c:if>
		<c:if test="${user != null }">
			<text class="user">( ${user.user_id } )</text>
				<a class="user" href="/login/logout.do">로그아웃</a>
				<a class="user" href="/info/ticketinglist">마이페이지</a>
		</c:if>
	</div>
<!-- 메뉴 부분 -->		
	<div class="header_sub">
    	<div class="header_title">
          <a href="/main"><img src="/image/logo.png"></a>
          <h1>FutureArtCenter</h1>
    	</div>
		<div class="header_nav">
                <ul>
                    <li class="header_menu">
                    	<ul class="menu_main">
		                   	<li><a href="/show/showlist">공연</a></li>
		                   	<li><a href="/future/futurePublicDetail">소개</a></li>
							<li><a href="/notice/noticeList">공지사항</a></li>
							<li><a href="/faq/faqlist">고객센터</a></li>
						</ul>
                    </li>
                </ul>
         </div>
    </div>
</header>