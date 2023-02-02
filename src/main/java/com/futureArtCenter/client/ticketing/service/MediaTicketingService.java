package com.futureArtCenter.client.ticketing.service;

import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;

public interface MediaTicketingService {

	public void mediaTicketing(MediaTicketingVO inputVO, String user_id) throws Exception;

}
