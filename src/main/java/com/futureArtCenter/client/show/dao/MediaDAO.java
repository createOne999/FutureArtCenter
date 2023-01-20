package com.futureArtCenter.client.show.dao;

import java.util.List;

import com.futureArtCenter.client.show.vo.MediaVO;

public interface MediaDAO {
	// 미디어 공연 목록
	public List<MediaVO> list() throws Exception;

	public List<MediaVO> planList() throws Exception;

}
