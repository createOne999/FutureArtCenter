package com.futureArtCenter.client.info.service;

import javax.servlet.http.HttpSession;

import com.futureArtCenter.client.user.vo.UserVO;

public interface InfoService {

	// 회원 정보 보기
	public UserVO userInfoRead(String user_id) throws Exception;
	
	// 회원 정보 수정 - 이름,핸드폰번호,SMS수신여부 저장
	public void userInfoModify(UserVO uvo) throws Exception;
		
	// 회원 정보 수정 - 비밀번호 변경 & 이름,핸드폰번호,SMS수신여부 저장
	public void userPwdModify(UserVO uvo) throws Exception;
	
	// 회원 탈퇴
	public void userOut(UserVO uvo) throws Exception;
	
	// 비밀번호 일치여부 확인
	public boolean pwdCheck(String pwdInput, HttpSession session) throws Exception;
}
