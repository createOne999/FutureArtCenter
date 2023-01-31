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
	public UserVO userLogin(UserVO userInput) throws Exception {
		log.info("입력받은 UserVO 확인 : "+userInput);
		log.info("반환 객체 : " +loginDAO.userLogin(userInput));
		return loginDAO.userLogin(userInput);
		
	}

}
