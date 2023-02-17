package com.futureArtCenter.admin.sales.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.admin.sales.dao.AdminSalesDAO;

import lombok.extern.java.Log;

@Log
@Service
public class AdminSalesServiceImpl implements AdminSalesService {
	
	@Autowired
	private AdminSalesDAO adminSalesDAO;
	
	@Override
	public List<Map<String, Object>> salesConcertList() throws Exception {
		return adminSalesDAO.salesConcertList();
	}
	
	@Override
	public List<Map<String, Object>> salesMediaList() throws Exception {
		return adminSalesDAO.salesMediaList();
	}
	
	@Override
	public List<Map<String, Object>> salesTalkList() throws Exception {
		return adminSalesDAO.salesTalkList();
	}
	
	
	@Override
	public List<Map<String, Object>> refundConcertList() throws Exception {
		return adminSalesDAO.refundConcertList();
	}
	
	@Override
	public List<Map<String, Object>> refundMediaList() throws Exception {
		return adminSalesDAO.refundMediaList();
	}
	
	@Override
	public List<Map<String, Object>> refundTalkList() throws Exception {
		return adminSalesDAO.refundTalkList();
	}
	
	//월별 매출
	@Override
	public List<Map<String, Object>> salesMonthList() throws Exception {
		return adminSalesDAO.salesMonthList();
	}
	
	//주간 예약 현황
	@Override
	public List<Map<String, Object>> salesWeekList() throws Exception {
		return adminSalesDAO.salesWeekList();
	}
	
}
