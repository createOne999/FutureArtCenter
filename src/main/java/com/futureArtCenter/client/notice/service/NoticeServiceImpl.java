package com.futureArtCenter.client.notice.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.common.vo.PageRequest;
import com.futureArtCenter.client.notice.dao.NoticeDAO;
import com.futureArtCenter.client.notice.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticedao;
	
	// 공지사항 목록 페이지
	@Override
	public List<NoticeVO> list() throws Exception {
		return noticedao.list();
	}
	
	// 공지사항 상세 페이지
	@Override
	public NoticeVO read(Integer notice_no) throws Exception {
		return noticedao.read(notice_no);
	}
	
	// 게시글 전체 건수를 반환한다.
	@Override
	public int count() throws Exception{
		return noticedao.count();
	}
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<NoticeVO> page(PageRequest pageRequest) throws Exception{
		return noticedao.page(pageRequest);
	}
	
	

}
