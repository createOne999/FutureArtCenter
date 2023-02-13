package com.futureArtCenter.client.info.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.client.info.service.InfoService;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	/*********
	 * 예매 내역(리스트)
	 *********/
	@RequestMapping(value="/ticketinglist", method=RequestMethod.GET)
	public void ticketingList(Model model, HttpSession session) throws Exception {

		UserVO loginUser = (UserVO)session.getAttribute("user");
		String user_id = loginUser.getUser_id();

		model.addAttribute("concertInfoList", service.concertInfoList(user_id));
		model.addAttribute("mediaInfoList", service.mediaInfoList(user_id));
		model.addAttribute("talkInfoList", service.talkInfoList(user_id));
	}
	
	
	/*********
	 * 예매 취소 내역(리스트)
	 *********/
	@RequestMapping(value="/ticketingcancellist", method=RequestMethod.GET)
	public void ticketingcancellist(Model model, HttpSession session) throws Exception {
		
		UserVO loginUser = (UserVO)session.getAttribute("user");
		String user_id = loginUser.getUser_id();

		model.addAttribute("concertCancelList", service.concertCancelList(user_id));
		model.addAttribute("mediaCancelList", service.mediaCancelList(user_id));
		model.addAttribute("talkCancelList", service.talkCancelList(user_id));
	}
	
	/***************
	 * 예매 취소 - 화면
	 ***************/
	
	// 콘서트 예매 취소 화면
	@RequestMapping(value="/ticketCancelConcert", method=RequestMethod.GET)
	public void CancelConcertForm(@RequestParam("ticketing_no") String ticketing_no, Model model, RedirectAttributes rttr) throws Exception{
		log.info("CancelConcertForm 진입");
		log.info("concertTicket 번호 확인 : "+ticketing_no);
		model.addAttribute("concertTicketNo",ticketing_no);
		
	}
	
	// 미디어 예매 취소 화면
	@RequestMapping(value="/ticketCancelMedia", method=RequestMethod.GET)
	public void CancelMediaForm(@RequestParam("ticketing_no") String ticketing_no, Model model, RedirectAttributes rttr) throws Exception{
		log.info("CancelMediaForm 진입");
		log.info("mediaTicket 번호 확인 : "+ticketing_no);
		model.addAttribute("mediaTicketNo",ticketing_no);
		
	}
	
	// 미디어 예매 취소 화면
	@RequestMapping(value="/ticketCancelTalk", method=RequestMethod.GET)
	public void CancelTalkForm(@RequestParam("ticketing_no") String ticketing_no, Model model, RedirectAttributes rttr) throws Exception{
		log.info("CancelTalkForm 진입");
		log.info("talkTicket 번호 확인 : "+ticketing_no);
		model.addAttribute("talkTicketNo",ticketing_no);
		
	}
		
	
	/***************
	 * 예매 취소 - 처리
	 ***************/
	
	// 콘서트 예매 취소 처리
		@RequestMapping(value="/ticketCancelConcert", method=RequestMethod.POST)
		public String ticketCancelConcert(String ticketing_no, String pwdInput, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
			log.info("콘서트 예매 취소 처리 진입");
			log.info("티켓번호 확인 :"+ticketing_no);
			log.info("입력비번 확인 :"+pwdInput);
			
			// 세션에서 로그인회원 객체 가져오기
			UserVO user = (UserVO)session.getAttribute("user");
			// String pwdInput 사용자가 제출한 비밀번호
			boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
			
			// 비밀번호 일치 여부 확인
				if (true == pwdCheck) { // 일치
					service.ticketCancelConcert(ticketing_no);// 티켓 취소 업데이트
					rttr.addFlashAttribute("success", "일치");
					return "redirect:ticketingcancellist";
					
				} else { // 불일치
					rttr.addFlashAttribute("fail", "불일치");
					return "redirect:ticketinglist";
				}
		}
		
		// 미디어 예매 취소 처리
		@RequestMapping(value="/ticketCancelMedia", method=RequestMethod.POST)
		public String ticketCancelMedia(String ticketing_no, String pwdInput, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
			log.info("미디어 예매 취소 처리 진입");
			log.info("티켓번호 확인 :"+ticketing_no);
			log.info("입력비번 확인 :"+pwdInput);
			
			// 세션에서 로그인회원 객체 가져오기
			UserVO user = (UserVO)session.getAttribute("user");
			// String pwdInput 사용자가 제출한 비밀번호
			boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
			
			// 비밀번호 일치 여부 확인
				if (true == pwdCheck) { // 일치
					service.ticketCancelMedia(ticketing_no);// 티켓 취소 업데이트
					rttr.addFlashAttribute("success", "일치");
					return "redirect:ticketingcancellist";
					
				} else { // 불일치
					rttr.addFlashAttribute("fail", "불일치");
					return "redirect:ticketinglist";
				}
		}
		
		// 강연 예매 취소 처리
		@RequestMapping(value="/ticketCancelTalk", method=RequestMethod.POST)
		public String ticketCancelTalk(String ticketing_no, String pwdInput, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
			log.info("강연 예매 취소 처리 진입");
			log.info("티켓번호 확인 :"+ticketing_no);
			log.info("입력비번 확인 :"+pwdInput);
			
			// 세션에서 로그인회원 객체 가져오기
			UserVO user = (UserVO)session.getAttribute("user");
			// String pwdInput 사용자가 제출한 비밀번호
			boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
			
			// 비밀번호 일치 여부 확인
				if (true == pwdCheck) { // 일치
					service.ticketCancelTalk(ticketing_no);// 티켓 취소 업데이트
					rttr.addFlashAttribute("success", "일치");
					return "redirect:ticketingcancellist";
					
				} else { // 불일치
					rttr.addFlashAttribute("fail", "불일치");
					return "redirect:ticketinglist";
				}
		}
	
	/*********
	 * 티켓 보기
	 *********/
	
	// 콘서트 티켓 보기
	@RequestMapping(value="/ticketReadConcert", method=RequestMethod.GET)
	public void concertTicketRead(@RequestParam("ticketing_no") String ticketing_no, Model model) throws Exception {
		log.info("티켓번호:"+ticketing_no);
		Map<String, Object> concertMap = new HashMap<String, Object>();
		concertMap = service.concertTicketRead(ticketing_no);
		model.addAttribute("concertTicket",concertMap);
	}
	
	// 미디어 티켓 보기
	@RequestMapping(value="/ticketReadMedia", method=RequestMethod.GET)
	public void mediaTicketRead(@RequestParam("ticketing_no") String ticketing_no, Model model) throws Exception {
		log.info("미디어티켓번호:"+ticketing_no);
		Map<String, Object> mediaMap = new HashMap<String, Object>();
		mediaMap = service.mediaTicketRead(ticketing_no);
		model.addAttribute("mediaTicket",mediaMap);
	}
	
	// 강연 티켓 보기
	@RequestMapping(value="/ticketReadTalk", method=RequestMethod.GET)
	public void talkTicketRead(@RequestParam("ticketing_no") String ticketing_no, Model model) throws Exception {
		log.info("강연티켓번호:"+ticketing_no);
		Map<String, Object> talkMap = new HashMap<String, Object>();
		talkMap = service.talkTicketRead(ticketing_no);
		model.addAttribute("talkTicket",talkMap);
	}
		
	/*********
	 * 회원 정보 화면
	 *********/
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void userInfoRead(Model model, HttpSession session) throws Exception {
			
			// 세션에서 로그인회원 객체 가져오기
			UserVO loginUser = (UserVO)session.getAttribute("user");
			String loginUser_id = loginUser.getUser_id();
			UserVO user = service.userInfoRead(loginUser_id);
			// 회원정보 저장
			model.addAttribute("user", user);
	}
	
	
	/*********
	 * 회원 정보 수정 
	 *********/
	// 회원 정보 수정 화면
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Model model, HttpSession session) throws Exception {
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO loginUser = (UserVO)session.getAttribute("user");
		String loginUser_id = loginUser.getUser_id();
		UserVO user = service.userInfoRead(loginUser_id);
		
		model.addAttribute("user", user);
		
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value="/userInfoModify", method=RequestMethod.POST)
	public String userInfoModify(UserVO uvo, RedirectAttributes rttr, HttpSession session) throws Exception {
		log.info("userInfoModify 메서드 진입");
		log.info("uvo 객체 출력 : " + uvo);
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		String user_id = user.getUser_id();// 회원 아이디 확인
		uvo.setUser_id(user_id);// 아이디 저장
		
		String pwdInput = uvo.getUser_pwd(); // 사용자가 제출한 비밀번호
		boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
		
		// 비밀번호 일치 여부 확인
			if (true == pwdCheck) { 
				log.info("비밀번호 일치 여부 확인 :"+pwdCheck);
				
				// 회원 정보 수정
				if(uvo.getUser_pwdCheck()=="") { // 변경 비밀번호 값이 없을 경우
					service.userInfoModify(uvo); // 이름,생년월일,SMS수신여부 업데이트
					rttr.addFlashAttribute("success", "일치");
					return "redirect:/info/read";
					
				} else { 
					uvo.setUser_pwdCheck(passwordEncoder.encode(uvo.getUser_pwdCheck()));// 비밀번호 암호화 
					service.userPwdModify(uvo); // 비밀번호,이름,생년월일,SMS수신여부 업데이트
					session.invalidate();  // 로그아웃
					rttr.addFlashAttribute("success", "일치");
					return "redirect:/main";
				}
			
			} else { // 비밀번호 불일치	
				rttr.addFlashAttribute("fail", "불일치");
				return "redirect:/info/modify";
			}
		
	}
	
	/*********
	 * 회원 탈퇴 
	 *********/
	
	// 회원 탈퇴 화면
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void userDelete() throws Exception {
				
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value="/userOut", method=RequestMethod.POST)
	public String userOut(String pwdInput, RedirectAttributes rttr, HttpSession session) throws Exception {
		log.info("회원 탈퇴 처리");
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		
		String user_id = user.getUser_id(); // 회원 아이디
		// 남은 공연 있는지 확인하기 >> 공연일이 당일 또는 도래하지 않은 경우 회원탈퇴 불가
		int concertCount = service.concertCount(user_id);
		int mediaCount = service.mediaCount(user_id);
		int talkCount = service.talkCount(user_id);
		log.info("티켓 확인 : ");
		log.info("concertCount : " + concertCount);
		log.info("mediaCount : " + mediaCount);
		log.info("talkCount : "+talkCount);
		
			if (concertCount == 0 && mediaCount == 0 && talkCount == 0) {
				// 탈퇴 가능
			} else {
				rttr.addFlashAttribute("fail", "불가");
				return "redirect:/info/delete"; 
			}
			
		// String pwdInput 사용자가 제출한 비밀번호
		boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
		
		// 비밀번호 일치 여부 확인
			if (true == pwdCheck) { // 일치
				service.userOut(user); // 업데이트
				session.invalidate();  // 로그아웃
				rttr.addFlashAttribute("out", "탈퇴");
				return "redirect:/main";
				
			} else { // 불일치
				rttr.addFlashAttribute("fail", "불일치");
				return "redirect:/info/delete";
			}
		
	}
		
}
