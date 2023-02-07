<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketing cancel list</title>
<!-- 마이페이지 > 예매 취소 내역 -->
</head>
<body>
	<div align="left"><h3>&nbsp;&nbsp;&nbsp;마이페이지</h3></div>
	<div align="center" id="info_tab">
	<table border="5">
		<tr align="center">
			<td width="150"><a href="ticketinglist">예매 내역</a></td>
			<td width="150"><a href="ticketingcancellist">예매 취소 내역</a></td>
			<td width="150"><a href="read">회원 정보</a></td>
			<td width="150"><a href="delete">회원 탈퇴</a></td>
		</tr>
	</table>
	</div>
	<br><br>
	<table border="1" align="center">
	<tr>
		<td>예매일</td>
		<td>공연명</td>
		<td>공연일</td>
		<td>공연 시간</td>
		<td>매수</td>
		<td>결제수단</td>
		<td>결제금액</td>
		<td>예매상태</td>
		<td>취소일</td>
		<td>환불금액</td>
	</tr>
	</table>
</body>
</html>