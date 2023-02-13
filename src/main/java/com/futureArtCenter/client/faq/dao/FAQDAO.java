package com.futureArtCenter.client.faq.dao;

import java.util.List;

import com.futureArtCenter.client.faq.vo.FAQVO;


public interface FAQDAO {
	
	// FAQ 목록 페이지
			public List<FAQVO> list() throws Exception;

}
