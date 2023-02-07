package com.futureArtCenter.client.ticketing.dao;

import java.util.List;

import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;

public interface TalkTicketingDAO {

	public void talkTicketing(TalkTicketingVO inputVO, String user_id) throws Exception;

	public int talkRestTicket(TalkTicketingVO inputVO) throws Exception;
	
	public List<TalkTicketingVO> talkRestTicketList(int showNo) throws Exception;

}
