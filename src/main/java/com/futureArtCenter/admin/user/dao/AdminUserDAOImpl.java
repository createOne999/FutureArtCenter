package com.futureArtCenter.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Repository
public class AdminUserDAOImpl implements AdminUserDAO {

	@Autowired
	private SqlSession session;
	private String Namespace = "com.futureArtCenter.admin.user.dao.AdminUserDAO";
	
	@Override
	public List<UserVO> list() throws Exception {
		return session.selectList(Namespace + "UserList!");
	}
	
	@Override
	public List<UserVO> outList() throws Exception {
		return session.selectList(Namespace + "UserList!");
	}

	@Override
	public List<Map<String, Object>> userMonthList() throws Exception {
		return session.selectList(Namespace + "UserList!");
	}
	
}
