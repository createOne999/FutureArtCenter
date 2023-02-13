package com.futureArtCenter.admin.notice.service;

import java.util.List;

import com.futureArtCenter.admin.notice.VO.AdminNoticeVO;

public interface AdminNoticeService {
	
	// 공지사항 등록 처리
	public void register(AdminNoticeVO adminNoticeVO) throws Exception;
	
	// 공지사항 목록 페이지
	public List<AdminNoticeVO> list() throws Exception;
	
	// 공지사항 상세 페이지
	public AdminNoticeVO read(Integer notice_no) throws Exception;
	
	// 공지사항 수정 처리
	public void modify(AdminNoticeVO adminNoticeVO) throws Exception;
	
	// 공지사항 삭제 처리
	public void delete(Integer notice_no) throws Exception;
	
	// 포스터 이미지
		public String getNotice_poster(Integer notice_no) throws Exception;

}
