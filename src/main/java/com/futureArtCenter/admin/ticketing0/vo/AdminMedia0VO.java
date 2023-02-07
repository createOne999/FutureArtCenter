package com.futureArtCenter.admin.ticketing0.vo;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminMedia0VO {
	
	private int ticketing_no;			//예매 번호
	private int show_no;				//공연 번호
	private int user_no;				//회원 번호
	private int ticketing_amount;		//예매 매수
	private Date ticketing_date;		//예매일
	private Date show_date;				//공연일
	private int ticketing_payment;		//결제수단
	private int ticketing_cancel;		//취소여부
	
	private Date ticketing_cancel_date;	//취소일
	
	private int ticketing_payamount;	//최종결제금액

	private int ticketing_cancel_amount;//환불금액

	private String ticketing_code1;		//티켓코드1
	
	private String ticketing_code2;		//티켓코드2

	private int ticketing_round;		//예매 회차

}
