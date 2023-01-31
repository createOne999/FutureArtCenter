package com.futureArtCenter.client.user.dao;

import com.futureArtCenter.client.user.vo.UserVO;

public interface UserDAO {
	
	// 아이디 중복 확인
	public int userIdConfirm(UserVO user) throws Exception;
	
	// 등록 처리
	public void create(UserVO user) throws Exception;


}
