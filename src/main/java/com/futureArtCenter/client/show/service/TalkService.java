package com.futureArtCenter.client.show.service;

import java.util.List;

import com.futureArtCenter.client.show.vo.TalkVO;

public interface TalkService {

	public List<TalkVO> list() throws Exception;

	public List<TalkVO> planList() throws Exception;

}
