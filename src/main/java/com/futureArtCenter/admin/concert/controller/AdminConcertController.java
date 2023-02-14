package com.futureArtCenter.admin.concert.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.admin.concert.service.AdminConcertService;
import com.futureArtCenter.admin.concert.vo.AdminConcertVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/concert")
public class AdminConcertController {
	@Autowired
	private AdminConcertService adminConcertService;

	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/adminConcertReg", method = RequestMethod.GET)
	public String adminConcertReg(Model model) throws Exception {
		log.info("adminConcertReg...");

		model.addAttribute("AdminConcertVO", new AdminConcertVO());

		return "admin/concert/adminConcertReg";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(AdminConcertVO cvo, RedirectAttributes rttr) throws Exception {
		log.info("register");

		adminConcertService.register(cvo);

		rttr.addAttribute("msg", "SUCCESS");

		return "redirect:/admin/main";

	}

	// 미디어 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String concert(AdminConcertVO cvo, RedirectAttributes rttr) throws Exception {
		MultipartFile posterFile = cvo.getPoster();
		MultipartFile contentFile = cvo.getContent2();

		String createdPosterFilename = uploadFile(posterFile.getOriginalFilename(), posterFile.getBytes());
		String createdContentFilename = uploadFile(contentFile.getOriginalFilename(), contentFile.getBytes());

		cvo.setShow_poster(createdPosterFilename);
		cvo.setShow_content2(createdContentFilename);

		adminConcertService.register(cvo);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/concert/adminConcertReg";
	}

	// 상품 이미지 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String createdFileName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;
	}

	// 미리보기 이미지 표시
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer show_no) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = adminConcertService.getShow_poster(show_no);

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

	@ResponseBody
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public int status(AdminConcertVO cvo, int show_status1) throws Exception {
		cvo.setShow_status(show_status1);
		System.out.println(cvo);
		int change = adminConcertService.status(cvo);

		return change;
	}
	
	@ResponseBody
	@RequestMapping(value = "/statusEnd", method = RequestMethod.GET)
	public int statusEnd(AdminConcertVO cvo, int show_status2) throws Exception {
		cvo.setShow_status(show_status2);
		System.out.println(cvo);
		int change = adminConcertService.status(cvo);

		return change;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String remove(HttpServletRequest request) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			adminConcertService.delete(ajaxMsg[i]);
		}
		return "redirect:/admin/main";
	}
}
