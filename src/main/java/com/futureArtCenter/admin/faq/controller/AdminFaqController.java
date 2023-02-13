package com.futureArtCenter.admin.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.admin.faq.VO.AdminFaqVO;
import com.futureArtCenter.admin.faq.service.AdminFaqService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/faq")
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService adminFaqService;
	
	// faq 등록 페이지
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String registerForm(Model model) throws Exception {
			
			log.info("register");
			
			
			return "/admin/faq/adminFaqReg";
		}

		
		// faq 등록 처리
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String register(AdminFaqVO adminFaqVO, RedirectAttributes rttr) throws Exception {
			
			
			adminFaqService.register(adminFaqVO);
			log.info("register");
		
			
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/admin/faq/list";
			
		}
		
		// faq 목록 페이지
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model) throws Exception{
			log.info("list");
			model.addAttribute("list", adminFaqService.list());
			
			return "/admin/faq/adminFaqList";
		}
		
		// 공지사항 상세 페이지
		@RequestMapping(value = "/adminFaqRead", method = RequestMethod.GET)
		public String read(int faq_no, Model model) throws Exception {
			log.info("read");
			model.addAttribute("AdminFaqVO", adminFaqService.read(faq_no));
			
			return "/admin/faq/adminFaqRead";
		}
		
		// 공지사항 수정 페이지
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public String modifyForm(int faq_no, Model model) throws Exception {
			log.info("modify");
			model.addAttribute("AdminFaqVO", adminFaqService.read(faq_no));
			
			return "/admin/faq/adminFaqMod";
		}
		
		// 공지사항 수정 처리
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modify(AdminFaqVO adminFaqVO, RedirectAttributes rttr) throws Exception {
			adminFaqService.modify(adminFaqVO);
			
			rttr.addFlashAttribute("msg", "SUCCESS");
			log.info("modify");
			
			return "redirect:/admin/faq/list";
		}
		
		// 공지사항 삭제 처리
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(int faq_no, RedirectAttributes rttr) throws Exception {
			adminFaqService.delete(faq_no);
			
			rttr.addFlashAttribute("msg", "SUCCESS");
			log.info("delete");
			
			return "redirect:/admin/faq/list";
		}

}
