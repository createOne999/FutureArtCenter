<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tiles Layout Main</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<div align="center">
		<table>
			<tr>
				<tiles:insertAttribute name="aside1" />
				<tiles:insertAttribute name="aside2" />
			</tr>
		</table>
	</div>

	<div align="center">
		<tiles:insertAttribute name="content" />
	</div>

	<tiles:insertAttribute name="footer" />
</body>
</html>