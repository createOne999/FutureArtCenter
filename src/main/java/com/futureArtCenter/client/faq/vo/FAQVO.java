package com.futureArtCenter.client.faq.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FAQVO {
	private int faq_no;	// faq 번호
	private String faq_title;	// faq 제목
	private String faq_content;	// faq 내용
	private int faq_category;	// faq 카테고리

}
