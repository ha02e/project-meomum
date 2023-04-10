package com.mm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		mav.setViewName("pro/proAdmin");
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
	@RequestMapping(value="proUpdate.do", method=RequestMethod.POST)
	public ModelAndView proUpdate(ProDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int result = proDao.proUpdate(dto); 
		
		ProDTO pdto=new ProDTO();
		System.out.println("name:"+pdto.getPro_name());
		System.out.println("price:"+pdto.getPro_price());
		System.out.println("state"+pdto.getPro_state());
		System.out.println("month"+pdto.getPro_month());
		System.out.println("subprice:"+pdto.getPro_subprice());
		System.out.println("allprice:"+pdto.getPro_allprice());
		
		String msg=result>=0?"수정 완료했습니다.":"수정 실패했습니다.";
		String link ="proAdmin.do";
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("pro/proMsg");
		return mav;
	}
	
	
	//상품 재고 관리 리스트
	@RequestMapping("/proAmount_a.do")
	public ModelAndView proAmountList(@RequestParam(value="cp",defaultValue="1")int cp) {

		int totalCnt=proDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proAmount_a.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proPage(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pro/proAmount_a");
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		return mav;
	}
	
	
	//상품 재고 관리 - 재고수정
	@RequestMapping("/proAmountUpdate.do")
	public ModelAndView proAmountUpdate(@RequestParam("pro_idx")int pro_idx,
										@RequestParam(value="pro_amount", required = false)String pro_amount_str,
										ProDTO dto, HttpServletRequest req) {
		
		if(pro_amount_str==null || pro_amount_str.trim().isEmpty()) {
			String msg = "수량을 입력해주세요.";
			ModelAndView mav = new ModelAndView("/msg", "msg", msg);
			mav.addObject("link", "proAmount_a.do");
			return mav;
		}
		
		if (!pro_amount_str.matches("\\d+")) { //"\\d+" : 1개 이상의 숫자를 의미
		    String msg = "수량은 숫자만 입력 가능합니다.";
		    ModelAndView mav = new ModelAndView("/msg", "msg", msg);
		    mav.addObject("link", "proAmount_a.do");
		    return mav;
		}
		
		
		int pro_amount_s=Integer.parseInt(pro_amount_str);
		
		ProDTO pdto=proDao.proSelect(pro_idx);
		int pro_amount=pdto.getPro_amount(); //기존 수량
		int pro_state=pdto.getPro_state();  //기존 재고상태
		
		
		if(pro_amount==pro_amount_s){
			String msg = "수량이 동일합니다. 다시 입력해주세요.";
			ModelAndView mav = new ModelAndView("/msg", "msg", msg);
			mav.addObject("link", "proAmount_a.do");
			return mav;
		}else {
			if(pro_amount_s==0 || pro_amount_s==1) {
				dto.setPro_amount(pro_amount_s);
				dto.setPro_state(1);
			}else if(pro_amount_s>1){
				dto.setPro_amount(pro_amount_s);
				dto.setPro_state(0);
			}
		}
		
		int result=proDao.proAmountUpdate(dto);
		
		String msg=result>=0?"재고 수정이 완료되었습니다.":"재고 수정에 실패하였습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage","location.href='proAmount_a.do';");
		mav.setViewName("/mainMsg");
		return mav;
		
	}
	
	
	//상품 재고 관리 - 상태수정
	@RequestMapping("/proStateUpdate.do")
	public ModelAndView proStateUpdate(@RequestParam("pro_idx")int pro_idx,
										ProDTO dto, HttpServletRequest req) {

		String pro_state_s=req.getParameter("pro_state"); //관리자가 선택한 재고상태
		
		ProDTO pdto=proDao.proSelect(pro_idx);
		int pro_amount=pdto.getPro_amount(); //기존 수량
		int pro_state=pdto.getPro_state();  //기존 재고상태
		
		
		if("0".equals(pro_state_s)) {
			if(pro_state==0) {
				String msg = "이미 판매중인 상품입니다.";
		        ModelAndView mav = new ModelAndView("/msg", "msg", msg);
				mav.addObject("link", "proAmount_a.do");
		        return mav;		
			}else {
				dto.setPro_state(0);
			}
		    if(pro_amount == 0 || pro_amount == 1) {
		        String msg = "재고 수량을 수정해주세요.";
		        ModelAndView mav = new ModelAndView("/msg", "msg", msg)
		        		;
				mav.addObject("link", "proAmount_a.do");
		        return mav;				
		    }
		}else if("1".equals(pro_state_s)){
			if(pro_state==1) {
				String msg = "이미 품절중인 상품입니다.";
		        ModelAndView mav = new ModelAndView("/msg", "msg", msg);
				mav.addObject("link", "proAmount_a.do");
		        return mav;	
			}else {
				dto.setPro_state(1);
				dto.setPro_amount(1);
			}
		}

		int result=proDao.proStateUpdate(dto);
		
		String msg=result>=0?"재고상태 수정이 완료되었습니다.":"재고상태 수정에 실패하였습니다.";

		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", "proAmount_a.do");
		mav.setViewName("/msg");
		return mav;
		
	}

	
}