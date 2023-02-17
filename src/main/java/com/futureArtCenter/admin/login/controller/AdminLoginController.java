package com.futureArtCenter.admin.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	private String admin_id = "admin";
	private String admin_pwd = "1234";

	@Autowired
	private AdminMediaService adminMediaService;

	@Autowired
	private AdminTalkService adminTalkService;

	@Autowired
	private AdminConcertService adminConcertService;

	// 로그인 페이지
	@RequestMapping(value = "/fac", method = RequestMethod.GET)
	public String loginPage() throws Exception {
		return "admin/login/adminLoginPage";
	}

	@RequestMapping(value = "/fac", method = RequestMethod.POST)
	public String adminLoginPage(String adminId, String adminPwd, HttpServletRequest request, RedirectAttributes rttr) {

		log.info("adminLogin");

		HttpSession session = request.getSession();

		if ((admin_id.equals(adminId)) && admin_pwd.equals(adminPwd)) {
			session.setAttribute(admin_id, admin_pwd);
			return "redirect:/admin/main";
		} else {
			rttr.addFlashAttribute("fail",0);
		}
		return "redirect:/admin/fac";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void list(Model model) throws Exception {

		List<AdminMediaVO> mediaList = adminMediaService.list();
		List<AdminTalkVO> talkList = adminTalkService.list();
		List<AdminConcertVO> concertList = adminConcertService.list();
		model.addAttribute("media_list", mediaList);
		model.addAttribute("talk_list", talkList);
		model.addAttribute("concert_list", concertList);

	}

	@RequestMapping(value = "/reg/adminReg")
	public String regPopUp() throws Exception {

		log.info("authorPop.......");
		return "admin/reg/adminReg";
	}

}