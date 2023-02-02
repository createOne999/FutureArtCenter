package com.futureArtCenter.client.show.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MediaVO {
	private int showNo;
	private String showName;
	private int showPrice;
	private int showRound;
	private String showTime1;
	private String showTime2;
	private String showContent1;
	private String showContent2;
	private String showPoster;
	private Date showStartdate;
	private Date showClosedate;
	private int showStatus;
	private String mediaName;
	private String mediaDirector;
}
