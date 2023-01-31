package com.futureArtCenter.client.user.service;

import com.futureArtCenter.client.user.vo.UserVO;

public interface UserService {
	
	public int userIdConfirm(UserVO user) throws Exception;
	
	
	// 등록 처리
	public void register(UserVO user) throws Exception;



	
	

}
