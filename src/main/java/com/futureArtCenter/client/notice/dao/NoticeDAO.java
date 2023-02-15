package com.futureArtCenter.client.notice.dao;

import java.util.List;

import com.futureArtCenter.client.common.vo.PageRequest;
import com.futureArtCenter.client.notice.vo.NoticeVO;

public interface NoticeDAO {
	// 공지사항 목록 페이지
		public List<NoticeVO> list() throws Exception;
		
		
		// 공지사항 상세 페이지
		public NoticeVO read(Integer notice_no) throws Exception;
		
		
		// 게시글 전체 건수를 반환한다.
		public int count() throws Exception;
		
		// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
		public List<NoticeVO> page(PageRequest pageRequest) throws Exception;
		
		
		
}
