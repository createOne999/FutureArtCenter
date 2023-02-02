package com.futureArtCenter.client.ticketing.dao;

import java.util.List;

import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;

public interface ConcertTicketingDAO {

	public void concertTicketing(ConcertTicketingVO inputVO, String user_id) throws Exception;
	
	public List<Integer> restSit(ConcertTicketingVO inputVO, String showDateString) throws Exception;

}
