package com.futureArtCenter.client.notice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.futureArtCenter.client.notice.vo.NoticeVO;

/*@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private notice_tb notice_tb;
	
	public void NoticeVO read(Integer notice_no) throws Exception {
		List<NoticeVO> results = notice_tb.query("SELECT notice_no, notice_title, notice_content, notice_poster, notice_date FROM notice_tb WHERE notice_no = ?", new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNotice_no(rs.getInt("notice_no"));
				noticeVO.setNotice_title(rs.getString("notice_title"));
				noticeVO.setNotice_content(rs.getString("notice_content"));
				noticeVO.setNotice_poster(rs.getString("notice_poster"));
				noticeVO.setNotice_date(rs.getDate("notice_date"));
				
				return noticeVO;
			}
		}, notice_no);
		
		return results.isEmpty() ? null : results.get(0);
	}

}
*/