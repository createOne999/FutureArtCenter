package com.futureArtCenter.admin.user.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.admin.user.dao.AdminUserDAO;
import com.futureArtCenter.client.user.vo.UserVO;

import lombok.extern.java.Log;

@Log
@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserDAO adminUserDAO;

	// 회원 목록
	@Override
	public List<UserVO> list() throws Exception {
		return adminUserDAO.list();
	}

	// 회원 탈퇴 목록
	@Override
	public List<UserVO> outList() throws Exception {
		return adminUserDAO.outList();
	}
	
	// 월별 유저수 통계
	@Override
	public List<Map<String, Object>> userMonthList() throws Exception {
		return adminUserDAO.userMonthList();
	}
}
