package com.futureArtCenter.admin.concert.service;

import java.util.List;

import com.futureArtCenter.admin.concert.vo.AdminConcertVO;

public interface AdminConcertService {
	// 리스트
	public List<AdminConcertVO> list() throws Exception;

	// 등록
	public void register(AdminConcertVO cvo) throws Exception;

	// 포스터 이미지
	public String getShow_poster(Integer show_no) throws Exception;

	// 공연 상태 변경
	public int status(AdminConcertVO cvo) throws Exception;

	// 공연 상태 변경
	public int statusEnd(AdminConcertVO cvo) throws Exception;

	// 삭제
	public void delete(String show_no) throws Exception;
}
