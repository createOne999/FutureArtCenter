package com.futureArtCenter.client.show.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.client.show.service.ConcertService;
import com.futureArtCenter.client.show.service.MediaService;
import com.futureArtCenter.client.show.service.TalkService;


@Controller
@RequestMapping("/show")
public class ShowController {
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private TalkService talkService;
	
	@Autowired
	private ConcertService concertService;
	
	//공연 목록 보기
	@RequestMapping(value = "/showlist", method = RequestMethod.GET)
	public void showList(Model model) throws Exception {
		model.addAttribute("mediaList", mediaService.list());
		model.addAttribute("talkList", talkService.list());
		model.addAttribute("concertList", concertService.list());
	}
	
	// 공연 예정 목록보기
	@RequestMapping(value = "/showplan", method = RequestMethod.GET)
	public void showPlan(Model model) throws Exception{
		model.addAttribute("mediaList", mediaService.planList());
		model.addAttribute("talkList", talkService.planList());
		model.addAttribute("concertList", concertService.planList());
	}
	
}
