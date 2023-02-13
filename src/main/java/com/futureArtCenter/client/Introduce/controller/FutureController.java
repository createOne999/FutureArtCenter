package com.futureArtCenter.client.Introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/future")
public class FutureController {
	
	// 미래의 전당 소개
	@RequestMapping(value = "/futurePublicDetail", method = RequestMethod.GET)
	public void futurePublicDetail(Model model) throws Exception {
		log.info("detail");
		
		model.addAttribute("futurePublicDetail");
		model.addAttribute("concertHallPublicDetail");
		model.addAttribute("wayPublicDetail");
		
	}
	
	// 공연장 안내
	@RequestMapping(value = "/concertHallPublicDetail", method = RequestMethod.GET)
	public void concertHallPublicDetail(Model model) throws Exception {
		log.info("detail");
		
		model.addAttribute("futurePublicDetail");
		model.addAttribute("concertHallPublicDetail");
		model.addAttribute("wayPublicDetail");
	}
	
	// 오시는 길
	@RequestMapping(value = "/wayPublicDetail", method = RequestMethod.GET)
	public void wayPublicDetail(Model model) throws Exception {
		log.info("detail");
		
		model.addAttribute("futurePublicDetail");
		model.addAttribute("concertHallPublicDetail");
		model.addAttribute("wayPublicDetail");
	}

}
