package com.futureArtCenter.client.info.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;
import com.futureArtCenter.client.user.vo.UserVO;

public interface InfoService {

	// 회원 정보 보기
	public UserVO userInfoRead(String user_id) throws Exception;
	
	// 회원 정보 수정 - 이름,핸드폰번호,SMS수신여부 저장
	public void userInfoModify(UserVO uvo) throws Exception;
		
	// 회원 정보 수정 - 비밀번호 변경 & 이름,핸드폰번호,SMS수신여부 저장
	public void userPwdModify(UserVO uvo) throws Exception;
	
	// 회원 탈퇴
	public void userOut(UserVO uvo) throws Exception;
	
	// 비밀번호 일치여부 확인
	public boolean pwdCheck(String pwdInput, HttpSession session) throws Exception;
	
	// 예매 내역
	public List<Map<String, Object>> concertInfoList(String user_id) throws Exception;
	public List<Map<String, Object>> mediaInfoList(String user_id) throws Exception;
	public List<Map<String, Object>> talkInfoList(String user_id) throws Exception;
	
	// 예매 취소 처리
	public void ticketCancelConcert(String ticketing_no) throws Exception;
	public void ticketCancelMedia(String ticketing_no) throws Exception;
	public void ticketCancelTalk(String ticketing_no) throws Exception;
	
	// 예매 취소 내역
	public List<Map<String, Object>> concertCancelList(String user_id) throws Exception;
	public List<Map<String, Object>> mediaCancelList(String user_id) throws Exception;
	public List<Map<String, Object>> talkCancelList(String user_id) throws Exception;
	
	// 티켓 보기
	public Map<String, Object> concertTicketRead(String ticketing_no) throws Exception;
	public Map<String, Object> mediaTicketRead(String ticketing_no) throws Exception;
	public Map<String, Object> talkTicketRead(String ticketing_no) throws Exception;
	
	// 회원 탈퇴 가능 여부 - 티켓 카운트
	public int concertCount(String user_id) throws Exception;
	public int mediaCount(String user_id) throws Exception;
	public int talkCount(String user_id) throws Exception;
}
