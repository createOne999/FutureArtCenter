package com.futureArtCenter.admin.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.futureArtCenter.admin.notice.VO.AdminNoticeVO;
import com.futureArtCenter.admin.notice.service.AdminNoticeService;
import com.futureArtCenter.client.common.vo.PageRequest;
import com.futureArtCenter.client.common.vo.Pagination;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	// 공지사항 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(Model model) throws Exception {
		
		log.info("register");
		
		
		return "/admin/notice/adminNoticeReg";
	}

	
	// 공지사항 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(AdminNoticeVO adminNoticeVO, RedirectAttributes rttr) throws Exception {
		
		MultipartFile posterFile = adminNoticeVO.getPoster();
		
		String createdPosterFilename = uploadFile(posterFile.getOriginalFilename(), posterFile.getBytes());
		
		adminNoticeVO.setNotice_poster(createdPosterFilename);
		
		adminNoticeService.register(adminNoticeVO);
		log.info("register");
	
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/notice/list";
		
	}
	
	// 상품 이미지 업로드
		private String uploadFile(String originalName, byte[] fileData) throws Exception {
			UUID uid = UUID.randomUUID();

			String createdFileName = uid.toString() + "_" + originalName;

			File target = new File(uploadPath, createdFileName);

			FileCopyUtils.copy(fileData, target);

			return createdFileName;
		}
		
		// 디테일 이미지 보이기
		@ResponseBody
		@GetMapping(value={"/adminNotice_poster"})
		public ResponseEntity<byte[]> displayFile(Integer notice_no, String adminNoticePoster) throws Exception {
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;

			String fileName = adminNoticePoster;

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
		
		
		// 미리보기 이미지 표시
		@ResponseBody
		@RequestMapping("/display")
		public ResponseEntity<byte[]> displayFile(Integer notice_no) throws Exception {
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;

			String fileName = adminNoticeService.getNotice_poster(notice_no);

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
	
	/* 공지사항 목록 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		log.info("list");
		model.addAttribute("list", adminNoticeService.list());
		
		return "/admin/notice/adminNoticeList";
	}*/
	
	// 공지사항 상세 페이지
	@RequestMapping(value = "/adminNoticeRead", method = RequestMethod.GET)
	public String read(int notice_no, Model model) throws Exception {
		log.info("read");
		model.addAttribute("AdminNoticeVO", adminNoticeService.read(notice_no));
		
		return "/admin/notice/adminNoticeRead";
	}
	
	// 공지사항 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyForm(int notice_no, Model model) throws Exception {
		log.info("modify");
		model.addAttribute("AdminNoticeVO", adminNoticeService.read(notice_no));
		
		return "/admin/notice/adminNoticeMod";
	}
	
	// 공지사항 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(AdminNoticeVO adminNoticeVO, RedirectAttributes rttr) throws Exception {
		MultipartFile posterFile = adminNoticeVO.getPoster();
		
		String createdPosterFilename = uploadFile(posterFile.getOriginalFilename(), posterFile.getBytes());
		
		adminNoticeVO.setNotice_poster(createdPosterFilename);
		
		adminNoticeService.modify(adminNoticeVO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("modify");
		
		return "redirect:/admin/notice/list";
	}
	
	// 공지사항 삭제 처리
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int notice_no, RedirectAttributes rttr) throws Exception {
		adminNoticeService.delete(notice_no);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("delete");
		
		return "redirect:/admin/notice/list";
	}
	
	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		  public String list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception{ 
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
			model.addAttribute("list", adminNoticeService.page(pageRequest));
		  
		  // 페이징 네비게이션 정보를 뷰에 전달한다. 
			Pagination pagination = new Pagination();
		  pagination.setPageRequest(pageRequest);
		  pagination.setTotalCount(adminNoticeService.count());
		  model.addAttribute("pagination", pagination);
		
		  return "/admin/notice/adminNoticeList";
		  
		}
		
	
}
