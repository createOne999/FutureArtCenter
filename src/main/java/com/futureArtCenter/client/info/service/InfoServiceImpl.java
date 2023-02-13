package com.futureArtCenter.client.info.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.info.dao.InfoDAO;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;
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
	
	/**************
	 * 예매 내역 리스트
	 **************/
	// 콘서트 예매 내역
	@Override
	public List<Map<String, Object>> concertInfoList(String user_id) throws Exception {
		return infoDAO.concertInfoList(user_id);
	}
	// 미디어 예매 내역
	@Override
	public List<Map<String, Object>> mediaInfoList(String user_id) throws Exception {
		return infoDAO.mediaInfoList(user_id);
	}
	// 강연 예매 내역
	@Override
	public List<Map<String, Object>> talkInfoList(String user_id) throws Exception {
		return infoDAO.talkInfoList(user_id);
	}
	
	/**************
	 * 예매 취소 처리
	 * ************/
	// 콘서트 예매 취소
	public void ticketCancelConcert(String ticketing_no) throws Exception {
		infoDAO.ticketCancelConcert(ticketing_no);
	}
	// 미디어 예매 취소
	public void ticketCancelMedia(String ticketing_no) throws Exception {
		infoDAO.ticketCancelMedia(ticketing_no);
	}
	// 강연 예매 취소
	public void ticketCancelTalk(String ticketing_no) throws Exception {
		infoDAO.ticketCancelTalk(ticketing_no);
	}
	
	/******************
	 * 예매 취소 내역 리스트
	 * ****************/
	// 콘서트 예매 취소 내역
	@Override
	public List<Map<String, Object>> concertCancelList(String user_id) throws Exception {
		return infoDAO.concertCancelList(user_id);
	}
	// 미디어 예매 취소 내역
	@Override
	public List<Map<String, Object>> mediaCancelList(String user_id) throws Exception {
		return infoDAO.mediaCancelList(user_id);
	}
	// 강연 예매 취소 내역
	@Override
	public List<Map<String, Object>> talkCancelList(String user_id) throws Exception {
		return infoDAO.talkCancelList(user_id);
	}
	
	/******************
	 * 티켓 보기
	 * ****************/
	// 콘서트 티켓
	@Override
	public Map<String, Object> concertTicketRead(String ticketing_no) throws Exception {
		return infoDAO.concertTicketRead(ticketing_no);
	}
	// 미디어 티켓
	@Override
	public Map<String, Object> mediaTicketRead(String ticketing_no) throws Exception {
		return infoDAO.mediaTicketRead(ticketing_no);
	}
	// 미디어 티켓
	@Override
	public Map<String, Object> talkTicketRead(String ticketing_no) throws Exception {
		return infoDAO.talkTicketRead(ticketing_no);
	}
	
	/******************
	 * 회원 탈퇴 가능 여부 - 티켓 카운트
	 * ****************/
	// 콘서트 티켓	
	@Override
	public int concertCount(String user_id) throws Exception {
		return infoDAO.concertCount(user_id);
	}
	// 미디어 티켓
	@Override
	public int mediaCount(String user_id) throws Exception {
		return infoDAO.mediaCount(user_id);
	}
	// 강연 티켓
	@Override
	public int talkCount(String user_id) throws Exception {
		return infoDAO.talkCount(user_id);
	}
}
