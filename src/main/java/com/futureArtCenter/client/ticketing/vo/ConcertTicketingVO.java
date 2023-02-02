package com.futureArtCenter.client.ticketing.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConcertTicketingVO {
	private int ticketingNo;//예매번호
	private int showNo;//공연번호
	private int userNo;//회원번호
	private int ticketingAmount;//예매매수
	private Date ticketingDate;//예매일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date showDate;//공연일
	private int ticketingPayment;//결제수단
	private int ticketingCancel;//취소여부
	private Date ticketingCancelDate;//취소일
	private int ticketingSit1;//좌석번호1
	private int ticketingSit2;//좌석번호2
	private int ticketingPayamount;//최종결제금액
	private int ticketingCancelAmount;//환불금액
	private String ticketingCode1;//티켓코드1
	private String ticketingCode2;//티켓코드2
	private int ticketingRound;//공연회차
}
