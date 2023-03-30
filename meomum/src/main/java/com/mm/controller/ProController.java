package com.mm.controller;

import java.io.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mm.pro.model.ProDAO;
import com.mm.pro.model.ProDAOImple;
import com.mm.pro.model.ProDTO;

@Controller
public class ProController {
	
	@Autowired
	private ProDAO proDao;

	
	//상품 등록으로 이동
	@RequestMapping("/proForm.do")
	public String addProduct() {
		return "/pro/proForm";
	}
	
	
	//파일 저장 실행
	@RequestMapping("/addPro.do")
	public String fileUpload(
			@RequestParam("pro_thumb") MultipartFile pro_thumb,
	        @RequestParam("pro_img1") MultipartFile pro_img1, 
	        @RequestParam("pro_img2") MultipartFile pro_img2,
	        @RequestParam("pro_cate") int pro_cate,
	        @RequestParam("pro_name") String pro_name,
	        @RequestParam("pro_price") int pro_price,
	        @RequestParam("pro_subprice") int pro_subprice,
	        @RequestParam("pro_amount") int pro_amount,
	        @RequestParam("pro_state") int pro_state,
	        @RequestParam("pro_month") int pro_month,
	        @RequestParam("pro_content") MultipartFile pro_content)
		{
		
		 ProDTO dto = new ProDTO();
		    dto.setPro_thumb(pro_thumb.getOriginalFilename());
		    dto.setPro_img1(pro_img1.getOriginalFilename());
		    dto.setPro_img2(pro_img2.getOriginalFilename());
		    dto.setPro_cate(pro_cate);
		    dto.setPro_name(pro_name);
		    dto.setPro_price(pro_price);
		    dto.setPro_amount(pro_amount);
		    dto.setPro_state(pro_state);
		    dto.setPro_month(pro_month);
		    dto.setPro_content(pro_content.getOriginalFilename());
		    dto.setPro_subprice(pro_subprice);
	
		//사진 물리 저장
		copyInto(pro_thumb);
		copyInto(pro_img1);
		copyInto(pro_img2);
		copyInto(pro_content);
		
		//정보 저장
		int count=proDao.proInsert(dto);
				
				
		if(count>0) {
		return "pro/proOk";
		}else {
		return "pro/proForm";
		}
	}
	
	
	
	//파일 복사?
	public void copyInto(MultipartFile upload) {
		
		System.out.println("파일명: "+upload.getOriginalFilename());
		try {
			byte bytes[]=upload.getBytes();
			
			String path="c:/student_java/cool/meomum/src/main/webapp/items/";
			File outfile=new File(path+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
			
			} catch(IOException e) {
				e.printStackTrace();
			}	
	}
	
	
	public List<ProDTO> proPage(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ProDTO> lists=proDao.proList(map);
		return lists;
	}
	
	
	@RequestMapping("/proList.do")
	public ModelAndView bbsList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=proDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proList.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proPage(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pro/proList");
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		return mav;
	}
	
	
}