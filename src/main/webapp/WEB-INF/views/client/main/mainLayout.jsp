<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiles Layout Main</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">

 *{
    padding: 0;
    margin: 0 ;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    color: #000000;
}

body {
    width:100%;
    height:100%;
    margin:0px;
    padding:0px;
    font-family:sans-serif;
} 

 #fullscreen {
	width: 100%;
	height: auto;
	min-height: 800px;
} 
 #header {
	width: 100%;
	height: 20%;
}
#content {
	width: 100%;
	height: auto;

}
footer {
	padding-top:20px;
	width: 100%;
	height: 100px;
	background-color: #696969;
	bottom: 0;
	left: 0;
	position : relative;
} 

</style>
</head>
<body>

	<div id="fullscreen">
	<!-- 헤더 부분 -->
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
	<!-- 내용 부분 -->			
		<div id="content">
			<div align="center">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	
	</div>
	<!-- 푸터 부분 -->	
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>