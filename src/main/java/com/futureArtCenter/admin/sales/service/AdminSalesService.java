package com.futureArtCenter.admin.sales.service;

import java.util.List;
import java.util.Map;

import com.futureArtCenter.client.user.vo.UserVO;

public interface AdminSalesService {

	//예매 현황 리스트
	public List<Map<String, Object>> salesConcertList() throws Exception;
	public List<Map<String, Object>> salesMediaList() throws Exception;
	public List<Map<String, Object>> salesTalkList() throws Exception;
	
	//예매 현황 리스트
	public List<Map<String, Object>> refundConcertList() throws Exception;
	public List<Map<String, Object>> refundMediaList() throws Exception;
	public List<Map<String, Object>> refundTalkList() throws Exception;
	
	//월별 매출 현황
	public List<Map<String, Object>> salesMonthList() throws Exception;
	
	//주간 예약 현황
	public List<Map<String, Object>> salesWeekList() throws Exception;
}
