package com.futureArtCenter.client.show.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.futureArtCenter.client.show.service.ConcertService;
import com.futureArtCenter.client.show.service.MediaService;
import com.futureArtCenter.client.show.service.TalkService;
import com.futureArtCenter.client.show.vo.ConcertVO;
import com.futureArtCenter.client.show.vo.MediaVO;
import com.futureArtCenter.client.show.vo.TalkVO;
import com.futureArtCenter.client.ticketing.vo.ConcertTicketingVO;
import com.futureArtCenter.common.vo.PageRequest;
import com.futureArtCenter.common.vo.Pagination;

@Controller
@RequestMapping("/show")
public class ShowController {
	@Autowired
	private MediaService mediaService;

	@Autowired
	private TalkService talkService;

	@Autowired
	private ConcertService concertService;
	
	// 이미지 저장 경로
	@Value("${upload.path}")
	private String uploadPath;
	
	// 저장된 이미지 가져오기
	@ResponseBody
	@GetMapping(value={"/poster", "/detail/poster"})
	public ResponseEntity<byte[]> displayFile(Integer show_no, String showPoster) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = showPoster;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);// 확장자명

			MediaType mType = getMediaType(formatName);// 확장자로 이미지 형식 확인
			HttpHeaders headers = new HttpHeaders();

			// separator 는 구분자, 'C:/upload/파일명'
			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	// 파일 확장자로 이미지 형식 확인
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}

			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}

			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

	// 공연 목록 보기
	@GetMapping("/showlist")
	public void showList(Model model) throws Exception {
		model.addAttribute("mediaList", mediaService.list());
		model.addAttribute("talkList", talkService.list());
		model.addAttribute("concertList", concertService.list());
	}
	

	// 공연 예정 목록보기
