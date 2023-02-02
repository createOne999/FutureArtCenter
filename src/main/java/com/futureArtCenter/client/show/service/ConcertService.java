package com.futureArtCenter.client.show.service;

import java.util.List;

import com.futureArtCenter.client.show.vo.ConcertVO;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;

public interface ConcertService {

	public List<ConcertVO> list() throws Exception;

	public List<ConcertVO> planList() throws Exception;

	public ConcertVO detail(int showNo) throws Exception;

	public ConcertVO detailPlan(int showNo) throws Exception;
	
	public List<Integer> restSit(ConcertTicketingVO showVO, String showDateString) throws Exception;

}
