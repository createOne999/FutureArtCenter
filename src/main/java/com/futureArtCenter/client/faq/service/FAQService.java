package com.futureArtCenter.client.faq.service;

import java.util.List;

import com.futureArtCenter.client.faq.vo.FAQVO;


public interface FAQService {
	
	// FAQ 목록 페이지
		public List<FAQVO> list() throws Exception;

}
