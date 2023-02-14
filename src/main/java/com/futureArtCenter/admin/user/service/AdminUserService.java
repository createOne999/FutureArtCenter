package com.futureArtCenter.admin.user.service;

import java.util.List;

import com.futureArtCenter.client.user.vo.UserVO;

public interface AdminUserService {
	
	//회원 리스트
	public List<UserVO> list() throws Exception;
	
	//탈퇴 리스트
	public List<UserVO> outList() throws Exception;
	
	
}
