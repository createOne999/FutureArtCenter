package com.futureArtCenter.client.ticketing.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@PostMapping("/mediapayment")
	public void mediapayment(Model model, MediaVO showVO, MediaTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);
		
		

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", mediaService.detail(showVO.getShowNo()));
	}

	// 강연 결제 페이지 호출
	@PostMapping("/talkpayment")
	public void talkpayment(Model model, TalkVO showVO, TalkTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", talkService.detail(showVO.getShowNo()));
	}

	// 콘서트 결제 페이지 호출
	@PostMapping("/concertpayment")
	public void concertpayment(Model model, ConcertVO showVO, ConcertTicketingVO inputVO) throws Exception {
		System.out.println(inputVO);
		System.out.println(showVO);

		model.addAttribute("ticketingVO", inputVO);
		model.addAttribute("showVO", concertService.detail(showVO.getShowNo()));
	}
	
	// 미디어 남은 좌석 체크
	@PostMapping("/mediaCheck")
	@ResponseBody
	public HashMap<String, String> mediaCheck(@RequestBody MediaTicketingVO mediaTicketingVO) throws Exception{
		System.out.println(mediaTicketingVO);
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		int restTicket = mediaTicketingService.mediaRestTicket(mediaTicketingVO);
		// 좌석수 부족 에러
		if ((restTicket == 1 && mediaTicketingVO.getTicketingAmount()==2) || restTicket == 0 ) {
			System.out.println(mediaTicketingVO);
			System.out.println("좌석수 부족 에러");
			result.put("result", "FAIL");
		}else {
			result.put("result", "SUCCESS");
		}
		return result;
	}

	// 미디어 결제 처리
	@PostMapping("/mediapaymenting")
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
	
	// 강연 남은 좌석 체크
	@PostMapping("/talkCheck")
	@ResponseBody
	public HashMap<String, String> talkCheck(@RequestBody TalkTicketingVO talkTicketingVO) throws Exception{
		System.out.println(talkTicketingVO);
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		int restTicket = talkTicketingService.talkRestTicket(talkTicketingVO);
		// 좌석수 부족 에러
		if ((restTicket == 1 && talkTicketingVO.getTicketingAmount()==2) || restTicket == 0 ) {
			System.out.println(talkTicketingVO);
			System.out.println("좌석수 부족 에러");
			result.put("result", "FAIL");
		}else {
			result.put("result", "SUCCESS");
		}
		return result;
	}

	// 강연 결제 처리
	@PostMapping("/talkpaymenting")
	public String talkpaymenting(Model model, TalkTicketingVO inputVO, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		talkTicketingService.talkTicketing(inputVO, user.getUser_id());

		return "redirect:/info/ticketinglist";
	}
	
	// 콘서트 남은 좌석 체크
	@PostMapping("/concertCheck")
	@ResponseBody
	public HashMap<String, String> concertCheck(@RequestBody ConcertTicketingVO concertTicketingVO) throws Exception{
		System.out.println(concertTicketingVO);
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		int restTicket = concertTicketingService.concertRestTicket(concertTicketingVO);
		// 좌석수 부족 에러
		if ((restTicket == 1 && concertTicketingVO.getTicketingAmount()==2) || restTicket == 0 ) {
			System.out.println(concertTicketingVO);
			System.out.println("좌석수 부족 에러");
			result.put("result", "FAIL");
			return result;
		}else {
			// 잔여 좌석정보 가져와서 입력된 값과 비교
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String showDateString = df.format(concertTicketingVO.getShowDate());
			System.out.println(showDateString);
			ArrayList<Integer> restSitList = (ArrayList<Integer>) concertTicketingService.restSit(concertTicketingVO, showDateString);
			// SingletonList는 요소가 없거나 하나인 경우에 사용하면 좋다. Arrays.asList()보다 크기가 작기 때문이다.
			restSitList.removeAll(Collections.singletonList(null));// null 값 제거
			System.out.println(restSitList);
			// 조작방지
			if (restSitList.isEmpty()) {
				result.put("result", "SUCCESS");
			}else {
				try {
					for (Integer restSit : restSitList) {
						if (concertTicketingVO.getTicketingSit1() == restSit) {
							System.out.println("좌석번호1이 잘못 되었습니다.");
							result.put("result", "TAKE");
							return result;
						}else {
							result.put("result", "SUCCESS");
						}
						if (concertTicketingVO.getTicketingSit2() == restSit) {
							System.out.println("좌석번호2이 잘못 되었습니다");
							result.put("result", "TAKE");
							return result;
						}else {
							result.put("result", "SUCCESS");
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(result);
		return result;
	}

	// 콘서트 결제 처리
	@PostMapping("/concertpaymenting")
	public String concertpaymenting(Model model, ConcertTicketingVO inputVO, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");

		concertTicketingService.concertTicketing(inputVO, user.getUser_id());

		return "redirect:/info/ticketinglist";
	}
}
