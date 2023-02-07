package com.futureArtCenter.client.info.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.info.dao.InfoDAO;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	private InfoDAO infoDAO;
	
	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원 정보 보기
	@Override
	public UserVO userInfoRead(String user_id) throws Exception {
		return infoDAO.userInfoRead(user_id);
		
	}
	
	// 회원 정보 수정 - 이름,핸드폰번호,SMS수신여부 저장
	@Override
	public void userInfoModify(UserVO uvo) throws Exception {
		infoDAO.userInfoModify(uvo);
	}
	
	// 회원 정보 수정 - 이름,핸드폰번호,SMS수신여부 저장
	@Override
	public void userPwdModify(UserVO uvo) throws Exception {
		infoDAO.userPwdModify(uvo);
	}
	
	// 회원 탈퇴
	@Override
	public void userOut(UserVO uvo) throws Exception {
		infoDAO.userOut(uvo);
	}
	
	@Override
	// 비밀번호 일치여부 확인
	public boolean pwdCheck(String pwdInput, HttpSession session) throws Exception {
		log.info("InfoServiceImpl 비밀번호 확인 메서드 진입");
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		String encodedPwd = user.getUser_pwd(); // 사용자가 제출한 비밀번호
		String rawPwd = pwdInput;
		log.info("InfoServiceImpl 회원 객체 비밀번호 : " + encodedPwd);
		log.info("InfoServiceImpl 입력받은 비밀번호 : " + rawPwd);

		return passwordEncoder.matches(rawPwd, encodedPwd);
	}
	

}
