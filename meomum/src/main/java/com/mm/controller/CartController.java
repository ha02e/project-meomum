package com.mm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.cart.model.CartDAO;
import com.mm.cart.model.CartDTO;
import com.mm.member.model.MemberDTO;

@Controller
public class CartController {

		@Autowired
		private CartDAO cartDao;
	
		//사용자 카트 추가
		@RequestMapping("/cartInsert.do")
		public ModelAndView cartInsert(
				@RequestParam("pro_idx") int pro_idx,
				@RequestParam(value="cart_amount",defaultValue="1")int cart_amount,
				HttpSession session) {
			
			ModelAndView mav=new ModelAndView();
			session.getAttribute("ssInfo");
			MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
			
			String msg=null;
			String link=null;
			
			int user_idx=0;
			if(sdto!=null) {
				user_idx=sdto.getUser_idx();
				
				CartDTO dto=new CartDTO();
				dto.setPro_idx(pro_idx);
				dto.setCart_amount(cart_amount);
				dto.setUser_idx(user_idx);
				
				int result=cartDao.cartInsert(dto);
				msg=result>=0?"장바구니에 추가되었습니다. 확인하시겠습니까?":"장바구니에 추가하지 못했습니다.";
				link="pro/proCart";
				mav.addObject("msg", msg);
				mav.addObject("link", link);
				mav.setViewName("pro/proMsg");
				
			} else {
				msg="로그인 후 이용해 주세요.";
				mav.addObject("msg", msg);
				mav.setViewName("pro/proMsg");
				mav.addObject("gopage","location.href='login.do';");
				mav.setViewName("mainMsg");
			}
			return mav;
			
		}
	
}
