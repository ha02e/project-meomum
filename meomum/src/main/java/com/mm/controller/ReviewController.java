package com.mm.controller;

import java.io.*;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mm.review.model.ReviewDTO;
import com.mm.review.service.ReviewService;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping("/myReview.do")
	public String myReview() {
		return "review/myReview";
	}
	@RequestMapping("/reviewable.do")
	public String reviewable() {
		return "review/reviewable";
	}
	
	
	//리뷰작성 테스트
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.GET)
	public String reviewForm() {
		return "review/reviewWrite";
	}
	
	
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSubmit(ReviewDTO dto) {
		int result=reviewService.reviewInsert(dto);
		String msg=result>0?"리뷰 등록 완료되었습니다.":"리뷰 등록에 실패하였습니다.";
		String link = result>0?"myReview.do":"reviewWrite.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("/msg");
		
		return mav;
	}
	
	/** ckeditor 파일업로드 */
	@RequestMapping(value="/review/ckUpload", method=RequestMethod.POST)
	public void ckeditorUpload(HttpServletRequest req,
	          				HttpServletResponse res,
	          				@RequestParam MultipartFile upload)throws Exception {
		
		logger.info("post CKEditor img upload");
	          					 
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
	          					 
		OutputStream out = null;
		PrintWriter printWriter = null;
	          					   
		// 인코딩
	    res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html;charset=utf-8");
	          					 
	    try {
	          					  
	    	String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	    	byte[] bytes = upload.getBytes();
	          					  
	        // 업로드 경로
	        String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	          					  
	        out = new FileOutputStream(new File(ckUploadPath));
	        out.write(bytes);
	        out.flush();  // out에 저장된 데이터를 전송하고 초기화
	          					  
	        String callback = req.getParameter("CKEditorFuncNum");
	        printWriter = res.getWriter();
	        String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	          					  
	        // 업로드시 메시지 출력
	      	printWriter.println("<script type='text/javascript'>"
	      			+ "window.parent.CKEDITOR.tools.callFunction("
	      			+ callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	      			+"</script>");
	          					  
	    	printWriter.flush();
	          					  
	        } catch (IOException e) { e.printStackTrace();
	        } finally {
	        try {
	        	if(out != null) { out.close(); }
	          	if(printWriter != null) { printWriter.close(); }
	          	} catch(IOException e) { e.printStackTrace(); }
	        }
	          					 
	       	return;
	       	
	}

	
	@RequestMapping("/reviewList.do")
	public String reviewList() {
		return "review/reviewList";
	}
	
}
