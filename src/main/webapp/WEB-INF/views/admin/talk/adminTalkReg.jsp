<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>강연 공연 등록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/talk/adminTalkReg.css">
		<script src="/js/talk/adminTalkReg.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var formObj = ${"#AdminTalkVO"};
				
				function getOriginalName(fileName){
					var idx = fileName.indexOf("_") + 1;
					return fileName.substr(idx);
				}
			});
			
		</script>
	</head>
	<body>
		<div class="talk">
		<form:form modelAttribute="AdminTalkVO" id="form" name="talkReg" enctype="multipart/form-data" action="register">
			<form:hidden path="show_no"/>
			<h2>강연 등록</h2>
			<div class="talk_content">
				<table>
					<tr>
						<td>공연명</td>
						<td><form:input path="show_name" id="show_name" name="show_name" placeholder="Ex) 북 콘서트 강연" /></td>
					</tr>
					<tr>
						<td>공연회차</td>
						<td>
							<form:radiobutton path="show_round" id="round1" name="round" value="1" onchange="setDisplay()" />1회차
							<form:radiobutton path="show_round" id="round2" name="round" value="2" checked="checked" onchange="setDisplay()" />1회차,2회차
						</td>
					</tr>
					<tr>
						<td>공연시간</td>
						<td>
							<div id="show_choice1">
								<form:input path="show_time1" id="one_start" name="one_start" maxlength="10" /> ~
								<form:input path="show_time1" id="one_end" name="one_end" maxlength="10" />1회차<br>
							</div>
							<div id="show_choice2">
								<form:input path="show_time2" id="two_start" name="two_start" maxlength="10" /> ~
								<form:input path="show_time2" id="two_end" name="two_end" maxlength="10" />2회차
							</div>
						</td>
					</tr>
					<tr>
						<td>공연 시작일</td>
						<td>
							<form:input type="date" path="show_startdate" id="show_startdate" name="show_startdate" value="2023-01-01" max="2050-12-31" min="2023-01-01"/>
						</td>
					</tr>
					<tr>
						<td>공연 종료일</td>
						<td>
							<form:input type="date" path="show_closedate" id="show_closedate" name="show_closedate" value="2023-01-01" max="2050-12-31" min="2023-01-01"/>
						</td>
					</tr>
					<tr>
						<td>공연 금액</td>
						<td>
							<form:input type="number" path="show_price" id="show_price" name="show_price" placeholder="Ex) 10000" />
						</td>
					</tr>
					<tr>
						<td>공연 상태</td>
						<td>
							<form:select path="show_status" id="show_status">
								<option value="0">예정</option>
								<option value="1">진행중</option>
								<option value="2">종료</option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>강연자</td>
						<td>
							<form:input path="talk_user" id="talk_user" name="talk_user" placeholder="Ex) 홍길동" />
						</td>
					</tr>
					<tr>
						<td>강연주제</td>
						<td>
							<form:input path="talk_subject" id="talk_subject" name="talk_subject" placeholder="Ex) 알아두면 유익한 내용" />
						</td>
					</tr>
					
					<tr id="poster">
						<td class="col1">공연 포스터</td>
						<td class="col2"><img id="posterIMG"/></td>
						<td class="col3"><input type="file" name="poster" id="show_poster" onchange="readURL(this);"/></td>	
					</tr>
					
					<tr>
						<td>공연 내용<td>
						<form:textarea path="show_content1" id="show_content1" name="show_content1" />
					</tr>
					
					<tr>
						<td>공연 사진</td>
						<td><input type="file" name="content2" id="show_content2"/></td>
					</tr>					
				</table>
			</div>
			<div class="register_Btn">
				<button type="button" id="registerBtn" onclick="check()">등록</button>
				<button type="button" id="cancelBtn" onclick="window.close()">취소</button>
			</div>
		</form:form>
		</div>
	</body>
</html>