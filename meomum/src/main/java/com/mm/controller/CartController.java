package com.mm.controller;

import javax.servlet.http.HttpSession;
import java.util.List;

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
				
				List<CartDTO> cartList = cartDao.cartCheck(pro_idx);
				
				if(!cartList.isEmpty()) {
					msg="이미 장바구니에 있는 물건입니다. 추가하시겠습니까?";
					
				}
				
				int result=cartDao.cartInsert(dto);
				
				if (result > 0) {
				    msg = "장바구니에 추가되었습니다. 확인하시겠습니까?";
				    link = "proCart.do";
				    mav.addObject("msg", msg);
				    mav.addObject("link", link);
				    mav.addObject("pro_idx", pro_idx);
				    mav.addObject("confirm", true); // confirm 속성 추가
				    mav.setViewName("pro/proMsg");
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
		public String CartList() {
			return "/pro/proCart";
		}
	
}
