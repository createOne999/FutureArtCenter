package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.TalkVO;
import com.futureArtCenter.common.vo.PageRequest;

public interface TalkDAO {

	public List<TalkVO> list() throws Exception;
	
	public List<TalkVO> planMainList() throws Exception;

	public List<TalkVO> planList(PageRequest pageRequest) throws Exception;

	public TalkVO detail(int showNo) throws Exception;

	public TalkVO detailPlan(int showNo) throws Exception;

	public int planCount() throws Exception;

}
