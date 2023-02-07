package com.futureArtCenter.client.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.client.user.dao.UserDAO;
import com.futureArtCenter.client.user.service.UserService;
import com.futureArtCenter.client.user.service.UserServiceImpl;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원가입-동의 페이지
	@RequestMapping(value="/agreement", method=RequestMethod.GET)
	public void agreement(UserVO user, Model model) throws Exception {
		
	}
	
	// 회원가입-등록 페이지
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerForm(UserVO user, Model model) throws Exception {
	}
	
	// 등록 처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(UserVO user, Model model, RedirectAttributes rttr) throws Exception {
		  // 비밀번호 암호화 
		  String inputPassword = user.getUser_pwd();
		  user.setUser_pwd(passwordEncoder.encode(inputPassword));
		  service.register(user); 
		  rttr.addFlashAttribute("user_name", user.getUser_name()); 
		  
		  // 회원가입 완료되면 이동 - 메인페이지
		  return "redirect:/main";
		
	}
	
	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public int userIdConfirm(UserVO user) throws Exception {
	log.info("UserController 아이디중복확인");
	int result = service.userIdConfirm(user);
	return result;
	}
	
}
