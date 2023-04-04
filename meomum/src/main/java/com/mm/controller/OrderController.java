package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.order.model.OrderDAO;
import com.mm.pro.model.ProDTO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDao;
	
	@RequestMapping("/orderList.do")
	public ModelAndView orderList(@RequestParam("pro_idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		ProDTO dto=orderDao.orderList(idx);
		mav.addObject("dto", dto);
		mav.setViewName("order/orderList");
		return mav;
	}
	
}
