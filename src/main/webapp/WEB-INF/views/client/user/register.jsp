<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@	taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">

var idConfirm = 1; //아이디 중복 확인여부 (1 미확인상태)

// '중복확인' 버튼 클릭 시 아이디 중복 확인
function check() {
	
	// 입력 아이디 받기
	var user_id=$("#user_id").val(); 
	// 정규식
	var idRegExp = /^[a-z0-9]{4,20}$/; 
	// 아이디 유효성검사
	if (!idRegExp.test(user_id)) {
		alert("[아이디]모든 항목이 올바르게 입력되어야 합니다.");
		        form.user_id.focus();
		        return false;
		    }
	
	// 아이디 중복 확인
	$.ajax({
			type : "get",
			url  : "/user/idCheck",
			data : {user_id: user_id},
			success : function(data){
				if(data == 1){
					$("#idmessage").text("이미 사용중인 ID 입니다.");
					
				} else {
					$("#idmessage").text("사용가능한 ID 입니다.");
					idConfirm = 2; //아이디 중복 확인여부 (2 확인완료)
				}
			}
		})
}
	
//'회원가입' 버튼 클릭 시 유효성검사
function checkAll() {
	
	// 아이디 중복 확인 여부 (2 확인완료) 
    if (idConfirm!=2){
    	alert("아이디 중복 확인해 주세요."); 
    	return false;
    }
	
	// 입력 비밀번호
	var pwd = $("#user_pwd").val(); 
	// 정규식
	var pwdRegExp = /^[a-zA-z0-9]{8,20}$/; 
	// 비밀번호 유효성검사
	if (!pwdRegExp.test(pwd)) {
        alert("[비밀번호]모든 항목이 올바르게 입력되어야 합니다.");
        form.user_pwd.value = "";
        form.user_pwdCheck.value = "";
        form.user_pwd.focus();
        return false;
    }
	
	// 입력 비밀번호 확인값
	var pwdCheck = $("#user_pwdCheck").val();
	// 비밀번호와 비교
     if (pwd != pwdCheck) {
    	$("#pwdmessage").text("비밀번호 불일치");
        form.user_pwdCheck.focus();
        return false;
    } else {
    	$("#pwdmessage").text("비밀번호 일치");
    }
	
	// 입력 이름
	var name = $("#user_name").val();
	// 정규식
	var nameRegExp = /^[a-zA-Z가-힣]{2,5}$/; 
	// 유효성 검사
    if (!nameRegExp.test(name)) {
        alert("[이름]모든 항목이 올바르게 입력되어야 합니다.");
        form.user_name.focus();
        return false;
    }
	
	// 입력 생년월일
	var birth = $("#user_birth").val();
	// 정규식
    var birthRegExp = /^(1|2)(\d{7})$/; 
	// 생년월일 유효성 검사
    if (!birthRegExp.test(birth)) {
        alert("[생년월일]모든 항목이 올바르게 입력되어야 합니다.");
        form.user_birth.focus();
        return false;
    }
	
	// 입력 핸드폰번호
	var phone = $("#user_phone").val();
	// 정규식
    var phoneRegExp = /^(01)(\d{9})$/; 
	// 유효성검사
    if (!phoneRegExp.test(phone)) {
        alert("[핸드폰번호]모든 항목이 올바르게 입력되어야 합니다.");
        form.user_phone.focus();
        return false;
    }
		
	// 검증 완료 - 회원가입 submit
    form.submit();
    alert("회원가입이 완료되었습니다.\n감사합니다.");
 }

</script>
<body>
    <form:form modelAttribute="user" id="form" method="post" action="register">
    <h1>회 원 가 입</h1>
      <table>
        <tr>
          <td><label for="user_id">아 이 디</label></td>
          <td><input type="text" id="user_id" name="user_id" placeholder="영문 소문자,숫자 4-20자" maxlength="20" required>
          <input type="button" id="userIdConfirm" name="userIdConfirm" value="중복확인" onClick="check()">
          <span id="idmessage"></span>
        </tr>
        <tr>
          <td><label for="user_pwd">비밀번호</label></td>
          <td><input type="password" id="user_pwd" name="user_pwd" placeholder="영문 대소문자,숫자 8-20자" maxlength="20" required></td>
        </tr>
        <tr>
          <td><label for="user_pwdCheck">비밀번호 확인</label></td>
          <td><input type="password" id="user_pwdCheck" name="user_pwdCheck" placeholder="영문 대소문자,숫자 8-20자" maxlength="20" required >
          <span id="pwdmessage"></span>
        </tr>
  
        <tr>
          <td><label for="user_name">이름</label></td>
          <td><input type="text" id="user_name" name="user_name" maxlength="5" required></td>
        </tr>
        <tr>
          <td><label for="user_birth">생년월일</label></td>
          <td><input type="text" id="user_birth" name="user_birth" placeholder="예)19990101" maxlength="8" required></td>
        </tr>
        <tr>
          <td><label for="user_phone">핸드폰번호('-'제외 입력)</label></td>
          <td><input type="text" id="user_phone" name="user_phone" placeholder="예)01012345678" maxlength="11" required></td>
        </tr>
        <tr>
          <td><label for="agree_SMS">마케팅 목적 SMS 수신 여부 (선택) </label>
          <td><input type="radio" name="agree_SMS" value=0 checked>수신
              <input type="radio" name="agree_SMS" value=1 >미수신
          </td>
        </tr>
      </table>
      <input type="button" value="회원가입" onclick="checkAll()"/>
    </form:form>
    </body>
