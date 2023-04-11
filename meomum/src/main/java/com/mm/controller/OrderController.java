package com.mm.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.cart.model.CartDAO;
import com.mm.cart.model.CartDTO;
import com.mm.member.model.MemberDTO;
import com.mm.order.model.MyOrderListDTO;
import com.mm.order.model.OrderDAO;
import com.mm.order.model.OrderDTO;
import com.mm.order.model.OrderProDTO;
import com.mm.order.model.OrderReportDTO;
import com.mm.payment.model.PaymentDAO;
import com.mm.payment.model.PaymentDTO;
import com.mm.pro.model.ProDTO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private PaymentDAO payDao;
	@Autowired
	private CartDAO cdao;

	@RequestMapping("/orderList.do")
	public ModelAndView orderList(@RequestParam("pro_idx") int idx, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("ssInfo") == null) {

			mav.addObject("msg", "로그인 후 이용가능합니다");
			mav.addObject("goUrl", "login.do");
			mav.setViewName("ntc/ntcMsg");
		} else {

			ProDTO dto = orderDao.orderList(idx);
			mav.addObject("dto", dto);
			mav.setViewName("order/orderList");
		}

		return mav;
	}

	@RequestMapping("/orderListss.do")
	public ModelAndView orderAllList(@RequestParam("cart_idx") int[] cartIdx, @RequestParam("totalSub") int totalSub,
			@RequestParam("totalCount") int totalCount, @RequestParam("totalDel") int totalDel,
			@RequestParam("finalTotalPrice") int finalTotalPrice) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalSub", totalSub);
		map.put("totalCount", totalCount);
		map.put("totalDel", totalDel);
		map.put("finalTotalPrice", finalTotalPrice);

		List<CartDTO> lists = new ArrayList<CartDTO>();
		for (int i = 0; i < cartIdx.length; i++) {
			lists.add(cdao.orderListCartIDX(cartIdx[i]));

		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("total", map);
		mav.setViewName("order/orderLists");
		return mav;
	}

	@RequestMapping(value = "/orderForm.do", method = RequestMethod.POST)
	public ModelAndView order(OrderDTO dto, OrderProDTO dto2) {
		int result = orderDao.orderInsert(dto);
		int result2 = orderDao.order_proInsert(dto2);
		int total = result + result2;
		String msg = total > 0 ? "폼 저장 성공" : "폼 저장 성공 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}

	@RequestMapping(value = "/orderPay.do")
	public ModelAndView svcPay(@RequestBody PaymentDTO dto) {
		System.out.println(dto);
		int result = payDao.paymentInsert(dto);
		System.out.println("컨트롤러:" + result);
		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "결제가 완료되었습니다" : "다시 시도해주세요";
		String link = result > 0 ? "index.do" : "proList.do";

		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("mmJson");

		return mav;
	}

	@RequestMapping("/orderList.do")
	public ModelAndView orderList(@RequestParam("pro_idx") int idx) {

		ModelAndView mav = new ModelAndView();
		ProDTO dto = orderDao.orderList(idx);
		mav.addObject("dto", dto);
		mav.setViewName("order/orderList");
		return mav;
	}

	@RequestMapping(value = "/orderForm.do", method = RequestMethod.POST)
	public ModelAndView order(OrderDTO dto) {
		int result = orderDao.orderInsert(dto);
		String msg = result > 0 ? "폼 저장 성공" : "폼 저장 성공 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/meomum/index.do");
		mav.setViewName("ntc/ntcMsg");
		return mav;
	}

	@RequestMapping(value = "/orderPay.do")
	public ModelAndView svcPay(@RequestBody PaymentDTO dto, @RequestBody OrderProDTO dto2) {
		System.out.println(dto);
		int result = payDao.paymentInsert(dto);
		int result2 = orderDao.order_proInsert(dto2);
		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "결제가 완료되었습니다" : "다시 시도해주세요";
		String link = result > 0 ? "index.do" : "proList.do";

		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("mmJson");

		return mav;
	}

	/** 마이페이지 구독중인 상품 */
	public List<MyOrderListDTO> mySubsProPage(int cp, int ls, int user_idx) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);

		List<MyOrderListDTO> lists = orderDao.myOrderList(map);
		return lists;
	}

	@RequestMapping("/subsProList.do")
	public ModelAndView mysubsProList(@RequestParam(value = "cp", defaultValue = "1") int cp,
										HttpSession session) {

		MemberDTO mdto=(MemberDTO)session.getAttribute("ssInfo");
		int user_idx=mdto.getUser_idx();
		
		int totalCnt = orderDao.mySubsProTotalCnt(user_idx);
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("subsProList.do", totalCnt, listSize, pageSize, cp);

		List<MyOrderListDTO> lists = mySubsProPage(cp, pageSize, user_idx);

		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.setViewName("order/subsProList");
		mav.addObject("pageStr", pageStr);
		return mav;
		
	}

	/** 마이페이지 주문배송내역 */
	public List<OrderReportDTO> myReportPage(int cp, int ls, int user_idx) {
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
	public ModelAndView myOrderReport(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpSession session) {

		MemberDTO mdto = (MemberDTO) session.getAttribute("ssInfo");
		int user_idx = mdto.getUser_idx();

		int totalCnt = orderDao.myReportTotalCnt(user_idx);
		int listSize = 5;
		int pageSize = 5;

		String pageStr = com.mm.module.PageModule.makePage("orderReport.do", totalCnt, listSize, pageSize, cp);

		List<OrderReportDTO> lists = myReportPage(cp, pageSize, user_idx);

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

	/** 관리자페이지 배송처리 폼 */
	@RequestMapping("/shipForm.do")
	public ModelAndView shippingForm(@RequestParam("order_idx") String order_idx) {
		OrderReportDTO dto = orderDao.orderData(order_idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("shipping/shipForm");
		return mav;
	}

	/** 관리자페이지 주문상세내역 */
	@RequestMapping("/orderInfoDetail.do")
	public ModelAndView orderInfoDetail(@RequestParam("order_idx") String order_idx) {
		OrderReportDTO dto = orderDao.orderData(order_idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("order/orderInfoDetail");
		return mav;
	}

}
