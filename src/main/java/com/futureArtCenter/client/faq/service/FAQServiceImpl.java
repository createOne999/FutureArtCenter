package com.futureArtCenter.client.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.futureArtCenter.client.faq.dao.FAQDAO;
import com.futureArtCenter.client.faq.vo.FAQVO;


@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private FAQDAO faqdao;
	
	// 공지사항 목록 페이지
	@Override
	public List<FAQVO> list() throws Exception {
		return faqdao.list();
	}

}
