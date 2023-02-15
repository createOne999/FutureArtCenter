package com.futureArtCenter.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.futureArtCenter.admin.notice.VO.AdminNoticeVO;
import com.futureArtCenter.admin.notice.dao.AdminNoticeDAO;
import com.futureArtCenter.client.common.vo.PageRequest;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO adminNoticedao;
	
	// 공지사항 등록 처리
	@Transactional
	@Override
	public void register(AdminNoticeVO adminNoticeVO) throws Exception {
		adminNoticedao.register(adminNoticeVO);
		
		//첨부파일 추가
				String files = adminNoticeVO.getNotice_poster();
				
				if (files == null) {
					return;
				}
	}
	
	// 공지사항 목록 페이지
	@Override
	public List<AdminNoticeVO> list() throws Exception {
		return adminNoticedao.list();
	}
	
	// 공지사항 상세 페이지
	@Override
	public AdminNoticeVO read(Integer notice_no) throws Exception {
		return adminNoticedao.read(notice_no);
	}
	
	// 공지사항 수정 처리
	@Override
	public void modify(AdminNoticeVO adminNoticeVO) throws Exception {
		adminNoticedao.modify(adminNoticeVO);
	}
	
	// 공지사항 삭제 처리
	@Override
	public void delete(Integer notice_no) throws Exception {
		adminNoticedao.delete(notice_no);
	}
	
	// 포스터 이미지
		@Override
		public String getNotice_poster(Integer notice_no) throws Exception {
			return adminNoticedao.getnotice_poster(notice_no);
		}
		
		// 게시글 전체 건수를 반환한다.
		@Override
		public int count() throws Exception{
			return adminNoticedao.count();
		}
		
		// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
		@Override
		public List<AdminNoticeVO> page(PageRequest pageRequest) throws Exception{
			return adminNoticedao.page(pageRequest);
		}

}
