package com.futureArtCenter.client.ticketing.dao;

import java.util.List;

import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;

public interface MediaTicketingDAO {

	public void mediaTicketing(MediaTicketingVO inputVO, String user_id) throws Exception;
	
	public int mediaRestTicket(MediaTicketingVO inputVO) throws Exception;
	
	public List<MediaTicketingVO> mediaRestTicketList(int showNo) throws Exception;

}
