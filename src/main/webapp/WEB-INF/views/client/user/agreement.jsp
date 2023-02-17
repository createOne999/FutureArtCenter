<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회 원 가 입</title>

<style>


.form-required {
	font-weight: bold;
	color: #8b4513;
	padding-left: 480px;
}

textarea {
	color: #696969;
	padding: 20px;
}

.agree_site {
	padding-left: 220px;
}

table {
	font-size: 13px;
	text-align:center;
	border: 1px solid #696969;
	border-collapse: collapse;
	
}
 


th, td {
    border: 1px solid #696969;
    padding: 10px 30px 10px 30px;
  }
  
  th {
	background-color: #f5f5f5; 
  }

#next_button {
	background-color: #ccb6a3;
	margin-top: 50px;
	margin-bottom: 100px;
	color: #696969;
	font-size: 15px;
	font-weight: bold;
	border: none;
	width: 150px;
	padding: 3px; 
	border-radius: 5px;  
       }
</style>

<script type="text/javascript">
	function check(){
	 	var agree_site = $('input[name=agree_site]:checked').val(); //체크된 라디오버튼 value 값
	 	var agree_personal = $('input[name=agree_personal]:checked').val(); //체크된 라디오버튼 value 값
	 
		 if(agree_site == 0 && agree_personal == 0){
		  			  location.href="/user/register"; // 회원가입 폼으로 이동
		 } else{
			 alert("모든 항목에 동의하셔야 합니다.");
		 }
	 }
</script>
</head>
<body>
<br><br><br><br>
<form action="agreement" name="agreement" method="get">
	<h1>회 원 가 입</h1>
	<br><br>
	<div align="left">
		<label class="form-required">[필수] 미래의전당 회원 약관</label>
	</div>
	<textarea rows="10" cols="70">
미래의전당 약관 전문

수집하는 개인정보의 항목은 다음과 같습니다.

첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 핸드폰번호
- 선택항목 : 마케팅 목적 SMS 수신 여부
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 결제수단 : 카드, 계좌이체   
</textarea>
<br>
<label class="agree_site">위 약관에 동의하십니까? (필수)</label>
			<input type="radio" name="agree_site" value="0" checked>동의
			<input type="radio" name="agree_site" value="1">미동의
<br><br><br>
	<div align="left">
	<label class="form-required">[필수] 개인정보 수집 및 이용 동의</label>
	</div>
<table>
	<tr>
		<th>항목</th>
		<th>수집 및 이용 목적</th>
		<th>보유기간</th>
	</tr>
	<tr>
		<td>성명, 생년월일, 핸드폰번호</td>
		<td>티켓 구매 및 회원관리</td>
		<td>회원 탈퇴 후 1년</td>
	</tr>
</table>


<label for="agree_personal">위 항목에 대하여 개인정보 수집 및 이용 동의하십니까? (필수)</label>
			<input type="radio" name="agree_personal" value="0" checked>동의
			<input type="radio" name="agree_personal" value="1">미동의
<br>
<input type="button" id="next_button" value="다   음" onclick="check()"/>
</form>
</body>