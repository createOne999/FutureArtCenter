package com.futureArtCenter.client.show.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.futureArtCenter.client.show.dao.TalkDAO;
import com.futureArtCenter.client.show.vo.TalkVO;

@Controller
public class TalkServiceImpl implements TalkService {
	@Autowired
	private TalkDAO dao;

	@Override
	public List<TalkVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<TalkVO> planList() throws Exception {
		return dao.planList();
	}

	@Override
	public TalkVO detail(int showNo) throws Exception {
		return dao.detail(showNo);
	}

	@Override
	public TalkVO detailPlan(int showNo) throws Exception {
		return dao.detailPlan(showNo);
	}
}
