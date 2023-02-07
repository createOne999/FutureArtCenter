package com.futureArtCenter.client.login.service;

import com.futureArtCenter.client.user.vo.UserVO;

public interface LoginService {

	// 로그인
	public UserVO userLogin(UserVO user) throws Exception;
	
	// 아이디 찾기
	public String userIdFind(UserVO user) throws Exception;
	
	// 비밀번호 찾기 - 회원정보 확인
	public int userPwdCount(UserVO user) throws Exception;
	
	// 비밀번호 찾기 - 비밀번호 초기화
	public void userPwdFind(UserVO user) throws Exception;
}
