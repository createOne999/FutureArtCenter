package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.ConcertVO;
import com.futureArtCenter.common.vo.PageRequest;

public interface ConcertDAO {

	public List<ConcertVO> list() throws Exception;
	
	public List<ConcertVO> planMainList() throws Exception;

	public List<ConcertVO> planList(PageRequest pageRequest) throws Exception;

	public ConcertVO detail(int showNo) throws Exception;

	public ConcertVO detailPlan(int showNo) throws Exception;

	public int planCount() throws Exception;

}
