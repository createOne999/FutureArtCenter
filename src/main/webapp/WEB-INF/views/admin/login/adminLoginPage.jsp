<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Tiles Layout Main</title>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		<script type="text/javascript">
			$("#loginBtn").click(function(){
				if (!$("#adminId").val()) {
					alert("아이디를 입력해주세요");
					return false;
				}
				
				if (!$("#adminPwd").val()) {
					alert("비밀번호를 입력해주세요");
					return false;
				}
				
				$("#admin_login").attr("action", "admin/loginPage");
				$("#admin_login").submit();
			})
			
			<c:if test = "${fail == 0 }">
		    	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
		    </c:if>
		</script>
		<style type="text/css">
						
			*{
				padding: 0;
			    margin: 0 auto;
			    box-sizing: border-box;
			    list-style: none;
			    text-decoration: none;
			}
			
			html,body{
				width:100%;
			    height:100%;
			    margin:0px;
			    padding:0px;
			    font-family:sans-serif;
			}
			
			/* header */
			header{
				width: 100%;
				height: 60px;
				background-color: #FFFFFF;
				border-bottom: 1px solid #f7f0ee;
				position: relative;
				top: o;
			}
			
			.header_top{
				width: 100%;
				height: 45px;
			 	font-size: 17px;
			 	background-color: #ccb6a3;
			 	border-bottom: 1px solid #f7f0ee;
			}
			
			#login{
				float: right;
				line-height: 60px;
				padding-right: 45px;
			    font-weight: bold;
				color: #FFFFFF;
			}
			
			.header_main{
				width: 100%;
			}
			
			.header_bottom{
				width: 75%;
				height: 66px;
			    background-color: #FFFFFF;
			    float: right;
			}
			.logo{
				width: 25%;
				height: 60%;
				float: left;
				padding-left: 45px;
			}
			
			.logo img{
			    width: 60px;
			    height: 60px;
			    margin: 0;
			    float: left;
			}
			
			.logo h2 {
			    color: #ccb6a3;
			    float: left;
			    line-height: 60px;
			}
			
			.nav {
			    margin: 0;
				float: right;
			}
			
			.menu{
				height: 100%;
			    color: #000000;
			}
			
			.menu > li{
				width: 140px;
			    font-size: 15px;
			    font-weight: bold;
			    line-height: 60px;
			    text-align: center;
			    float: left;
			}
		</style>
	</head>
	<body>
		<header>
			<div class="header_main">
				<div class="logo">
					<img src="/image/logo.png">
					<h2>FutureArtCenter</h2>
				</div>
			</div>
		</header>
		
		<h1>관리자 로그인</h1>
		<form:form id="admin_login" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="adminId" id="adminId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="adminPwd" id="adminPwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit" id="loginBtn">로그인</button></td>
				</tr>
			</table>
		</form:form>
	</body>
</html>
