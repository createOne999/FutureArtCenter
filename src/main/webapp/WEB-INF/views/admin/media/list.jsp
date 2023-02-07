<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function regPopUp(){
				window.open("/admin/reg/adminReg", "공연등록", "width=600, height=500, top=50, left=200");
			};
		
			function closePopup() {
				//함수 동작 테스트
				//alert("click");
				
				//자신을 실행시킨 본 창은 opener 객체로 인식된다
				var nickNameObj = opener.document.testForm.nickName;
				var flagObj = opener.document.testForm.flag;
				
				//nickName 초기화 시키기
				nickNameObj.value = "";
				//nickName으로 마우스 커서 옮기기
				//nickNameObj.focus();
				
				// flag를 "ok"로 변경
				flagObj.value = "ok";
				
				//자신(팝업)을 종료한다.
				self.close();
			}
			
			
		</script>
		<style type="text/css">
			.content{
				margin-top: 50px;
			}
			.well{
				display: flex;
			}
			
			.title {
				margin: 0;
			}
			
			.form-inline{
				margin: 0;
				width: 500px;
				display: flex;
				justify-content: space-between;
			}
			
			.sub-header{
				font-size: 20px;
			}
		
			.select_menu{
				display: flex;
			}
			#search1 {
				margin-right: 25px;
				margin-left: 10px;
			}
			
			#search2 {
				margin-right: 15px;
			}
			
			
			
			.list{
				margin-top: 10px;
				float: left;
			}
			
			select{
				padding: 3px;
			}
			
			button{
				padding: 1px 3px 1px 3px;
			}
		</style>
	</head>
	
	<body>
		<div class="content">
			<div class="well">
				<div class="title">
					<p class="sub-header">게시판 리스트</p>
				</div>
				<form class="form-inline" id="search">
					<div class="select_menu">
						<div class="form-group" id="kind">
							<select id="search1" name="search" class="form-control">
								<option value="media">미디어</option>
								<option value="concert">콘서트</option>
								<option value="talk">강연</option>
							</select>
						</div>
						
						<div class="form-group" id="state">
							<select id="search2" name="search" class="form-control">
								<option value="proceeding">공연중</option>
								<option value="scheduled">진행예정</option>
							</select>
						</div>
						<button type="button" class="search_Btn" id="search_Btn">조회</button>
					</div>
					<div class="inputShow">
						<button type="button" id="register_Btn" onclick="regPopUp()">공연 등록하기</button>
					</div>
				</form>
			</div>
			
			<div class="list">
				<table border="1">
					<thead>
						<tr>
							<th class="tac">공연 번호</th>
							<th class="tac">공연명</th>
							<th class="tac">공연 회차</th>
							<th class="tac">공연 시간</th>
							<th class="tac">공연 시작일</th>
							<th class="tac">공연 종료일</th>
							<th class="tac">공연 금액</th>
							<th class="tac">공연 상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</body>
</html>