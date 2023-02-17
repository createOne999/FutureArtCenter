package com.futureArtCenter.client.ticketing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;

public interface MediaTicketingDAO {

	public void mediaTicketing(@Param("inputVO") MediaTicketingVO inputVO, @Param("user_id") String user_id) throws Exception;
	
	public int mediaRestTicket(MediaTicketingVO inputVO) throws Exception;
	
	public List<MediaTicketingVO> mediaRestTicketList(int showNo) throws Exception;

}
