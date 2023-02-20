<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>FutureArtCenter</title>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		<style type="text/css">
			body{
				overflow: hidden;
				height: 100%;
			}
			
			.main_content {
				min-height: 100%;
				width: 100vw;
				overflow: auto;
				padding-bottom: -30px;
			}
			
			.sec{
				height: 100%;
				flex-grow: 3;
				display: flex;
				
			}
			
			.adminBody {
				display: flex;
				min-height: 100%;
				padding-bottom: 60px;
			}
			
			footer {
				padding-top:20px;
				width: 100%;
				height: 100px;
				background-color: #696969;
			} 
		</style>
		
	</head>
	<body>
		<header>
			<tiles:insertAttribute name="adminHeader" />
		</header>
		
		<div class="adminBody">
			<div class="nav">
				<tiles:insertAttribute name="adminNav" />
			</div>
			
			<div class="main_content">
				<div class="sec">
					<tiles:insertAttribute name="content" />
				</div>
				<footer>
					<tiles:insertAttribute name="footer" />
				</footer>
			</div>
		</div>
		
		
	</body>
</html>