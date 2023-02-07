package com.futureArtCenter.client.info.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Port.Info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.client.info.dao.InfoDAO;
import com.futureArtCenter.client.info.service.InfoService;
import com.futureArtCenter.client.user.service.UserService;
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
	
	// 마이페이지 - 메인
	// 예매 내역 화면
	@RequestMapping(value="/ticketinglist", method=RequestMethod.GET)
	public void ticketinglist() throws Exception {
		
	}
	
	// 예매 취소 내역 화면
	@RequestMapping(value="/ticketingcancellist", method=RequestMethod.GET)
	public void ticketingcancellist() throws Exception {
			
	}
		
	// 회원 정보 화면
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void userInfoRead(Model model, HttpSession session) throws Exception {
			
			// 세션에서 로그인회원 객체 가져오기
			UserVO loginUser = (UserVO)session.getAttribute("user");
			
			// 회원 아이디 확인
			String loginUser_id = loginUser.getUser_id();
			
			//서비스 안의 회원정보보기 메서드 호출
			UserVO user = service.userInfoRead(loginUser_id);
			
			// 회원정보 저장
			model.addAttribute("user", user);
			
	}
	
	// 회원 정보 수정 화면
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyForm(Model model, HttpSession session) throws Exception {
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO loginUser = (UserVO)session.getAttribute("user");
		
		// 회원 아이디 확인
		String loginUser_id = loginUser.getUser_id();
		
		//서비스 안의 회원정보보기 메서드 호출
		UserVO user = service.userInfoRead(loginUser_id);
		
		// 회원정보 저장
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
		
		// String pwdInput 사용자가 제출한 비밀번호
		boolean pwdCheck = service.pwdCheck(pwdInput, session); // 비밀번호 일치 여부
		
		// 비밀번호 일치 여부 확인
			if (true == pwdCheck) { // 일치
				log.info("비밀번호 일치 여부 확인 :"+pwdCheck);
				
				service.userOut(user); // 업데이트
				session.invalidate();  // 로그아웃
				rttr.addFlashAttribute("out", "탈퇴");
				return "redirect:/main";
				
			} else { // 불일치
				rttr.addFlashAttribute("fail", "불일치");
				return "redirect:/info/delete";
			}
		
			
	}
		
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping(value="/pwdCheck", method=RequestMethod.GET)
	public int pwdCheck(String pwdInput, HttpSession session) throws Exception {
		log.info("비밀번호 확인");
		
		// 세션에서 로그인회원 객체 가져오기
		UserVO user = (UserVO)session.getAttribute("user");
		String encodedPwd = user.getUser_pwd(); // 사용자가 제출한 비밀번호
		String rawPwd = pwdInput;
		log.info("회원 객체 비밀번호 : " + encodedPwd);
		log.info("입력받은 비밀번호 : " + rawPwd);

		if (true == passwordEncoder.matches(rawPwd, encodedPwd)) { 
			return 1;
		} 
		log.info("Controller - 탈퇴 실패");
		return 0;
	}
}
