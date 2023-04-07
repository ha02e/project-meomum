package com.mm.controller;

import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView orderList(@RequestParam("pro_idx") int idx) {

		ModelAndView mav = new ModelAndView();
		ProDTO dto = orderDao.orderList(idx);
		mav.addObject("dto", dto);
		mav.setViewName("order/orderList");
		return mav;
	}

	@RequestMapping(value = "/orderTest.do", method = RequestMethod.GET)
	public ModelAndView orderTest(OrderDTO dto) {
		int result = orderDao.orderInsert(dto);
		String msg = result > 0 ? "성공" : "실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}

	@RequestMapping("/myOrderList.do")
	public ModelAndView myOrderList(@RequestParam("user_idx") Integer idx) {
		List<OrderDTO> list = orderDao.myOrderList(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("order/myOrderList");
		return mav;
	}

	public List<OrderDTO> reportPage(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<OrderDTO> lists = orderDao.orderReport(map);
		return lists;
	}

	@RequestMapping("/orderReport_a.do")
	public ModelAndView orderReport_a(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = orderDao.reportTotalCnt();
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("orderReport_a.do", totalCnt, listSize, pageSize, cp);

		List<OrderDTO> lists = reportPage(cp, pageSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("order/orderReport_a");
		mav.addObject("pageStr", pageStr);

		return mav;
	}

}