//	@GetMapping("/showplan")
//	public void showPlan(Model model) throws Exception {
//		model.addAttribute("mediaList", mediaService.planList());
//		model.addAttribute("talkList", talkService.planList());
//		model.addAttribute("concertList", concertService.planList());
//	}

	// Optional 은 매개변수가 null 이여도 받을 수 있는 클래스
	@GetMapping("/showplan")
	public void showPlan(Optional<Integer> mPage, Optional<Integer> tPage, Optional<Integer> cPage ,Model model) throws Exception {
		PageRequest mediaPageRequest = new PageRequest();
		PageRequest talkPageRequest = new PageRequest();
		PageRequest concertPageRequest = new PageRequest();
		
		// 페이지 값이 null 일 경우 PageRequest()의 생성자에 의해 자동으로 1로 됨
		// 이전 페이지 값 기억하기
		if (!mPage.isEmpty()) {
			mediaPageRequest.setPage(mPage.get());
		}
		if (!tPage.isEmpty()) {
			talkPageRequest.setPage(tPage.get());
		}
		if (!cPage.isEmpty()) {
			concertPageRequest.setPage(cPage.get());
		}
		// 상단 메인
		model.addAttribute("mediaMainList", mediaService.planList());
		model.addAttribute("talkMainList", talkService.planList());
		model.addAttribute("concertMainList", concertService.planList());
		// 하단 게시판
		model.addAttribute("mediaList", mediaService.planList(mediaPageRequest));
		model.addAttribute("talkList", talkService.planList(talkPageRequest));
		model.addAttribute("concertList", concertService.planList(concertPageRequest));
		
		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination mediaPagination = new Pagination();
		Pagination talkPagination = new Pagination();
		Pagination concertPagination = new Pagination();
		// pagination 설정
		mediaPagination.setPageRequest(mediaPageRequest);
		talkPagination.setPageRequest(talkPageRequest);
		concertPagination.setPageRequest(concertPageRequest);
		
		mediaPagination.setTotalCount(mediaService.planCount());
		talkPagination.setTotalCount(talkService.planCount());
		concertPagination.setTotalCount(concertService.planCount());

		// 뷰에 페이징 정보 전달
		model.addAttribute("mediaPagination", mediaPagination);
		model.addAttribute("talkPagination", talkPagination);
		model.addAttribute("concertPagination", concertPagination);
	}
	
	// 미디어 상세 페이지
	@GetMapping("/detail/showdetailmedia")
	public void showDetailMedia(int showNo, Model model) throws Exception {
		MediaVO mediaVO = mediaService.detail(showNo);
		Calendar showStartDate = Calendar.getInstance();
		Calendar showCloseDate = Calendar.getInstance();

		// DB에 저장된 시작날짜, 종료날짜 Calendar로 받기
		showStartDate.setTime(mediaVO.getShowStartdate());
		showCloseDate.setTime(mediaVO.getShowClosedate());
		// 예매 가능일 시작일
		Calendar start = Calendar.getInstance();
		start.add(Calendar.DATE, 1);
		// 예매 가능일 종료일
		Calendar close = Calendar.getInstance();
		close.add(Calendar.DATE, 8);
		showCloseDate.add(Calendar.DATE, 1);
		// 티켓팅 가능한 날짜를 저장할 리스트
		List<Date> ticketingDate = new ArrayList<Date>();

		/*
		 * 1.공연일로부터 7일 이전부터 1일 이전까지 예매 가능 now + 1 ~ now + 7 
		 * 2.공연기간에서 벗어날 경우 반복문 탈출
		 *  date < startDate || date > closeDate 
		 * 3.수요일은 휴관으로 제외
		 * 
		 */
		// now + 1 <= date <  now + 8
		for (Calendar date = start; date.before(close); date.add(Calendar.DATE, 1)) {
			// date < startDate -> continue;
			if (date.before(showStartDate)) {
				continue;//반복 넘기기
			}
			// date > closeDate -> break;
			if (date.after(showCloseDate)) {
				break;
			}
			// date != Wednesday -> List.add(date);
			// Calendar.WEDNESDAY == 4
			if (date.get(Calendar.DAY_OF_WEEK) != Calendar.WEDNESDAY) {
				ticketingDate.add(date.getTime());
			}
		}
		
		model.addAttribute("ticketingDateList", ticketingDate);
		// 날짜 회차별 남은 티켓 현황, 한번도 예매한 적 없는 날짜 + 회차일 경우 존재하지 않음
		model.addAttribute("mediaRestTicketList", mediaService.mediaRestTicketList(showNo));
		model.addAttribute("showVO", mediaVO);
	}
	
	// 미디어 상세 예정 페이지
	@GetMapping("/detail/showdetailmediaplan")
	public void showDetailMediaPlan(int showNo, Model model) throws Exception{
		MediaVO mediaVO = mediaService.detailPlan(showNo);
		Calendar ticketingStartDate = Calendar.getInstance();
		ticketingStartDate.setTime(mediaVO.getShowStartdate());
		ticketingStartDate.add(Calendar.DATE, -7);
		
		model.addAttribute("ticketingStartDate", ticketingStartDate.getTime());
		model.addAttribute("showVO", mediaVO);
	}

	// 강연 상세 페이지
	@GetMapping("/detail/showdetailtalk")
	public void showDetailTalk(int showNo, Model model) throws Exception {
		TalkVO talkVO = talkService.detail(showNo);
		
		Calendar showStartDate = Calendar.getInstance();
		Calendar showCloseDate = Calendar.getInstance();
		// DB에 저장된 시작날짜, 종료날짜 Calendar로 받기
		showStartDate.setTime(talkVO.getShowStartdate());
		showCloseDate.setTime(talkVO.getShowClosedate());
		// 예매 가능일 시작일
		Calendar start = Calendar.getInstance();
		start.add(Calendar.DATE, 1);
		// 예매 가능일 종료일
		Calendar close = Calendar.getInstance();
		close.add(Calendar.DATE, 8);
		showCloseDate.add(Calendar.DATE, 1);
		// 티켓팅 가능한 날짜를 저장할 리스트
		ArrayList<Date> ticketingDate = new ArrayList<Date>();

		/*
		 * 1.공연일로부터 7일 이전부터 1일 이전까지 예매 가능 now + 1 ~ now + 7 
		 * 2.공연기간에서 벗어날 경우 반복문 탈출 
		 * date < startDate || date > closeDate 
		 * 3.수요일은 휴관으로 제외
		 * 
		 */
		// now + 1 ~ now + 7
		for (Calendar date = start; date.before(close); date.add(Calendar.DATE, 1)) {
			// date < startDate -> continue;
			if (date.before(showStartDate)) {
				continue;
			}
			// date > closeDate -> break;
			if (date.after(showCloseDate)) {
				break;
			}
			// date != Wednesday -> List.add(date);
			// Calendar.WEDNESDAY == 4
			if (date.get(Calendar.DAY_OF_WEEK) != Calendar.WEDNESDAY) {
				ticketingDate.add(date.getTime());
			}
		}
		model.addAttribute("ticketingDateList", ticketingDate);
		// 날짜 회차별 남은 티켓 현황, 한번도 예매한 적 없는 날짜 + 회차일 경우 존재하지 않음
		model.addAttribute("talkRestTicketList", talkService.talkRestTicketList(showNo));
		model.addAttribute("showVO", talkVO);
	}
	
	// 강연 상세 예정 페이지
	@GetMapping("/detail/showdetailtalkplan")
	public void showDetailTalkPlan(int showNo, Model model) throws Exception{
		TalkVO talkVO = talkService.detailPlan(showNo);
		Calendar ticketingStartDate = Calendar.getInstance();
		ticketingStartDate.setTime(talkVO.getShowStartdate());
		ticketingStartDate.add(Calendar.DATE, -7);
		
		model.addAttribute("ticketingStartDate", ticketingStartDate.getTime());
		
		model.addAttribute("showVO", talkVO);
	}
	
	// 콘서트 상세 페이지
	@GetMapping("/detail/showdetailconcert")
	public void showDetailConcert(int showNo, Model model) throws Exception {
		ConcertVO concertVO = concertService.detail(showNo);
		
		Calendar showStartDate = Calendar.getInstance();
		Calendar showCloseDate = Calendar.getInstance();
		// DB에 저장된 시작날짜, 종료날짜 Calendar로 받기
		showStartDate.setTime(concertVO.getShowStartdate());
		showCloseDate.setTime(concertVO.getShowClosedate());
		// 예매 가능일 시작일
		Calendar start = Calendar.getInstance();
		start.add(Calendar.DATE, 1);
		// 예매 가능일 종료일
		Calendar close = Calendar.getInstance();
		close.add(Calendar.DATE, 8);
		showCloseDate.add(Calendar.DATE, 1);
		// 티켓팅 가능한 날짜를 저장할 리스트
		ArrayList<Date> ticketingDate = new ArrayList<Date>();

		/*
		 * 1.공연일로부터 7일 이전부터 1일 이전까지 예매 가능 now + 1 ~ now + 7 
		 * 2.공연기간에서 벗어날 경우 반복문 탈출 
		 * date < startDate || date > closeDate 
		 * 3.수요일은 휴관으로 제외
		 * 
		 */
		// now + 1 ~ now + 7
		for (Calendar date = start; date.before(close); date.add(Calendar.DATE, 1)) {
			// date < startDate -> continue;
			if (date.before(showStartDate)) {
				continue;
			}
			// date > closeDate -> continue;
			if (date.after(showCloseDate)) {
				break;
			}
			// date != Wednesday -> List.add(date);
			// Calendar.WEDNESDAY == 4
			if (date.get(Calendar.DAY_OF_WEEK) != Calendar.WEDNESDAY) {
				ticketingDate.add(date.getTime());
			}
		}
		model.addAttribute("ticketingDateList", ticketingDate);
		// 날짜 회차별 남은 티켓 현황, 한번도 예매한 적 없는 날짜 + 회차일 경우 존재하지 않음
		model.addAttribute("concertRestTicketList", concertService.concertRestTicketList(showNo));
		model.addAttribute("showVO", concertVO);
	}
	
	//좌석 선택 페이지 호출
	@PostMapping("/detail/seatselect")
	public void seatselect(Model model, int showNo, @DateTimeFormat(pattern = "yyyy-MM-dd") Date showDate, int ticketingRound) throws Exception{
		ConcertTicketingVO showVO = new ConcertTicketingVO();
		// 공연번호 입력
		showVO.setShowNo(showNo);
		// 공연날자 Date to String으로 변환
		// VO객체의 showDate 가 java.util.date이기 때문에 직접 입력불가능 String 으로 변환하여 입력
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String showDateString = df.format(showDate);
		// 회차 입력
		showVO.setTicketingRound(ticketingRound);
		
		ArrayList<Integer> restSitList = (ArrayList<Integer>)concertService.restSit(showVO, showDateString);

		restSitList.removeAll(Collections.singleton(null));
		model.addAttribute("restSitList" ,restSitList);
	}
	
	// 콘서트 상세 예정 페이지
	@RequestMapping(value = "/detail/showdetailconcertplan", method = RequestMethod.GET)
	public void showDetailConcertPlan(int showNo, Model model) throws Exception{
		ConcertVO concertVO = concertService.detailPlan(showNo);
		Calendar ticketingStartDate = Calendar.getInstance();
		ticketingStartDate.setTime(concertVO.getShowStartdate());
		ticketingStartDate.add(Calendar.DATE, -7);
		
		model.addAttribute("ticketingStartDate", ticketingStartDate.getTime());
		
		model.addAttribute("showVO", concertVO);
	}
}
