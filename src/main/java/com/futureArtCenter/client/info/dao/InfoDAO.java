package com.futureArtCenter.client.info.dao;

import com.futureArtCenter.client.user.vo.UserVO;

public interface InfoDAO {

	// 회원 정보 보기
	public UserVO userInfoRead(String user_id) throws Exception;
	
	// 회원 정보 수정 - 이름,핸드폰번호,SMS수신여부 저장
	public void userInfoModify(UserVO uvo) throws Exception;
	
	// 회원 정보 수정 - 비밀번호 변경 & 이름,핸드폰번호,SMS수신여부 저장
	public void userPwdModify(UserVO uvo) throws Exception;
	
	// 회원 탈퇴
	public void userOut(UserVO uvo) throws Exception;
}
