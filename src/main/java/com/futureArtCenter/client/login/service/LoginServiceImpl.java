package com.futureArtCenter.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.login.dao.LoginDAO;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;
@Log
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;
	
	// 로그인
	@Override
	public String userLogin(UserVO user) throws Exception {
		return loginDAO.userLogin(user);
		
	}

}
