package com.futureArtCenter.admin.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.admin.sales.service.AdminSalesService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/sales")
public class AdminSalesController {

	@Autowired
	private AdminSalesService adminSalesService;

	@RequestMapping(value = "/adminSalesList", method = RequestMethod.GET)
	public void salesList(Model model) throws Exception {
		log.info("salesConcert");
		model.addAttribute("salesConcertList", adminSalesService.salesConcertList());
		model.addAttribute("salesMediaList", adminSalesService.salesMediaList());
		model.addAttribute("salesTalkList", adminSalesService.salesTalkList());
	}
	
	@RequestMapping(value = "/adminRefundList", method = RequestMethod.GET)
	public void refundList(Model model) throws Exception {
		log.info("refundConcert");
		model.addAttribute("refundConcertList", adminSalesService.refundConcertList());
		model.addAttribute("refundMediaList", adminSalesService.refundMediaList());
		model.addAttribute("refundTalkList", adminSalesService.refundTalkList());
	}
	
	@GetMapping(value = "/adminSalesMonth")
	public String salesMonthList(Model model) throws Exception {
		System.out.println(adminSalesService.salesMonthList());
		model.addAttribute("AdminSalesMonth", adminSalesService.salesMonthList());
		return "admin/sales/adminSalesMonth";
	}
	
	@GetMapping(value = "/adminSalesWeek")
	public String salesWeekList(Model model) throws Exception{
		System.out.println(adminSalesService.salesWeekList());
		model.addAttribute("AdminSalesWeek", adminSalesService.salesWeekList());
		return "admin/sales/adminSalesWeek";
	}
}
