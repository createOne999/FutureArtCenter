package com.futureArtCenter.admin.media.service;

import java.util.List;

import com.futureArtCenter.admin.media.vo.AdminMediaVO;

public interface AdminMediaService {
	//리스트
	public List<AdminMediaVO> list() throws Exception;
	
	//등록
	public void register(AdminMediaVO mvo) throws Exception;
	
	//포스터 이미지 
	public String getShow_poster(Integer show_no) throws Exception;
	
}
