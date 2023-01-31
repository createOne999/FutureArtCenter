package com.futureArtCenter.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.client.login.service.LoginService;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	// 스프링 시큐리티의 비밀번호 암호처리기
		@Autowired
		private PasswordEncoder passwordEncoder;

	// 로그인 페이지
		@RequestMapping(value="/loginForm", method=RequestMethod.GET)
		public void loginForm() throws Exception {
		}
		
		// 로그인 처리
		@RequestMapping(value="/loginForm", method=RequestMethod.POST)
		public String userLogin(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {
			
			String rawPwd = ""; // 입력 받은 비밀번호
			String encodePwd = ""; // DB 암호화한 비밀번호
			
			System.out.println("login 메서드 진입");
			System.out.println("전달된 데이터 : " + user);
			
			HttpSession session = request.getSession();
			UserVO userOutput = service.userLogin(user); // 제출한 아이디와 일치하는 아이디가 있는지
			
			System.out.println("UserVO 반환 객체 : " + userOutput);
			
			if(userOutput != null) {
				// 일치하는 아이디 존재
				rawPwd = user.getUser_pwd(); // 사용자가 제출한 비밀번호
				encodePwd = userOutput.getUser_pwd(); // 데이터베이스에 저장한 인코딩된 비밀먼호
				
				
				if(true == passwordEncoder.matches(rawPwd, encodePwd)) { // 비밀번호 일치여부 판단
					session.setAttribute("user", userOutput); // session에 사용자 정보 저장
					return "redirect:/main"; // 메인페이지 이동
				} else {
					rttr.addFlashAttribute("result",0); 
					return "redirect:/login/loginForm"; // 로그인 페이지 이동
				}
			} else { // 일치하는 아이디가 존재하지 않을 경우 (로그인 실패)
				rttr.addFlashAttribute("result", 0);
				return "redirect:/login/loginForm"; // 로그인 페이지 이동
			}
		}

		// 로그아웃 처리
		@RequestMapping(value="logout.do", method=RequestMethod.GET)
		public String logout(HttpServletRequest request) throws Exception {
			
			log.info("로그아웃 처리");

			HttpSession session = request.getSession();
			session.invalidate();
			return "redirect:/main";
		}
		
}
