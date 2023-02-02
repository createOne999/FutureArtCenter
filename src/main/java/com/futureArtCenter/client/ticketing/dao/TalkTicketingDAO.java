package com.futureArtCenter.client.ticketing.dao;

import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;

public interface TalkTicketingDAO {

	public void talkTicketing(TalkTicketingVO inputVO, String user_id) throws Exception;

}
