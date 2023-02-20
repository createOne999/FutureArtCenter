<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function check(){
				var form = document.reg;
				//첫번째 라디오 버튼을 선택한 경우
				if(form.regBtn[0].checked == true){
					window.open("/admin/talk/adminTalkReg", "강연 등록", "width=850, height=700, top=50, left=200");
					//opener.location.href=("/admin/media/adminMediaReg");
					window.close();
				}
				//두번째 라디오 버튼을 선택한 경우
				else if(form.regBtn[1].checked == true){
					window.open("/admin/concert/adminConcertReg", "콘서트 등록", "width=850, height=700, top=50, left=200");
					window.close();
				}
				else if(form.regBtn[2].checked == true){
					window.open("/admin/media/adminMediaReg", "미디어 등록", "width=850, height=700, top=50, left=200");
					window.close();
				}
				form.submit();
			}
			
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
			    font-family:sans-serif;
			}
			
			.register_popUp{
				width: 100%;
				margin-top: 30px;
			}
			
			.reg_box{
				width: 500px;
				height: 350px;
				border: 1px solid #000000;
				margin-top: 15px;
				text-align: center;
			}
			
			.title{
				text-align: center;
			}
			.register_group{
				width: 440px;
				float: left;
				margin: 30px;
			}
			
			.choice{
				text-align: left;
			}
			
			.register_Btn{
				margin-top: 20px;
				text-align: center;
			}
			
			#nextBtn{
				padding: 2px 40px 2px 40px;
				margin-right: 15px;
				background-color: #000000;
				color: #FFFFFF;
			}
			
			#cancelBtn{
				padding: 2px 40px 2px 40px;
				background-color: #000000;
				color: #FFFFFF;
			}
		</style>
	</head>
	<script type="text/javascript">
	</script>
	<body>
		<form:form  name="reg" method="get">
			<h2 class="title">공연 등록</h2>
			<div class="reg_box">
				<div class="register_group">
					<p class="choice">공연 선택</p>
					<input type="radio" id="talkBtn" value="talk" name="regBtn">강연
					<input type="radio" id="concertBtn" value="concert" name="regBtn">콘서트
					<input type="radio" id="mediaBtn" value="media" name="regBtn">미디어
				</div>
			</div>
			
			<div class="register_Btn">
				<button type="submit" class="nextBtn" id="nextBtn" onclick="javascript:check()">다음</button>
				<button type="button" class="cancelBtn" id="cancelBtn" onclick="window.close()">취소</button>
			</div>
		</form:form>
	</body>
</html>