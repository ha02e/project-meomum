package com.mm.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mm.ntc.model.NtcDAO;
import com.mm.ntc.model.NtcDTO;
import com.mm.pro.model.ProDTO;

@Controller
public class NtcController {

	@Autowired
	private NtcDAO ntcDao;

	public List<NtcDTO> ntcPage(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NtcDTO> lists = ntcDao.ntcList(map);
		return lists;
	}

	@RequestMapping("/ntcList_a.do") // 관리자 공지사항
	public ModelAndView ntcList_a(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = ntcDao.getTotalCnt();
		int listSize = 6;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("ntcList_a.do", totalCnt, listSize, pageSize, cp);

		List<NtcDTO> lists = ntcPage(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("ntc/ntcList_a");
		mav.addObject("pageStr", pageStr);
		return mav;
	}

	@RequestMapping(value = "/ntcWrite.do", method = RequestMethod.GET)
	public String ntcForm() {
		return "ntc/ntcForm_a";
	}

	@RequestMapping(value = "/ntcWrite.do", method = RequestMethod.POST)
	public ModelAndView ntcWrite(MultipartHttpServletRequest req) {

		NtcDTO dto = new NtcDTO();

		dto.setNtc_title(req.getParameter("ntc_title"));
		dto.setNtc_content(req.getParameter("ntc_content"));
		dto.setNtc_ctg(req.getParameter("ntc_ctg"));

		// 파일 업로드
		MultipartFile mf = req.getFile("ntc_img");// 업로드 파라미터
		String path = req.getRealPath("/ntcImages");// 저장될 위치
		String fileName = mf.getOriginalFilename(); // 업로드 파일 이름
		File uploadFile = new File(path + "/" + fileName);// 복사될 위치

		try {
			mf.transferTo(uploadFile); // 업로드

		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setNtc_img(fileName);

		int result = ntcDao.ntcInsert(dto);
		String msg = result > 0 ? "게시글 작성 성공!" : "게시글 작성 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/ntcList_a.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}

	@RequestMapping("/ntcList.do")
	public ModelAndView ntcList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = ntcDao.getTotalCnt();
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("ntcList.do", totalCnt, listSize, pageSize, cp);

		List<NtcDTO> lists = ntcPage(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("ntc/ntcList");
		mav.addObject("pageStr", pageStr);
		return mav;
	}

	@RequestMapping("/ntcContent.do")
	public ModelAndView ntcContent(@RequestParam("ntc_idx") int idx) {
		NtcDTO dto = ntcDao.ntcContent(idx);
		ntcDao.ntcViewCnt(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dto);
		mav.setViewName("ntc/ntcContent");
		return mav;
	}

	@RequestMapping("/ntcContent_a.do") // 관리자 공지사항 본문
	public ModelAndView ntcContent_a(@RequestParam("ntc_idx") int idx) {
		NtcDTO dto = ntcDao.ntcContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dto);
		mav.setViewName("ntc/ntcContent_a");
		return mav;
	}

	@RequestMapping("/ntcContentDel.do")
	public ModelAndView ntcDelete(@RequestParam("ntc_idx") int idx) {
		int result = ntcDao.ntcDelete(idx);
		ModelAndView mav = new ModelAndView();
		String msg = result > 0 ? "글삭제 성공!" : "글삭제 실패!";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/ntcList_a.do");
		mav.setViewName("ntc/ntcMsg");

		return mav;
	}

	@RequestMapping("/ntcUpdateForm.do")
	public ModelAndView ntcUpdateForm(@RequestParam("ntc_idx") int idx) {

		NtcDTO dto = ntcDao.ntcFind(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("ntc/ntcUpdateForm");
		return mav;
	}

	@RequestMapping(value = "/ntcUpdate.do", method = RequestMethod.POST)
	public ModelAndView ntcUpdate(NtcDTO dto, MultipartHttpServletRequest req) {
		dto.setNtc_title(req.getParameter("ntc_title"));
		dto.setNtc_content(req.getParameter("ntc_content"));
		dto.setNtc_ctg(req.getParameter("ntc_ctg"));

		// 파일 업로드
		MultipartFile mf = req.getFile("ntc_img");// 업로드 파라미터

		if (mf != null && !mf.isEmpty()) { // 파일이 있는 경우에만 업로드
			String path = req.getRealPath("/ntcImages");// 저장될 위치
			String fileName = mf.getOriginalFilename(); // 업로드 파일 이름
			File uploadFile = new File(path + "/" + fileName);// 복사될 위치

			try {
				mf.transferTo(uploadFile); // 업로드
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 새로운 이미지로 업데이트
			String oldFileName = dto.getNtc_img(); // 기존 이미지 파일 이름
			if (oldFileName != null) { // 기존 이미지 파일이 존재하는 경우 삭제
				File oldFile = new File(path + "/" + oldFileName);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}

			dto.setNtc_img(fileName);
		} else { // 파일이 없는 경우 기존 이미지 파일 사용
			dto.setNtc_img(req.getParameter("old_ntc_img"));
		}

		int result = ntcDao.ntcUpdate(dto);
		ModelAndView mav = new ModelAndView();
		String msg = result > 0 ? "글수정 성공!" : "글수정 실패!";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/ntcList_a.do");
		mav.setViewName("ntc/ntcMsg");

		return mav;
	}

	@RequestMapping("/ntcSerch.do")
	public ModelAndView ntcSerch(@RequestParam("keyword") String keyword) {
		List<NtcDTO> list = ntcDao.ntcSearch(keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", list);
		mav.setViewName("ntc/ntcList");
		return mav;
	}

}
