package com.futureArtCenter.admin.concert.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminConcertVO {
	
	private Integer show_no;			//공연번호
	private String show_name;			//공연명
	private int show_price;				//공연금액
	private int show_round;				//공연회차
	private String show_time1;			//공연 시간1
	private String show_time2;			//공연 시간2
	private String show_content1;		//공연 내용1
	
	private MultipartFile content2;
	private String show_content2;		//공연 내용2	
	
	private MultipartFile poster;
	private String show_poster;			//공연 포스터
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date show_startdate;		//공연시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date show_closedate;		//공연 종료일
	
	private int show_status;			//공연상태
	private String concert_artist;		//아티스트
	private String concert_genre;		//장르
	private String concert_bandname;	//밴드명

}
