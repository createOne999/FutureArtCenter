package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.ConcertVO;

public interface ConcertDAO {

	public List<ConcertVO> list() throws Exception;

	public List<ConcertVO> planList() throws Exception;

	public ConcertVO detail(int showNo) throws Exception;

	public ConcertVO detailPlan(int showNo) throws Exception;

}
