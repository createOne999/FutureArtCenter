package com.futureArtCenter.client.user.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserVO {

	private int user_no;	//회원번호, user_seq 시퀀스 생성됨
	
	private String user_id;	//아이디: 영문 소문자,숫자, 4-20자
	private String user_pwd;//비밀번호: 영문 대소문자,숫자, 8-20자
	private String user_pwdCheck;//비밀번호 확인

	private int agree_site;	//사이트 약관동의, 필수항목, 동의할경우 1
	private int agree_personal;//개인정보 수집이용동의, 필수항목, 동의할경우 1
	
	private String user_name;//이름: 한글, 2-5자
	
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date user_birth;//생년월일: 과거일자, 숫자8자리 (예.20001010)
	
	private String user_phone;//전화번호, 11자리 (예.01012345678)
	private int agree_SMS;	//SMS수신여부, 미수신 0, 수신 1
	
	private Date user_regdate;//회원가입일, default sysdate
	private Date user_outdate;//회원탈퇴일
	private int user_out;	//탈퇴여부, 기본 0, 탈퇴시 1
	
	
	public UserVO() {
		super();
	}
	
	
	
}
