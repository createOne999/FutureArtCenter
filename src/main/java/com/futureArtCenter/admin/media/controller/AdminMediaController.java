package com.futureArtCenter.admin.media.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.admin.concert.vo.AdminConcertVO;
import com.futureArtCenter.admin.media.service.AdminMediaService;
import com.futureArtCenter.admin.media.vo.AdminMediaVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/media")
public class AdminMediaController {
	@Autowired
	private AdminMediaService adminMediaService;

	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/adminMediaReg", method = RequestMethod.GET)
	public String adminMediaReg(Model model) throws Exception {
		log.info("adminMediaReg...");

		model.addAttribute("AdminMediaVO", new AdminMediaVO());

		return "admin/media/adminMediaReg";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(AdminMediaVO mvo, RedirectAttributes rttr) throws Exception {
		log.info("register");

		adminMediaService.register(mvo);

		rttr.addAttribute("msg", "SUCCESS");

		return "redirect:/admin/main";

	}

	// 미디어 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String media(AdminMediaVO mvo, RedirectAttributes rttr) throws Exception {
		MultipartFile posterFile = mvo.getPoster();
		MultipartFile contentFile = mvo.getContent2();

		String createdPosterFilename = uploadFile(posterFile.getOriginalFilename(), posterFile.getBytes());
		String createdContentFilename = uploadFile(contentFile.getOriginalFilename(), contentFile.getBytes());

		mvo.setShow_poster(createdPosterFilename);
		mvo.setShow_content2(createdContentFilename);

		adminMediaService.register(mvo);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/media/adminMediaReg";
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

		String fileName = adminMediaService.getShow_poster(show_no);

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
	public int status(AdminMediaVO mvo, int show_status1) throws Exception {
		mvo.setShow_status(show_status1);
		System.out.println(mvo);
		int change = adminMediaService.status(mvo);

		return change;
	}

	@ResponseBody
	@RequestMapping(value = "/statusEnd", method = RequestMethod.GET)
	public int statusEnd(AdminMediaVO mvo, int show_status2) throws Exception {
		mvo.setShow_status(show_status2);
		System.out.println(mvo);
		int change = adminMediaService.status(mvo);

		return change;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String remove(HttpServletRequest request) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			adminMediaService.delete(ajaxMsg[i]);
		}
		return "redirect:/admin/main";
	}
}
