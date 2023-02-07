package com.futureArtCenter.admin.concert.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.futureArtCenter.admin.concert.vo.AdminConcertVO;

import lombok.extern.java.Log;

@Log
@Repository
public class AdminConcertDAOImpl implements AdminConcertDAO {
	
	@Autowired
	private SqlSession session;
	private String Namespace = "com.futureArtCenter.admin.concert.dao.AdminConcertDAO";

	@Override
	public void register(AdminConcertVO cvo) throws Exception {
		log.info("daoImpl...");
		session.insert(Namespace, cvo);
	}

	@Override
	public List<AdminConcertVO> list() throws Exception {
		return session.selectList(Namespace + "concertList!");
	}

	// 포스터 이미지
	@Override
	public String getShow_poster(Integer show_no) throws Exception {
		return session.selectOne("showPoster", show_no);
	}

}
