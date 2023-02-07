package com.futureArtCenter.admin.talk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.futureArtCenter.admin.talk.vo.AdminTalkVO;

import lombok.extern.java.Log;

@Log
@Repository
public class AdminTalkDAOImpl implements AdminTalkDAO {
	
	@Autowired
	private SqlSession session;
	private String Namespace = "com.futureArtCenter.admin.talk.dao.AdminTalkDAO";

	@Override
	public void register(AdminTalkVO tvo) throws Exception {
		log.info("daoImpl...");
		session.insert(Namespace, tvo);
	}

	@Override
	public List<AdminTalkVO> list() throws Exception {
		return session.selectList(Namespace + "mediaList!");
	}

	// 포스터 이미지
	@Override
	public String getShow_poster(Integer show_no) throws Exception {
		return session.selectOne("showPoster", show_no);
	}

}
