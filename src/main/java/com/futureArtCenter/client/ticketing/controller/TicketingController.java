package com.futureArtCenter.client.ticketing.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.futureArtCenter.client.show.service.ConcertService;
import com.futureArtCenter.client.show.service.MediaService;
import com.futureArtCenter.client.show.service.TalkService;
import com.futureArtCenter.client.show.vo.ConcertVO;
import com.futureArtCenter.client.show.vo.MediaVO;
import com.futureArtCenter.client.show.vo.TalkVO;
import com.futureArtCenter.client.ticketing.service.ConcertTicketingService;
import com.futureArtCenter.client.ticketing.service.MediaTicketingService;
import com.futureArtCenter.client.ticketing.service.TalkTicketingService;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;
import com.futureArtCenter.client.ticketing.vo.MediaTicketingVO;
import com.futureArtCenter.client.ticketing.vo.TalkTicketingVO;
import com.futureArtCenter.client.user.service.UserService;
import com.futureArtCenter.client.user.vo.UserVO;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {
	@Autowired
	private MediaTicketingService mediaTicketingService;

	@Autowired
	private MediaService mediaService;

	@Autowired
	private TalkTicketingService talkTicketingService;

	@Autowired
	private TalkService talkService;

	@Autowired
	private ConcertTicketingService concertTicketingService;

	@Autowired
	private ConcertService concertService;

	// 미디어 결제 페이지 호출
	@RequestMapping(value = "/mediapayment", method = RequestMethod.POST)
	public void mediapayment(Model model, MediaVO showVO, MediaTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", mediaService.detail(showVO.getShowNo()));
	}

	// 강연 결제 페이지 호출
	@RequestMapping(value = "/talkpayment", method = RequestMethod.POST)
	public void talkpayment(Model model, TalkVO showVO, TalkTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", talkService.detail(showVO.getShowNo()));
	}

	// 콘서트 결제 페이지 호출
	@RequestMapping(value = "/concertpayment", method = RequestMethod.POST)
	public void concertpayment(Model model, ConcertVO showVO, ConcertTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", concertService.detail(showVO.getShowNo()));
	}

	// 미디어 결제 처리
	@RequestMapping(value = "/mediapaymenting", method = RequestMethod.POST)
	public String mediapaymenting(Model model, MediaTicketingVO inputVO, HttpSession session) throws Exception {
		// 세션에 저장된 userId를 바탕으로 userNo 값 가져오기
		UserVO user = (UserVO) session.getAttribute("user");

		// 예매 매수 기준으로 티켓코드1, 티켓코드 2 추가
		// 티켓코드 = 공연일자 + 회차 + 공연관 + 일련번호
		// ticketing_code = showDate(yymmdd) + showRound + 1 + 000
		// 일련번호는 showNo showDate showRound가 같은 where조건으로 검색한 sum(ticketingAmount)값 + 1
		// -> TO_CHAR -> LPAD(,3,'0')
		System.out.println(inputVO);
		mediaTicketingService.mediaTicketing(inputVO, user.getUser_id());

		return "redirect:/info/ticketinglist";
	}

	// 강연 결제 처리
	@RequestMapping(value = "/talkpaymenting", method = RequestMethod.POST)
	public String talkpaymenting(Model model, TalkTicketingVO inputVO, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		talkTicketingService.talkTicketing(inputVO, user.getUser_id());

		return "redirect:/info/ticketinglist";
	}

	// 콘서트 결제 처리
	@RequestMapping(value = "/concertpaymenting", method = RequestMethod.POST)
	public String concertpaymenting(Model model, ConcertTicketingVO inputVO, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		// 잔여 좌석정보 가져와서 입력된 값과 비교
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String showDateString = df.format(inputVO.getShowDate());
		System.out.println(showDateString);
		ArrayList<Integer> restSitList = (ArrayList<Integer>) concertTicketingService.restSit(inputVO, showDateString);
		// 조작방지
		try {
			for (Integer restSit : restSitList) {
				if (inputVO.getTicketingSit1() == restSit) {
					System.out.println("좌석번호1이 잘못 되었습니다.");
					return "main";
				}
				if (inputVO.getTicketingSit2() == restSit) {
					System.out.println("좌석번호2이 잘못 되었습니다");
					return "main";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		concertTicketingService.concertTicketing(inputVO, user.getUser_id());

		return "redirect:/info/ticketinglist";
	}
}
