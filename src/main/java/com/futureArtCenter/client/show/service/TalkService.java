package com.futureArtCenter.client.show.service;

import java.util.List;

import com.futureArtCenter.client.show.vo.TalkVO;
import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;

public interface TalkService {

	public List<TalkVO> list() throws Exception;

	public List<TalkVO> planList() throws Exception;

	public TalkVO detail(int showNo) throws Exception;

	public TalkVO detailPlan(int showNo) throws Exception;
	
	public List<TalkTicketingVO> talkRestTicketList(int showNo) throws Exception;

}
