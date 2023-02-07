package com.futureArtCenter.admin.concert.dao;

import java.util.List;

import com.futureArtCenter.admin.concert.vo.AdminConcertVO;

public interface AdminConcertDAO {
	
	public List<AdminConcertVO> list() throws Exception;

	public void register(AdminConcertVO cvo) throws Exception;

	public String getShow_poster(Integer show_no) throws Exception;

}