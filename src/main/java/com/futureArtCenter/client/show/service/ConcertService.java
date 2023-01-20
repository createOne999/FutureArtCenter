package com.futureArtCenter.client.show.service;

import java.util.List;

import com.futureArtCenter.client.show.vo.ConcertVO;

public interface ConcertService {

	public List<ConcertVO> list() throws Exception;

	public List<ConcertVO> planList() throws Exception;

}
