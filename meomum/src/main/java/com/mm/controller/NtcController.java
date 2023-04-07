package com.mm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	
	@RequestMapping(value="/ntc/ckUpload.do")
	@ResponseBody
	public String ckfileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws IOException {

	    //json 객체 생성
	    JsonObject json = new JsonObject();

	    //파일을 가져오기
	    MultipartFile file = multiFile.getFile("upload");

	    //파일이 비어있지 않고
	    if(file != null) {
	        //파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐 때
	        if(file.getSize() > 0 && file.getOriginalFilename() != null) {
	            if(file.getContentType().toLowerCase().startsWith("image/")) {
	                try {
	                    //파일 이름 랜덤으로 생성
	                    String fileName = UUID.randomUUID().toString();
	                    //파일이 실제로 저장되는 경로
	                    String uploadPath = req.getSession().getServletContext().getRealPath(File.separator + "resources" + File.separator + "ckimage");
	                    //저장되는 파일에 경로 설정
	                    File uploadFile = new File(uploadPath);
	                    if(!uploadFile.exists()) {
	                        uploadFile.mkdirs();
	                    }
	                    //업로드경로 + 파일이름 -> 데이터를 서버에 전송
	                    uploadPath = uploadPath + File.separator + fileName;
	                    byte[] bytes = file.getBytes();
	                    try(OutputStream out = new FileOutputStream(new File(uploadPath));
	                        PrintWriter printWriter = resp.getWriter()) {
	                        out.write(bytes);

	                        //파일 연결되는 url 설정
	                        String fileUrl = req.getContextPath() + "/resources/ckimage/" + fileName;

	                        //생성한 json 객체를 이용해 ckeditor에 전송
	                        json.addProperty("uploaded", 1);
	                        json.addProperty("fileName", fileName);
	                        json.addProperty("url", fileUrl);
	                        resp.setContentType("text/html");
	                        printWriter.println(json);
	                    }

	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	    return null;
	}


	@RequestMapping(value = "/ntcWrite.do", method = RequestMethod.POST)
	public ModelAndView ntcWrite(NtcDTO dto) {

//		NtcDTO dto = new NtcDTO();
//
//		dto.setNtc_title(req.getParameter("ntc_title"));
//		dto.setNtc_content(req.getParameter("ntc_content"));
//		dto.setNtc_ctg(req.getParameter("ntc_ctg"));
//
//		// 파일 업로드
//		MultipartFile mf = req.getFile("ntc_img");// 업로드 파라미터
//		String path = req.getRealPath("/ntcImages");// 저장될 위치
//		String fileName = mf.getOriginalFilename(); // 업로드 파일 이름
//		File uploadFile = new File(path + "/" + fileName);// 복사될 위치
//
//		try {
//			mf.transferTo(uploadFile); // 업로드
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		dto.setNtc_img(fileName);

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
		 // 이미지 파일 삭제
	    String imageName = ntcDao.getNtcImageName(idx); // 이미지 파일명 가져오기
	    String imagePath = "/meomum/ntcImages/" + imageName; // 가져온 이미지 파일 경로와 파일명
	    File imageFile = new File(imagePath);
	    if (imageFile.exists()) {
	        imageFile.delete();
	    }
		
	 // 게시글 삭제
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
