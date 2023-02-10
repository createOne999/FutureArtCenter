package com.futureArtCenter.client.show.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.futureArtCenter.client.show.dao.TalkDAO;
import com.futureArtCenter.client.show.vo.TalkVO;
import com.futureArtCenter.client.ticketing.dao.TalkTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;
import com.futureArtCenter.common.vo.PageRequest;

@Controller
public class TalkServiceImpl implements TalkService {
	@Autowired
	private TalkDAO dao;

	@Autowired
	private TalkTicketingDAO talkTicketingDAO;
	
	@Override
	public List<TalkVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<TalkVO> planList() throws Exception {
		return dao.planMainList();
	}
	
	@Override
	public List<TalkVO> planList(PageRequest pageRequest) throws Exception {
		return dao.planList(pageRequest);
	}

	@Override
	public TalkVO detail(int showNo) throws Exception {
		return dao.detail(showNo);
	}

	@Override
	public TalkVO detailPlan(int showNo) throws Exception {
		return dao.detailPlan(showNo);
	}

	@Override
	public List<TalkTicketingVO> talkRestTicketList(int showNo) throws Exception {
		return talkTicketingDAO.talkRestTicketList(showNo);
	}

	@Override
	public int planCount() throws Exception {
		return dao.planCount();
	}
}
