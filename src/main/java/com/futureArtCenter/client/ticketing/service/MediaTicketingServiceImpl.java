package com.futureArtCenter.client.ticketing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.ticketing.dao.MediaTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;

@Service
public class MediaTicketingServiceImpl implements MediaTicketingService {
	@Autowired
	private MediaTicketingDAO dao;


	@Override
	public void mediaTicketing(MediaTicketingVO inputVO, String user_id) throws Exception {
		dao.mediaTicketing(inputVO, user_id);
		
	}


	@Override
	public int mediaRestTicket(MediaTicketingVO inputVO) throws Exception {
		return dao.mediaRestTicket(inputVO);
	}
}
