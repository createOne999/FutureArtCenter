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
		return loginDAO.userLogin(userInput);
		
	}
	
	// 아이디 찾기
	@Override
	public String userIdFind(UserVO userInput) throws Exception {
		log.info("LoginServiceImpl UserVO : "+userInput);
		String userId = loginDAO.userIdFind(userInput);
		log.info("LoginServiceImpl userId : " + userId);
		return userId;
	}
	
	// 비밀번호 찾기 - 회원정보 확인
		@Override
		public int userPwdCount(UserVO userInput) throws Exception {
			return loginDAO.userPwdCount(userInput);
		}
	
	// 비밀번호 찾기 - 비밀번호 초기화
		@Override
		public void userPwdFind(UserVO userInput) throws Exception {
			loginDAO.userPwdFind(userInput);
		}

}
