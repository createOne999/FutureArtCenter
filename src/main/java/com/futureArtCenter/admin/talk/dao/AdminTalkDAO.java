package com.futureArtCenter.admin.talk.dao;

import java.util.List;

import com.futureArtCenter.admin.talk.vo.AdminTalkVO;

public interface AdminTalkDAO {

	public List<AdminTalkVO> list() throws Exception;

	public void register(AdminTalkVO tvo) throws Exception;

	public String getShow_poster(Integer show_no) throws Exception;

	public int status(AdminTalkVO tvo) throws Exception;
	
	public int statusEnd(AdminTalkVO tvo) throws Exception;
	
	public void delete(String show_no) throws Exception;
}
