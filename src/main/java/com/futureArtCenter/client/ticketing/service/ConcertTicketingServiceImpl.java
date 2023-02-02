package com.futureArtCenter.client.ticketing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.ticketing.dao.ConcertTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;

@Service
public class ConcertTicketingServiceImpl implements ConcertTicketingService {
	@Autowired
	private ConcertTicketingDAO dao;

	@Override
	public void concertTicketing(ConcertTicketingVO inputVO, String user_id) throws Exception {
		dao.concertTicketing(inputVO, user_id);
		
	}

	@Override
	public List<Integer> restSit(ConcertTicketingVO inputVO, String showDateString) throws Exception {
		return dao.restSit(inputVO, showDateString);
	}
}
