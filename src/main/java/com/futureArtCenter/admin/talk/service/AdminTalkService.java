package com.futureArtCenter.admin.talk.service;

import java.util.List;

import com.futureArtCenter.admin.talk.vo.AdminTalkVO;

public interface AdminTalkService {
	// 리스트
	public List<AdminTalkVO> list() throws Exception;

	// 등록
	public void register(AdminTalkVO tvo) throws Exception;

	// 포스터 이미지
	public String getShow_poster(Integer show_no) throws Exception;

	// 공연 상태 변경
	public int status(AdminTalkVO tvo) throws Exception;

	// 공연 상태 변경
	public int statusEnd(AdminTalkVO tvo) throws Exception;
	
	//삭제
	public void delete(String show_no) throws Exception;
}
