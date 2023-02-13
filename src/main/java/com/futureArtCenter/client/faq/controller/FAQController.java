package com.futureArtCenter.client.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.client.faq.service.FAQService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/faq")
public class FAQController {
	
	@Autowired
	private FAQService service;
	
	// FAQ 목록 페이지
	@RequestMapping(value = "/faqlist", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		log.info("list");
		
		model.addAttribute("list", service.list());
	}

}
