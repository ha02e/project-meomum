package com.mm.controller;

import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDTO;
import com.mm.order.model.OrderDAO;
import com.mm.order.model.OrderDTO;
import com.mm.order.model.OrderProDTO;
import com.mm.order.model.OrderReportDTO;
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

	@RequestMapping(value = "/orderForm.do", method = RequestMethod.GET)
	public ModelAndView order(OrderDTO dto,OrderProDTO dto2) {
		int result = orderDao.orderInsert(dto);
		int result2 = orderDao.order_proInsert(dto2);
		int total=result+result2;
		String msg = total > 0 ? "폼1 저장" : "실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}
	
	@RequestMapping(value = "/orderPro.do", method = RequestMethod.GET)
	public ModelAndView orderPro(OrderProDTO dto) {
		int result =orderDao.order_proInsert(dto);
		String msg = result > 0 ? "폼2 저장" : "실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}

	@RequestMapping("/myOrderList.do")
	public ModelAndView myOrderList(@RequestParam("user_idx")int idx) {
		List<OrderDTO> list = orderDao.myOrderList(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("order/myOrderList");
		return mav;
	}

	/** 마이페이지 주문배송내역 */
	public List<OrderReportDTO> myReportPage(int cp, int ls,int user_idx) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		List<OrderReportDTO> lists = orderDao.myOrderReport(map);
		return lists;
	}

	@RequestMapping("/orderReport.do")
	public ModelAndView myOrderReport(@RequestParam(value = "cp", defaultValue = "1") int cp, 
										HttpSession session) {
		
		MemberDTO mdto=(MemberDTO)session.getAttribute("ssInfo");
		int user_idx=mdto.getUser_idx();
		
		int totalCnt = orderDao.myReportTotalCnt(user_idx);
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("orderReport.do", totalCnt, listSize, pageSize, cp);

		List<OrderReportDTO> lists = myReportPage(cp, pageSize,user_idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("order/orderReport");
		mav.addObject("pageStr", pageStr);

		return mav;
	}
	
	/** 관리자페이지 주문배송내역 */
	public List<OrderReportDTO> reportPage(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<OrderReportDTO> lists = orderDao.orderReport(map);
		return lists;
	}

	@RequestMapping("/orderReport_a.do")
	public ModelAndView orderReport_a(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = orderDao.reportTotalCnt();
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("orderReport_a.do", totalCnt, listSize, pageSize, cp);

		List<OrderReportDTO> lists = reportPage(cp, pageSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("order/orderReport_a");
		mav.addObject("pageStr", pageStr);

		return mav;
	}

	@RequestMapping("/shipForm.do")
	public ModelAndView shippingForm(@RequestParam("order_idx")String order_idx) {
		OrderReportDTO dto=orderDao.orderData(order_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("shipping/shipForm");
		return mav;
	}
	
}
