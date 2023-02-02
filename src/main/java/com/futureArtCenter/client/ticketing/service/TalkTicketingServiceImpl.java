package com.futureArtCenter.client.ticketing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.ticketing.dao.TalkTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;

@Service
public class TalkTicketingServiceImpl implements TalkTicketingService {
	@Autowired
	private TalkTicketingDAO dao;

	@Override
	public void talkTicketing(TalkTicketingVO inputVO, String user_id) throws Exception {
		dao.talkTicketing(inputVO, user_id);
		
	}
}
