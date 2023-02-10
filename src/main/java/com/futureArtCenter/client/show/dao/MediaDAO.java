package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.MediaVO;
import com.futureArtCenter.common.vo.PageRequest;

public interface MediaDAO {
	// 미디어 공연 목록
	public List<MediaVO> list() throws Exception;
	
	public List<MediaVO> planMainList() throws Exception;

	// 미디어 예정 공연 목록
	public List<MediaVO> planList(PageRequest pageRequest) throws Exception;

	// 미디어 상세
	public MediaVO detail(int showNo) throws Exception;

	// 미디어 상세 예정
	public MediaVO detailPlan(int showNo) throws Exception;

	public int planCount() throws Exception;
}
