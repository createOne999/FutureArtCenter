package com.futureArtCenter.client.login.dao;

import com.futureArtCenter.client.user.vo.UserVO;

public interface LoginDAO {

	// 회원 로그인
	public String userLogin(UserVO user) throws Exception;
}
