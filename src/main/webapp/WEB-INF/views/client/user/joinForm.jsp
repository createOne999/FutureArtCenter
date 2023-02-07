<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="user.header.register" /></h2>
<form:form modelAttribute="userVO" action="/joinForm">
	<table>
		<tr>
			<td><spring:message code="user.userId" /></td>
			<td><form:input path="userId" /></td>
			<td><font color="red"><form:errors path="userId" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="user.userPwd" /></td>
			<td><form:input path="userPw" /></td>
			<td><font color="red"><form:errors path="userPwd" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnRegister"><spring:message code="action.register" /></button>
	<button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#userVO");
		
		$("#btnRegister").on("click", function() {
			formObj.submit();
		});
		
		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>