package com.futureArtCenter.client.show.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.show.dao.ConcertDAO;
import com.futureArtCenter.client.show.vo.ConcertVO;
@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private ConcertDAO dao;

	@Override
	public List<ConcertVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<ConcertVO> planList() throws Exception {
		return dao.planList();
	}
}
