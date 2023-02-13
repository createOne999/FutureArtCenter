package com.futureArtCenter.admin.faq.dao;

import java.util.List;

import com.futureArtCenter.admin.faq.VO.AdminFaqVO;

public interface AdminFaqDAO {
	
		// faq 등록 처리
		public void register(AdminFaqVO adminFaqVO) throws Exception;
		
		// faq 목록 페이지
		public List<AdminFaqVO> list() throws Exception;
		
		// faq 상세 페이지
		public AdminFaqVO read(Integer faq_no) throws Exception;
		
		// faq 수정 처리
		public void modify(AdminFaqVO adminFaqVO) throws Exception;
		
		// faq 삭제 처리
		public void delete(Integer faq_no) throws Exception;

}
