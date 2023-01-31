package com.futureArtCenter.client.login.service;

import com.futureArtCenter.client.user.vo.UserVO;

public interface LoginService {

	public String userLogin(UserVO user) throws Exception;
}
