package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.TalkVO;

public interface TalkDAO {

	public List<TalkVO> list() throws Exception;

	public List<TalkVO> planList() throws Exception;

	public TalkVO detail(int showNo) throws Exception;

	public TalkVO detailPlan(int showNo) throws Exception;

}
