package com.futureArtCenter.admin.user.dao;

import java.util.List;
import com.futureArtCenter.client.user.vo.UserVO;
import java.util.Map;
public interface AdminUserDAO {
	
	//리스트
	public List<UserVO> list() throws Exception;
	
	//탈퇴 리스트
	public List<UserVO> outList() throws Exception;
	
	//월별 유저수 통계
	public List<Map<String, Object>> userMonthList() throws Exception;

}
