package com.futureArtCenter.admin.notice.VO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminNoticeVO {
	private int notice_no;	// 게시판 번호
	private String notice_title;	// 게시판 제목
	private String notice_content;	// 게시판 내용
	private MultipartFile poster;
	private String notice_poster;	// 게시판 포스터
	private Date notice_date;	// 게시판 날짜

}
