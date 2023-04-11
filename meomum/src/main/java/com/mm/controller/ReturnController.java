package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.order.model.OrderDAO;
import com.mm.order.model.OrderReportDTO;
import com.mm.turnback.model.ReturnDAO;


@Controller
public class ReturnController {
	
	@Autowired
	private ReturnDAO returnDao;
	
	@Autowired
	private OrderDAO orderDao;
	
	
	@RequestMapping("/returnForm.do")
	public ModelAndView returnForm(@RequestParam("order_idx") String order_idx) {
		OrderReportDTO dto = orderDao.orderData(order_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("turnback/returnForm");
		return mav;
	}
	
}
