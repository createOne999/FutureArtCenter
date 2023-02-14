package com.futureArtCenter.admin.user.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.futureArtCenter.admin.user.service.AdminUserService;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {

		List<UserVO> memberList = adminUserService.list();
		List<UserVO> memberOutList = adminUserService.outList();
		model.addAttribute("member_list", memberList);
		model.addAttribute("member_out_list", memberOutList);
		
		return "admin/user/adminUserList";

	}

	

}
