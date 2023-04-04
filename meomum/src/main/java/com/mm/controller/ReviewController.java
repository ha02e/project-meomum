package com.mm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.mm.member.model.MemberDTO;
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
	
	@RequestMapping("/myReviewList.do")
	public ModelAndView myreviewList(@RequestParam(value="cp",defaultValue = "1")int cp,
									HttpSession session) {
		MemberDTO mdto=(MemberDTO)session.getAttribute("ssInfo");
		
		int totalCnt=reviewService.getTotalCnt();
		int listSize=3;
		int pageSize=5;
		int user_idx=mdto.getUser_idx();
		
		String pageStr=com.mm.module.PageModule
				.makePage("myReviewList.do", totalCnt, listSize, pageSize, cp);
		
		List<ReviewDTO> lists=reviewService.myreviewList(cp, listSize,user_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("review/myReviewList");
		mav.addObject("lists", lists);
		mav.addObject("pageStr",pageStr);
		
		return mav;
	}
	
	@RequestMapping("/reviewable.do")
	public String reviewable() {
		return "review/reviewable";
	}
	
	

	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.GET)
	public String reviewForm() {
		return "review/reviewWrite";
	}
		
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWrite(MultipartHttpServletRequest req, HttpSession session) {
		ReviewDTO dto=new ReviewDTO();
		MemberDTO mdto=(MemberDTO)session.getAttribute("ssInfo");
		
		dto.setUser_idx(mdto.getUser_idx());
		dto.setWriter(req.getParameter("writer"));
		int category=Integer.parseInt(req.getParameter("category"));
		dto.setCategory(category);
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		int star=Integer.parseInt(req.getParameter("star"));
		dto.setStar(star);
		
		MultipartFile mf=req.getFile("thumb");
		String path=req.getRealPath("/images/reviewImg");
		String fileName=mf.getOriginalFilename();
		File uploadFile=new File(path+"/"+fileName);
		
		try {
			mf.transferTo(uploadFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		dto.setThumb(fileName);
		
		int result=reviewService.reviewInsert(dto);
		String msg=result>0?"리뷰 등록 완료되었습니다.":"리뷰 등록에 실패하였습니다.";
		String link = result>0?"myReview.do":"reviewWrite.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("/msg");
		
		return mav;
	}
	
	
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
							uploadFile.mkdirs(); //mkdirs():파일 저장 시 디렉토리 생성하는 함수
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
	
	
	@RequestMapping("/reviewDel.do")
	public ModelAndView reviewDelete(@RequestParam("review_idx")int review_idx) {
		int result=reviewService.reviewDelete(review_idx);
		
		String msg=result>0?"리뷰 삭제가 완료되었습니다.":"리뷰 삭제에 실패하였습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", "review/myReviewList");
		mav.setViewName("/msg");
		
		return mav;
	}
	
}
