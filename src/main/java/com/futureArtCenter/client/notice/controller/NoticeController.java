package com.futureArtCenter.client.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.futureArtCenter.client.common.vo.PageRequest;
import com.futureArtCenter.client.common.vo.Pagination;
import com.futureArtCenter.client.notice.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;

	@Value("${upload.path}")
	private String uploadPath;

	@ResponseBody
	@GetMapping(value = { "/notice_poster" })
	public ResponseEntity<byte[]> displayFile(Integer notice_no, String noticePoster) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = noticePoster;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();

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

	// 공지사항 목록 페이지
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		log.info("list");

		model.addAttribute("list", service.list());
	}

	// 공지사항 상세 페이지
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public void detail(int notice_no, Model model) throws Exception {
		log.info("detail");

		model.addAttribute("NoticeVO", service.read(notice_no));
	}

	/*
	 * 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
	 * 
	 * @RequestMapping(value = "/noticeList", method = RequestMethod.GET) public
	 * void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model)
	 * throws Exception{ // 뷰에 페이징 처리를 한 게시글 목록을 전달한다. model.addAttribute("list",
	 * service.list(pageRequest));
	 * 
	 * // 페이징 네비게이션 정보를 뷰에 전달한다. Pagination pagination = new Pagination();
	 * pagination.setPageRequest(pageRequest);
	 * pagination.setTotalCount(service.count()); model.addAttribute("pagination",
	 * pagination); }
	 */

}
