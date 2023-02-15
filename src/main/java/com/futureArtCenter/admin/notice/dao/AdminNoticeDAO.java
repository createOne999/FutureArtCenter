package com.futureArtCenter.admin.notice.dao;

import java.util.List;

import com.futureArtCenter.admin.notice.VO.AdminNoticeVO;
import com.futureArtCenter.client.common.vo.PageRequest;

public interface AdminNoticeDAO {
	
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
	
	// 포스터 등록
	public String getnotice_poster(Integer notice_no) throws Exception;
	
	// 게시글 전체 건수를 반환한다.
			public int count() throws Exception;
			
			// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
			public List<AdminNoticeVO> page(PageRequest pageRequest) throws Exception;

}
