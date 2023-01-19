package com.futureArtCenter.admin.login.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void adminMain(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formatted = dateFormat.format(date);
		
		model.addAttribute("serverTime", formatted);
	}
}
