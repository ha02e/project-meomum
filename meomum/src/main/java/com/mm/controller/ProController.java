package com.mm.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDTO;
import com.mm.pro.model.ProDAO;
import com.mm.pro.model.ProDAOImple;
import com.mm.pro.model.ProDTO;

@Controller
public class ProController {
	
	@Autowired
	private ProDAO proDao;
	
	@Autowired
	private ServletContext servletContext;

	
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
	
	
	//사용자 상품 리스트 출력
	@RequestMapping("/proList.do")
	public ModelAndView itemList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=proDao.itemTotalCnt();
		int listSize=9;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proList.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proItemPage(cp,listSize);
		List<ProDTO> lists2=proDao.proBest();
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pro/proList");
		mav.addObject("lists", lists);
		mav.addObject("lists2", lists2);
		mav.addObject("pageStr", pageStr);
		
		return mav;
	}
	
	
	//파일 저장 실행
	@RequestMapping("/proAdd.do")
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
	        @RequestParam("pro_allprice") int pro_allprice,
	        HttpServletRequest req) {
	    
	    ProDTO dto = new ProDTO();
	    
	    dto.setPro_cate(pro_cate);
	    dto.setPro_name(pro_name);
	    dto.setPro_price(pro_price);
	    dto.setPro_amount(pro_amount);
	    dto.setPro_state(pro_state);
	    dto.setPro_month(pro_month);
	    dto.setPro_subprice(pro_subprice);
	    dto.setPro_allprice(pro_allprice);
	    
	    int num1 = 0;
	    int num2 = 0;
	    int num3 = 0;
	    int num4 = 0;

	    String name1=pro_thumb.getOriginalFilename();
	    String name2=pro_img1.getOriginalFilename();
	    String name3=pro_img2.getOriginalFilename();
	    String name4=pro_content.getOriginalFilename();
	    
	    while(proDao.proFindFile(name1)) {
	    	num1++;
	    	name1 = num1+name1;
	    }
	    
	    while(proDao.proFindFile(name2)) {
	    	num2++;
	    	name2 = num2+name2;
	    }
	    
	    while(proDao.proFindFile(name3)) {
	    	num3++;
	    	name3 = num3+name3;
	    }
	    
	    while(proDao.proFindFile(name4)) {
	    	num4++;
	    	name4 = num4+name4;
	    }
	    
	    dto.setPro_thumb(name1);
	    dto.setPro_img1(name2);
	    dto.setPro_img2(name3);
	    dto.setPro_content(name4);
	   
	    //사진 물리 저장
	    copyInto(pro_thumb, req,name1);
	    copyInto(pro_img1, req,name2);
	    copyInto(pro_img2, req,name3);
	    copyInto(pro_content, req,name4);

	    //정보 저장
	    int result = proDao.proInsert(dto);

	    String msg = result >= 0 ? "등록 성공" : "등록 실패";
	    String link = result > 0 ? "proAdmin.do" : "proForm.do";
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("msg", msg);
	    mav.addObject("link", link);
	    mav.setViewName("pro/proMsg");
	    return mav;        
	}
	
	
	
	//파일 복사?
	public void copyInto(MultipartFile upload, HttpServletRequest req,String fileName) {
	    
	    try {
	        byte bytes[] = upload.getBytes();
	        
	        
	        String rootPath = req.getSession().getServletContext().getRealPath("/");
	        String filePath= rootPath+"/images/items/"+fileName;

	       // String filepath = rootPath+"/items/"+fileName;
	        
	        File outfile = new File(filePath);
	        
	        FileOutputStream fos = new FileOutputStream(outfile);
	        
	        fos.write(bytes);
	        fos.close();
	    } catch(IOException e) {
	        e.printStackTrace();
	    }
	}

	
	
	
	//페이징 모듈 (관리자용)
	public List<ProDTO> proPage(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ProDTO> lists=proDao.proList(map);
		return lists;
	}
	
	
	//페이징 모듈 (사용자용)
	public List<ProDTO> proItemPage(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ProDTO> lists=proDao.proItemList(map);
		return lists;
	}
	
	
	
	//관리자 상품 관리 페이지
	@RequestMapping("/proAdmin.do")
	public ModelAndView proAdminList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			HttpSession session) {
		
		MemberDTO ssInfo = (MemberDTO) session.getAttribute("ssInfo");

		ModelAndView mav=new ModelAndView();
		
		if(ssInfo==null||!ssInfo.getUser_info().equals("관리자")) {
			mav.addObject("msg", "관리자만 이용할 수 있습니다.");
			mav.addObject("link","index.do");
			mav.setViewName("pro/proMsg");
			return mav;
		}
		
		int totalCnt=proDao.getTotalCnt();
		int listSize=10;
		int pageSize=5;
		
		String pageStr=com.mm.module.PageModule.makePage("proAdmin.do", totalCnt, listSize, pageSize, cp);
		
		
		List<ProDTO> lists=proPage(cp,listSize);
		
		mav.setViewName("pro/proAdmin");
		mav.addObject("lists", lists);
		mav.addObject("totalCnt",totalCnt);
		mav.addObject("pageStr", pageStr);
		
		return mav;
		
		
	}
	
	//관리자 상품 삭제
	@RequestMapping(value="/proDel.do", method = RequestMethod.POST)
		public ModelAndView proDel(
				ProDTO dto,
				HttpServletRequest req,
				@RequestParam("pro_idx") int pro_idx) {
		
			int result = proDao.proDelete(pro_idx);
			
			
			String rootPath = req.getSession().getServletContext().getRealPath("/");
			String p = rootPath + "/images/items/" + dto.getPro_thumb();
			String p1 = rootPath + "/images/items/" + dto.getPro_img1();
			String p2 = rootPath + "/images/items/" + dto.getPro_img2();
			String p3 = rootPath + "/images/items/" + dto.getPro_content();
			
			
				File old = new File(p);
				if (old.exists()) {
					old.delete();
				}
		
				File old1 = new File(p1);
				if (old1.exists()) {
					old1.delete();
				}
			
				File old2 = new File(p2);
				if (old2.exists()) {
					old2.delete();
				}
	
				File old3 = new File(p3);
				if (old3.exists()) {
					old3.delete();
				}
			
			String msg=result>=0?"삭제 성공":"삭제 실패";
			String link ="proAdmin.do";
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("link", link);
			mav.setViewName("pro/proMsg");
			return mav;
		}
	
	
	//상품 검색
	@RequestMapping("/proFind.do")
	public ModelAndView proFind(
			@RequestParam(value="proF",required=false)String proF
			,@RequestParam(value="cate",required=false)String cate) {
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
		mav.addObject("proF",proF);
		mav.addObject("cate",cate);
	
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
	
	//사용자 상품 리스트 검색
	@RequestMapping(value="itemFind.do")
	public ModelAndView proItemFind(
			@RequestParam("proF")String proF) {
		ModelAndView mav = new ModelAndView();
		List<ProDTO> lists=proDao.proFind2(proF);
		
		mav.addObject("proF", proF);
		mav.addObject("lists", lists);
		mav.setViewName("pro/proList");
		return mav;
	}
	
	
	/**이용방법리스트*/
	@RequestMapping("howtouse.do")
	public String howToUse() {
		return "pro/how_to_use";
	}

	
}