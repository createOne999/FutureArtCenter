
package com.futureArtCenter.admin.sales.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Repository
public class AdminSalesDAOImpl implements AdminSalesDAO {

	@Autowired
	private SqlSession session;
	private String Namespace = "com.futureArtCenter.admin.sales.dao.AdminSalesDAO";

	// 예매 현황 리스트
	@Override
	public List<Map<String, Object>> salesConcertList() throws Exception {
		return session.selectList(Namespace + "salesConcertList!");
	}

	@Override
	public List<Map<String, Object>> salesMediaList() throws Exception {
		return session.selectList(Namespace + "salesMediaList!");
	}

	@Override
	public List<Map<String, Object>> salesTalkList() throws Exception {
		return session.selectList(Namespace + "salesTalkList!");
	}
	
	@Override
	public List<Map<String, Object>> refundConcertList() throws Exception {
		return session.selectList(Namespace + "salesConcertList!");
	}

	@Override
	public List<Map<String, Object>> refundMediaList() throws Exception {
		return session.selectList(Namespace + "salesMediaList!");
	}

	@Override
	public List<Map<String, Object>> refundTalkList() throws Exception {
		return session.selectList(Namespace + "salesTalkList!");
	}
	
	@Override
	public List<Map<String, Object>> salesMonthList() throws Exception {
		return session.selectList(Namespace + "salesMonthList!");
	}
	
	@Override
	public List<Map<String, Object>> salesWeekList() throws Exception {
		return session.selectList(Namespace + "salesWeekList!");
	}

}
