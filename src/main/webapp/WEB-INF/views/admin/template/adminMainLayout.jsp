<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Tiles Layout Main</title>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		<style type="text/css">
			*{
				overflow: hidden;
			}
			
			.sec{
				height: 100vh;
				overflow-y: scroll;
				flex-grow: 3;
				display: flex;
				
			}
			
			.adminBody {
				display: flex;
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
			
			<div class="sec">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</body>
</html>