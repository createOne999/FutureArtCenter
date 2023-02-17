package com.futureArtCenter.client.common.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.client.faq.service.FAQService;
import com.futureArtCenter.client.notice.service.NoticeService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FAQService faqService;
	
	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public void mainPage(Locale locale, Model model) throws Exception {
		model.addAttribute("noticeList", noticeService.list());
		model.addAttribute("faqList", faqService.list());
	}
	
//	//로그인 화면 메소드
//	@RequestMapping(value = "/login") 
//	 public String adminLoginPage() {
//		 
//		 return "client/login/login"; 
//	}
	
	//
	
}
