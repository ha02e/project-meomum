package com.mm.controller;

import javax.servlet.http.HttpSession;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.cart.model.CartDAO;
import com.mm.cart.model.CartDTO;
import com.mm.member.model.MemberDTO;


@Controller
public class CartController {

		@Autowired
		private CartDAO cartDao;
		
		
		//장바구니 추가 및 중복 확인
		@RequestMapping(value="/cartInsert.do")
		public ModelAndView cartInsert(
				@RequestParam("pro_idx") int pro_idx,
				@RequestParam(value="cart_amount",defaultValue="1")int cart_amount,
				HttpSession session) {
			
			
			ModelAndView mav = new ModelAndView();
			session.getAttribute("ssInfo");
			MemberDTO sdto=(MemberDTO) session.getAttribute("ssInfo");
			
			String msg=null;
			String link=null;
			int result=0;
			int user_idx=0;
			int count=0;
			
			if(sdto!=null) {
				
				 user_idx=sdto.getUser_idx();
			        
			        CartDTO dto=new CartDTO();
			        dto.setPro_idx(pro_idx);
			        dto.setCart_amount(cart_amount);
			        dto.setUser_idx(user_idx);
			        
			        count= cartDao.cartCheck(pro_idx);
			        
			        if(count>=1) {
			            msg="이미 장바구니에 있는 물건입니다. 장바구니로 이동하시겠습니까?";
			            link="proCart.do?user_idx="+user_idx;
			            mav.addObject("msg",msg);
			            mav.addObject("link", link);
			            mav.addObject("pro_idx", pro_idx);
			            mav.addObject("confirm", true);
			            mav.setViewName("pro/proMsg");
			        } else {
			        	
			        	result=cartDao.cartInsert(dto);
			            
			            if (result > 0) {
			                msg = "장바구니에 추가되었습니다. 확인하시겠습니까?";
			                link = "proCart.do?user_idx="+user_idx;
			                mav.addObject("msg", msg);
			                mav.addObject("link", link);
			                mav.addObject("pro_idx", pro_idx);
			                mav.addObject("confirm", true); // confirm 속성 추가
			                mav.setViewName("pro/proMsg");
			            } else {
			            	  msg = "등록에 실패했습니다. 고객 센터에 연락 바랍니다.";
			            	  link = "proList.do";
			            	  mav.addObject("msg", msg);
				              mav.addObject("link", link);
				              mav.setViewName("pro/proMsg");
			            }
			        }
			          
			} else {
				msg="로그인 후 이용해 주세요.";
	            mav.addObject("msg", msg);
	            mav.addObject("gopage","location.href='login.do';");
	            mav.setViewName("mainMsg");
			}
			return mav;
		}
		
		
		//장바구니로 이동
		@RequestMapping("/proCart.do")
		public ModelAndView CartList(
				@RequestParam(value="cart_amount",defaultValue="1")int cart_amount,
				HttpSession session) {
			
			ModelAndView mav = new ModelAndView();
			session.getAttribute("ssInfo");
			MemberDTO sdto=(MemberDTO) session.getAttribute("ssInfo");
			
			String msg=null;
			int user_idx=0;
			
			if(sdto!=null) {
			
			user_idx=sdto.getUser_idx();	 
			List<CartDTO> lists=cartDao.cartList(user_idx);
			mav.addObject("lists", lists);
			mav.setViewName("pro/proCart");
			
			} else {
				msg="로그인 후 이용해 주세요.";
	            mav.addObject("msg", msg);
	            mav.addObject("gopage","location.href='login.do';");
	            mav.setViewName("mainMsg");
			}			
			return mav;
		}
		
		//장바구니 삭제
		@RequestMapping(value="cartDelete.do", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView cartDelete(@RequestParam("cart_idx")int cart_idx){
			ModelAndView mav = new ModelAndView();
			cartDao.cartDelete(cart_idx);
			mav.setViewName("mmJson");
			return mav;
		}
		
	
		//장바구니 수량 조절
		@RequestMapping(value="cartNumUpdate.do")
		public ModelAndView cartNumUpdate(@RequestParam("cart_idx")int cart_idx,
				@RequestParam("cart_amount") int cart_amount,
				HttpSession session) {
			
			ModelAndView mav= new ModelAndView();
			
			session.getAttribute("ssInfo");
			MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
			int user_idx =sdto.getUser_idx();
			
			CartDTO dto=new CartDTO();
			dto.setCart_amount(cart_amount);
			dto.setCart_idx(cart_idx);
			System.out.println(cart_amount+"/"+cart_idx+"/"+user_idx);
			int result=cartDao.cartNumUpdate(dto);
			
			String msg=result>=0?"수정 성공":"수정 실패";
	      	String link = "proCart.do?user_idx="+user_idx;
	      	mav.addObject("msg", msg);
	        mav.addObject("link", link);
	        mav.setViewName("pro/proMsg");
	        return mav;
			}
		
	
}
