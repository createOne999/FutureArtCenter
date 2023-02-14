package com.futureArtCenter.admin.media.dao;

import java.util.List;

import com.futureArtCenter.admin.media.vo.AdminMediaVO;

public interface AdminMediaDAO {
	
	public List<AdminMediaVO> list() throws Exception;

	public void register(AdminMediaVO mvo) throws Exception;

	public String getShow_poster(Integer show_no) throws Exception;
	
	public int status(AdminMediaVO mvo) throws Exception;
	
	public int statusEnd(AdminMediaVO mvo) throws Exception;
	
	public void delete(String show_no) throws Exception;

}
