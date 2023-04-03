package com.mm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mm.ask.model.AskDAO;
import com.mm.ask.model.AskDTO;

@Controller
public class AskController {
	
	@Autowired
	private AskDAO adao;
	
	/**간단문의 리스트*/
	@RequestMapping("/askList.do")
	public ModelAndView askList(@RequestParam(value="cp",defaultValue = "1")int cp) {

		
		//페이징
		int rtotalCnt = adao.askCnt();
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("askList.do", totalCnt, listSize, pageSize, cp);

		List<AskDTO> lists = adao.askList(cp, listSize);
		
		for (AskDTO dto : lists) {
		    String askDate;
		    if (dto.getAsk_wdateYMD().equals(LocalDate.now().toString())) {
		        askDate = dto.getAsk_wdateTime();
		    } else {
		        askDate = dto.getAsk_wdateYMD();
		    }
		    dto.setAsk_date(askDate);
		}
		
		  // 작성자 이름 가운데 * 처리
		for (AskDTO dto : lists) {
		    String name = dto.getAsk_writer();
		    if (name != null && name.length() > 0) {
		        int len = name.length();
		        String maskedName = "";
		        if (len == 1) {
		            maskedName = "*";
		        } else if (len % 2 == 0) {
		            int mid = len / 2;
		            maskedName = name.substring(0, mid - 1) + "*" + name.substring(mid, len - 1);
		        } else {
		            int mid = len / 2;
		            maskedName = name.substring(0, mid) + "*" + name.substring(mid + 1, len);
		        }
		        dto.setAsk_writer(maskedName);
		    }
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ask/askList");
		
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	/**간단문의 글작성 페이지 이동*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.GET)
	public String askWriteForm() {

		return "ask/askWriteForm";
	}
	
	/**간단문의 글작성 submit*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.POST)
	public ModelAndView askWriteSubmit(AskDTO dto,@RequestParam("file")MultipartFile file,HttpServletRequest request) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(calendar.getTime());
		

		
		String originalFileName = today+"_"+file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String fileNameWithoutExtension = originalFileName.substring(0, originalFileName.lastIndexOf("."));

		// 중복 방지를 위해 파일 이름에 숫자를 붙임
		int num = 0;
		String fileName = originalFileName;
		
		while (adao.existsFile(fileName)) {
		    num++;
		    fileName = fileNameWithoutExtension + "_" + num + extension;
		}
		System.out.println(fileName);
		dto.setAsk_file(fileName);
		int result = adao.askInsert(dto);
		
		copyInto(file, request,fileName);		
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			mav.addObject("msg","간단문의 작성이 등록되었습니다.빠른시일내로 답변드리겠습니다.");
			mav.addObject("link","askList.do");
			mav.setViewName("msg");
		}else {
			mav.addObject("msg","간단문의 작성에 실패하였습니다.");
			mav.addObject("gopage","history.back();");
			mav.setViewName("mainMsg");
		}
		return mav;
		
	}
	
	/**간단문의 본문 보기*/
	@RequestMapping("/askContent.do")
	public ModelAndView askContent(@RequestParam("ask_idx")int ask_idx) {
		AskDTO dto = adao.askContent(ask_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ask",dto);
		mav.setViewName("ask/askContent");
		return mav;
	}
	
	/**간단문의 파일 저장하기*/
	public void copyInto(MultipartFile file, HttpServletRequest req,String fileName) {
	    try {
	        byte[] bytes = file.getBytes();

	        String rootPath = req.getSession().getServletContext().getRealPath("/");
	        String filePath = rootPath + "/images/askFile/" + fileName;
	        File outFile = new File(filePath);

	        FileOutputStream fos = new FileOutputStream(outFile);
	        fos.write(bytes);
	        fos.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}
	@RequestMapping("/filedown.do")
	public ModelAndView filedown(@RequestParam("filename")String filename,HttpServletRequest req) {
		
		
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String filePath = rootPath + "/images/askFile/" + filename;
		File f = new File(filePath);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("downloadFile",f);
		mav.setViewName("mmDown");
		return mav;
		
	}
	
}
