package com.futureArtCenter.client.ticketing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;

public interface ConcertTicketingDAO {

	public void concertTicketing(@Param("inputVO") ConcertTicketingVO inputVO, @Param("user_id") String user_id) throws Exception;
	
	public List<Integer> restSit(@Param("inputVO") ConcertTicketingVO inputVO, @Param("showDateString") String showDateString) throws Exception;
	
	public int concertRestTicket(ConcertTicketingVO inputVO) throws Exception;
	
	public List<ConcertTicketingVO> concertRestTicketList(int showNo) throws Exception;

}
