package com.futureArtCenter.admin.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.admin.concert.service.AdminConcertService;
import com.futureArtCenter.admin.concert.vo.AdminConcertVO;
import com.futureArtCenter.admin.media.service.AdminMediaService;
import com.futureArtCenter.admin.media.vo.AdminMediaVO;
import com.futureArtCenter.admin.talk.service.AdminTalkService;
import com.futureArtCenter.admin.talk.vo.AdminTalkVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@Autowired
	private AdminMediaService adminMediaService;
	
	@Autowired
	private AdminTalkService adminTalkService;
	
	@Autowired
	private AdminConcertService adminConcertService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
			
		List<AdminMediaVO> mediaList = adminMediaService.list();
		List<AdminTalkVO> talkList = adminTalkService.list();
		List<AdminConcertVO> concertList = adminConcertService.list();
		model.addAttribute("media_list", mediaList);
		model.addAttribute("talk_list", talkList);
		model.addAttribute("concert_list", concertList);
		
	}
	
	// 로그인 페이지
	@RequestMapping("/login")
	public String adminLoginPage(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
		}
		return "admin/login/adminLoginPage";
	}
	
	// 로그아웃 페이지를 생성한다.
	@RequestMapping("/logout")
	public String adminLogoutPage() {
		return "admin/login/adminLogoutPage";
	}
	
	@RequestMapping("/reg/adminReg")
	public String regPopUp() throws Exception{
		
		log.info("authorPop.......");
		return "admin/reg/adminReg";
	}


	 
}