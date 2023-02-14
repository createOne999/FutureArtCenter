package com.futureArtCenter.admin.concert.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.admin.concert.dao.AdminConcertDAO;
import com.futureArtCenter.admin.concert.vo.AdminConcertVO;

import lombok.extern.java.Log;

@Log
@Service
public class AdminConcertServiceImpl implements AdminConcertService {

	@Autowired
	private AdminConcertDAO adminConcertDAO;

	// 목록
	@Override
	public List<AdminConcertVO> list() throws Exception {
		return adminConcertDAO.list();
	}

	// 등록
	@Transactional
	@Override
	public void register(AdminConcertVO cvo) throws Exception {
		log.info("serviceImpl..");

		adminConcertDAO.register(cvo);

		// 첨부파일 추가
		String files = cvo.getShow_poster();

		if (files == null) {
			return;
		}

	}

	// 포스터 이미지
	@Override
	public String getShow_poster(Integer show_no) throws Exception {
		return adminConcertDAO.getShow_poster(show_no);
	}

	// 공연 상태 변경
	@Transactional
	@Override
	public int status(AdminConcertVO cvo) throws Exception {
		log.info("showStatus");
		int change = adminConcertDAO.status(cvo);
		return change;
	}

	// 공연 상태 변경
	@Transactional
	@Override
	public int statusEnd(AdminConcertVO cvo) throws Exception {
		log.info("showStatus");
		int change = adminConcertDAO.status(cvo);
		return change;
	}
	
	@Transactional
	@Override
	public void delete(String show_no) throws Exception {
		adminConcertDAO.delete(show_no);
	}
}
