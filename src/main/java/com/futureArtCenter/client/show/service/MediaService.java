package com.futureArtCenter.client.show.service;

import java.util.List;

import com.futureArtCenter.client.show.vo.MediaVO;

public interface MediaService {

	//미디어 목록 페이지
	public List<MediaVO> list() throws Exception;

	public List<MediaVO> planList() throws Exception;

	public MediaVO detail(int showNo) throws Exception;

	public MediaVO detailPlan(int showNo) throws Exception;

}
