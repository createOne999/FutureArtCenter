package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.MediaVO;

public interface MediaDAO {
	// 미디어 공연 목록
	public List<MediaVO> list() throws Exception;
	// 미디어 예정 공연 목록
	public List<MediaVO> planList() throws Exception;
	// 미디어 상세
	public MediaVO detail(int showNo) throws Exception;
	// 미디어 상세 예정
	public MediaVO detailPlan(int showNo) throws Exception;
}
