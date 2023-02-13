package com.futureArtCenter.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.admin.faq.VO.AdminFaqVO;
import com.futureArtCenter.admin.faq.dao.AdminFaqDAO;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {
	
	@Autowired
	private AdminFaqDAO adminFaqdao;
	
	// 공지사항 등록 처리
	@Transactional
	@Override
	public void register(AdminFaqVO adminFaqVO) throws Exception {
		adminFaqdao.register(adminFaqVO);
	
	}
	
	// 공지사항 목록 페이지
	@Override
	public List<AdminFaqVO> list() throws Exception {
		return adminFaqdao.list();
	}
	
	// 공지사항 상세 페이지
	@Override
	public AdminFaqVO read(Integer faq_no) throws Exception {
		return adminFaqdao.read(faq_no);
	}
	
	// 공지사항 수정 처리
	@Override
	public void modify(AdminFaqVO adminFaqVO) throws Exception {
		adminFaqdao.modify(adminFaqVO);
	}
	
	// 공지사항 삭제 처리
	@Override
	public void delete(Integer faq_no) throws Exception {
		adminFaqdao.delete(faq_no);
	}

}
