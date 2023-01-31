package com.futureArtCenter;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.futureArtCenter.client.login.dao.LoginDAO;
import com.futureArtCenter.client.user.vo.UserVO;

@SpringBootTest
class FutureArtCenterApplicationTests {
	/* 로그인 쿼리 mapper 메서드 테스트 */
	 public void userLogin() throws Exception{
	        
	        UserVO user = new UserVO();    // MemberVO 변수 선언 및 초기화
	        
	        /* 올바른 아이디 비번 입력경우 */
	        user.setUser_id("password");
	        user.setUser_pwd("password");
	        
	        /* 올바른 않은 아이디 비번 입력경우 */
	        //member.setMemberId("test1123");
	        //member.setMemberPw("test1321321");
	        
	        LoginDAO loginDAO = null;
			System.out.println("결과 값 : " +loginDAO.userLogin(user));
	        
	    }

}
