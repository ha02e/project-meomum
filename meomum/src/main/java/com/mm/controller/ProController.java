package com.mm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDTO;
import com.mm.pro.model.ProDAO;
import com.mm.pro.model.ProDAOImple;
import com.mm.pro.model.ProDTO;

@Controller
public class ProController {
	
	@Autowired
	private ProDAO proDao;

	
	//관리자 상품 등록으로 이동
	@RequestMapping("/proForm.do")
	public String addProduct() {
		return "/pro/proForm";
	}
	
		
	//사용자 상품 상세 페이지 (인덱스 필요)
	@RequestMapping("/proContent.do")
	public ModelAndView itemDetail(
			@RequestParam("pro_idx") int pro_idx,
			HttpSession session)
	 {
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		int user_idx = sdto != null ? sdto.getUser_idx() : 0;
		
		ModelAndView mav=new ModelAndView();
		List<ProDTO> lists=proDao.proUpdateList(pro_idx);
		mav.addObject("lists", lists);
		mav.addObject("user_idx",user_idx);
		mav.setViewName("pro/proContent");
		
		return mav;
	}
	
	
	/*확인용
	@RequestMapping("/purchase.do")
	public ModelAndView test(@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="cart_amount",defaultValue="1")int cart_amount,
			@RequestParam("pro_idx") int pro_idx,
			HttpSession session) {
		
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		int user_idx = sdto != null ? sdto.getUser_idx() : 0;
		
		List<ProDTO> lists=proDao.proUpdateList(pro_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pro_buyNum", cart_amount);
		mav.addObject("user_idx", user_idx);
		
		mav.setViewName("pro/purchase");
		
		return mav;
	}
	*/
	
	//사용자 상품 리스트
	@RequestMapping("/proList.do")
	public ModelAndView itemList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=proDao.getTotalCnt();
		int listSize=9;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proList.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proPage(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pro/proList");
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		return mav;
	}
	
	
	
	//파일 저장 실행
	@RequestMapping("/addPro.do")
	public ModelAndView fileUpload(
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
	        @RequestParam("pro_content") MultipartFile pro_content,
	        @RequestParam("pro_allprice") int pro_allprice)
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
		    dto.setPro_allprice(pro_allprice);
	
		//사진 물리 저장
		copyInto(pro_thumb);
		copyInto(pro_img1);
		copyInto(pro_img2);
		copyInto(pro_content);
		
		//정보 저장
		int result=proDao.proInsert(dto);
				
		String msg=result>=0?"등록 성공":"등록 실패";
		String link=result>0?"proAdmin.do":"proForm.do";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("pro/proMsg");
		return mav;		
		
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
	
	
	
	//페이징 모듈
	public List<ProDTO> proPage(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ProDTO> lists=proDao.proList(map);
		return lists;
	}
	
	
	
	//관리자 상품 관리 페이지
	@RequestMapping("/proAdmin.do")
	public ModelAndView proAdminList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=proDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proAdmin.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proPage(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pro/proAdmin");
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		return mav;
	}
	
	
	//상품 삭제
	@RequestMapping("/proDel.do")
	public ModelAndView proDel(@RequestParam("pro_idx") int pro_idx) {
		int result = proDao.proDelete(pro_idx);
		String msg=result>=0?"삭제 성공":"삭제 실패";
		String link ="proAdmin.do";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("msg", link);
		mav.setViewName("pro/proMsg");
		return mav;
		}
	
	
	
	//상품 검색
	@RequestMapping("/proFind.do")
	public ModelAndView proFind(
			@RequestParam(value="proF",required=false)String proF) {
		ModelAndView mav=new ModelAndView();
		int usernum=0;
		
		if(proF.equals("침대")) {
			usernum=1;
			List<ProDTO> lists=proDao.proFind1(usernum);
			mav.addObject("lists", lists);
		} else if(proF.equals("테이블")) {
			usernum=2;
			List<ProDTO> lists=proDao.proFind1(usernum);
			mav.addObject("lists", lists);
		} else if(proF.equals("의자")) {
			usernum=3;
			List<ProDTO> lists=proDao.proFind1(usernum);
			mav.addObject("lists", lists);
		} else if(proF.equals("소파")) {
			usernum=4;
			List<ProDTO> lists=proDao.proFind1(usernum);
			mav.addObject("lists", lists);
		} else if(proF.equals("조명")) {
			usernum=5;
			List<ProDTO> lists=proDao.proFind1(usernum);
			mav.addObject("lists", lists);
		} else {
		List<ProDTO> lists=proDao.proFind2(proF);
		mav.addObject("lists", lists);
		}
		mav.setViewName("pro/proList");
		return mav;
	}
	
	
	//상품 수정 페이지 이동+현재 등록한 정보 출력
	@RequestMapping("/proUpdateForm.do")
	public ModelAndView proUpdateForm(
			@RequestParam("pro_idx") int pro_idx) {
		ModelAndView mav=new ModelAndView();
		List<ProDTO> lists=proDao.proUpdateList(pro_idx);
		mav.addObject("lists", lists);
		mav.setViewName("pro/proUpdateForm");
		return mav;
	}
	
	
	//상품 수정 기능
	@RequestMapping("/proUpdate.do")
	public ModelAndView proUpdate(ProDTO dto) {
		ModelAndView mav=new ModelAndView();
		int result = proDao.proUpdate(dto);
		String msg=result>=0?"수정 성공":"수정 실패";
		mav.addObject("msg", msg);
		mav.setViewName("pro/proMsg");
		return mav;
	}
	
}