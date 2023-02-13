package com.futureArtCenter.client.notice.vo;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private int notice_no;	// 게시판 번호
	private String notice_title;	// 게시판 제목
	private String notice_content;	// 게시판 내용
	private String notice_poster;	// 게시판 포스터
	private Date notice_date;	// 게시판 날짜

}
