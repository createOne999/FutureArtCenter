package com.futureArtCenter.client.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.client.user.dao.UserDAO;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;
@Log
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userdao;
	
	@Transactional
	@Override
	public int userIdConfirm(UserVO user) throws Exception {
		log.info("UserServiceImpl 아이디중복확인");
		int result=userdao.userIdConfirm(user);
		return result;
	}
	
	
	// 등록 처리
	@Transactional
	@Override
	public void register(UserVO user) throws Exception {
		
		userdao.create(user);
	}
	
	
}
