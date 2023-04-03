package com.mm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.mm.review.model.ReviewDTO;
import com.mm.review.service.ReviewService;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
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
	/**
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
	*/
	
	/** ck에디터 json이용 */
	@RequestMapping(value="/review/ckUpload.do")
	@ResponseBody
	public String ckfileUpload(HttpServletRequest req, HttpServletResponse resp,
								MultipartHttpServletRequest multiFile) throws IOException {
		
		//json 객체 생성
		JsonObject json=new JsonObject();
		
		//json 객체 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter=null;
		OutputStream out=null;
		
		//파일을 가져오기
		MultipartFile file=multiFile.getFile("upload");
		
		//파일이 비어있지 않고
		if(file != null) {
			//파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐 때
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					
					try {
						
						String fileName=file.getName(); //파일 이름 설정
						byte[] bytes; //바이트 타입 설정
						bytes=file.getBytes(); //파일을 바이트 타입으로 변경
						
						//파일이 실제로 저장되는 경로
						String uploadPath=req.getSession().getServletContext().getRealPath("/resources/ckimage/");
						
						//저장되는 파일에 경로 설정
						File uploadFile=new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs(); //mkdirs() : 파일 저장 시 디렉토리 생성하는 함수
						}
						
						//파일 이름 랜덤으로 생성
						fileName=UUID.randomUUID().toString(); //UUID:클래스 고유식별자
						
						//업로드경로 + 파일이름 -> 데이터를 서버에 전송
						uploadPath=uploadPath+"/"+fileName;
						out=new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						//이벤트 추가
						printWriter=resp.getWriter();
						resp.setContentType("text/html");
						
						//파일 연결되는 url 설정
						String fileUrl=req.getContextPath()+"/resources/ckimage/"+fileName;
						
						//생성한 json 객체를 이용해 ckeditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
						
					}catch (IOException e) {
						e.printStackTrace();
					}finally {
						if(out != null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
					
				}
			}
		}
		return null;
	}

	
	
	@RequestMapping("/reviewList.do")
	public ModelAndView reviewList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=reviewService.getTotalCnt();
		int listSize=6;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule
				.makePage("reviewList.do", totalCnt, listSize, pageSize, cp);
		
		List<ReviewDTO> lists=reviewService.reviewList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("review/reviewList");
		mav.addObject("lists", lists);
		mav.addObject("pageStr",pageStr);
		
		return mav;
	}
	
	
	@RequestMapping("/reviewContent.do")
	public ModelAndView reviewContent(@RequestParam("review_idx")int review_idx) {
		
		ReviewDTO dto=reviewService.reviewContent(review_idx);
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("review/reviewContent");
		return mav;
	}
	
}
