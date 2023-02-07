package com.futureArtCenter.admin.media.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.admin.media.dao.AdminMediaDAO;
import com.futureArtCenter.admin.media.vo.AdminMediaVO;

import lombok.extern.java.Log;

@Log
@Service
public class AdminMediaServiceImpl implements AdminMediaService {

	@Autowired
	private AdminMediaDAO adminMediaDAO;

	// 목록
	@Override
	public List<AdminMediaVO> list() throws Exception {
		return adminMediaDAO.list();
	}

	@Transactional
	@Override
	public void register(AdminMediaVO mvo) throws Exception {
		log.info("serviceImpl..");

		adminMediaDAO.register(mvo);
		
		//첨부파일 추가
		String files = mvo.getShow_poster();
		
		if (files == null) {
			return;
		}
		
	}

	// 포스터 이미지
	@Override
	public String getShow_poster(Integer show_no) throws Exception {
		return adminMediaDAO.getShow_poster(show_no);
	}

}
