package com.futureArtCenter.admin.talk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.admin.talk.dao.AdminTalkDAO;
import com.futureArtCenter.admin.talk.vo.AdminTalkVO;

import lombok.extern.java.Log;

@Log
@Service
public class AdminTalkServiceImpl implements AdminTalkService {
	@Autowired
	private AdminTalkDAO adminTalkDAO;

	// 목록
	@Override
	public List<AdminTalkVO> list() throws Exception {
		return adminTalkDAO.list();
	}

	@Transactional
	@Override
	public void register(AdminTalkVO tvo) throws Exception {
		log.info("serviceImpl..");

		adminTalkDAO.register(tvo);

		// 첨부파일 추가
		String files = tvo.getShow_poster();

		if (files == null) {
			return;
		}

	}

	// 포스터 이미지
	@Override
	public String getShow_poster(Integer show_no) throws Exception {
		return adminTalkDAO.getShow_poster(show_no);
	}

	// 공연 상태 변경
	@Transactional
	@Override
	public int status(AdminTalkVO tvo) throws Exception {
		log.info("showStatus");
		int change = adminTalkDAO.status(tvo);
		return change;
	}

	// 공연 상태 변경
	@Transactional
	@Override
	public int statusEnd(AdminTalkVO tvo) throws Exception {
		log.info("showStatus");
		int change = adminTalkDAO.status(tvo);
		return change;
	}
	
	@Transactional
	@Override
	public void delete(String show_no) throws Exception {
		adminTalkDAO.delete(show_no);
	}

}
