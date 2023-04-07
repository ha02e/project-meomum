package com.mm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.order.model.OrderDAO;
import com.mm.order.model.OrderDTO;
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
	
	@RequestMapping(value =  "/orderTest.do", method = RequestMethod.GET)
	public ModelAndView orderTest(OrderDTO dto) {
		int result=orderDao.orderInsert(dto);
		String msg=result>0?"성공":"실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}
	
	@RequestMapping("/myOrderList.do")
	public ModelAndView myOrderList(@RequestParam("user_idx") Integer idx) {
		List<OrderDTO> list=orderDao.myOrderList(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("order/myOrderList");
		return mav;
	}
	
}
