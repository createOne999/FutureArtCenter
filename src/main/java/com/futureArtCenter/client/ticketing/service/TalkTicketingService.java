package com.futureArtCenter.client.ticketing.service;

import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;

public interface TalkTicketingService {

	public void talkTicketing(TalkTicketingVO inputVO, String user_id) throws Exception;

}
