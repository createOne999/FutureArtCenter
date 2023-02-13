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
#fullscreen {
	width: 100%;
	min-height: 900px;
}
#header {
	width: 100%;
	height: 20%;
}
#content {
	width: 100%;
	height: 66%;
}
#footer {
	width: 100%;
	height: 14%;
}
</style>
</head>
<body>

	<div id="fullscreen">
		<div id="header">
			<tiles:insertAttribute name="header" />
			<div align="center">
				<table>
					<tr>
						<tiles:insertAttribute name="aside1" />
						<tiles:insertAttribute name="aside2" />
					</tr>

				</table>
			</div>
		</div>
		<div id="content">
			<div align="center">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>
</body>
</html>