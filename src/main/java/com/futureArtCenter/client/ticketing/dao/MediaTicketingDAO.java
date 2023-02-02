package com.futureArtCenter.client.ticketing.dao;

import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;

public interface MediaTicketingDAO {

	public void mediaTicketing(MediaTicketingVO inputVO, String user_id) throws Exception;

}
