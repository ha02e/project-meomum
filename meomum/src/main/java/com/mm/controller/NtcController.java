package com.mm.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mm.ntc.model.NtcDAO;
import com.mm.ntc.model.NtcDTO;

@Controller
public class NtcController {

	@Autowired
	private NtcDAO ntcDao;
	
	@RequestMapping(value = "/ntcWrite.do", method = RequestMethod.GET )
	public String ntcForm() {
		return "ntc/ntcForm";
	}
	
	@RequestMapping(value = "/ntcWrite.do", method =RequestMethod.POST )
	public ModelAndView ntcWrite(MultipartHttpServletRequest req) {
		
		NtcDTO dto=new NtcDTO();
		
		dto.setNtc_title(req.getParameter("ntc_title"));
		dto.setNtc_content(req.getParameter("ntc_content"));
		dto.setNtc_ctg(req.getParameter("ntc_ctg"));
		
		//파일 업로드
		MultipartFile mf=req.getFile("ntc_img");//업로드 파라미터
		String path=req.getRealPath("/ntcImages");//저장될 위치
		String fileName=mf.getOriginalFilename(); //업로드 파일 이름
		File uploadFile= new File(path+"/"+fileName);//복사될 위치
		
		try {
			mf.transferTo(uploadFile); //업로드
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setNtc_img(fileName);
		
		int result=ntcDao.ntcInsert(dto);
		String msg=result>0?"게시글 작성 성공!":"게시글 작성 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}
	
	@RequestMapping("/ntcList.do")
	public ModelAndView ntcList() {
		List<NtcDTO> list=ntcDao.ntcList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists", list);
		mav.setViewName("ntc/ntcList");
		return mav;
	}
	
	@RequestMapping("/ntcContent.do")
	public ModelAndView ntcContent(@RequestParam("ntc_idx") int idx) {
		NtcDTO dto=ntcDao.ntcContent(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", dto);
		mav.setViewName("ntc/ntcContent");
		return mav;
	}
	
}
