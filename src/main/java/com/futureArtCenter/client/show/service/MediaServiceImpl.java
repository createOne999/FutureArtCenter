package com.futureArtCenter.client.show.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.show.dao.MediaDAO;
import com.futureArtCenter.client.show.vo.MediaVO;
import com.futureArtCenter.client.ticketing.dao.MediaTicketingDAO;
import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;
import com.futureArtCenter.common.vo.PageRequest;


@Service
public class MediaServiceImpl implements MediaService {
	@Autowired
	private MediaDAO dao;
	
	@Autowired
	private MediaTicketingDAO mediaTicketingDAO;

	@Override
	public List<MediaVO> list() throws Exception {
		return dao.list();
	}
	
	@Override
	public List<MediaVO> planList() throws Exception {
		return dao.planMainList();
	}

	@Override
	public List<MediaVO> planList(PageRequest pageRequest) throws Exception {
		return dao.planList(pageRequest);
	}

	@Override
	public MediaVO detail(int showNo) throws Exception {
		return dao.detail(showNo);
	}

	@Override
	public MediaVO detailPlan(int showNo) throws Exception {
		return dao.detailPlan(showNo);
	}

	@Override
	public List<MediaTicketingVO> mediaRestTicketList(int showNo) throws Exception {
		return mediaTicketingDAO.mediaRestTicketList(showNo);
	}

	@Override
	public int planCount() throws Exception {
		return dao.planCount();
	}
}
