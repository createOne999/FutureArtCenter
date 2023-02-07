package com.futureArtCenter.client.show.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.show.dao.ConcertDAO;
import com.futureArtCenter.client.show.vo.ConcertVO;
import com.futureArtCenter.client.ticketing.dao.ConcertTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;
@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private ConcertDAO dao;
	
	@Autowired
	private ConcertTicketingDAO concertTicketingDAO;

	@Override
	public List<ConcertVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<ConcertVO> planList() throws Exception {
		return dao.planList();
	}

	@Override
	public ConcertVO detail(int showNo) throws Exception {
		return dao.detail(showNo);
	}

	@Override
	public ConcertVO detailPlan(int showNo) throws Exception {
		return dao.detailPlan(showNo);
	}

	@Override
	public List<Integer> restSit(ConcertTicketingVO inputVO, String showDateString) throws Exception {
		return concertTicketingDAO.restSit(inputVO, showDateString);
	}

	@Override
	public List<ConcertTicketingVO> concertRestTicketList(int showNo) throws Exception {
		return concertTicketingDAO.concertRestTicketList(showNo);
	}
}
