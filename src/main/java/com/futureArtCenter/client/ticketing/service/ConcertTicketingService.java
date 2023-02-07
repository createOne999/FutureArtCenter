package com.futureArtCenter.client.ticketing.service;

import java.util.List;

import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;

public interface ConcertTicketingService {

	public void concertTicketing(ConcertTicketingVO inputVO, String user_id) throws Exception;
	
	public List<Integer> restSit(ConcertTicketingVO inputVO, String showDateString) throws Exception;
	
	public int concertRestTicket(ConcertTicketingVO inputVO) throws Exception;

}
