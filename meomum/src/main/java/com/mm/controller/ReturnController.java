package com.mm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.order.model.MyOrderListDTO;
import com.mm.order.model.OrderDAO;
import com.mm.order.model.OrderReportDTO;
import com.mm.turnback.model.ReturnDAO;
import com.mm.turnback.model.ReturnDTO;
import com.mm.turnback.model.ReturnListDTO;


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
	
	
	
	@RequestMapping("/returnApply.do")
	public ModelAndView returnApply(ReturnDTO dto,
									@RequestParam("order_idx") String order_idx) {
		int result=returnDao.returnApplyInsert(dto);

		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			int statusUpdate=orderDao.returnApplyUpdate(order_idx);
			String msg=statusUpdate>0?"반납 신청이 완료되었습니다.":"반납 신청에 실패하였습니다.";
			String gopage = statusUpdate>0?"opener.document.location.reload(); self.close()":"location.href='returnForm.do';";
			mav.addObject("dto", dto);
			mav.addObject("msg", msg);
			mav.addObject("gopage", gopage);
			mav.setViewName("/mainMsg");
		}else {
			mav.addObject("msg", "반납 신청에 실패하였습니다.");
			mav.addObject("gopage", "location.href='returnForm.do';");
			mav.setViewName("/mainMsg");
		}
		
		return mav;
	}
	
	
	public List<ReturnListDTO> returnListPage(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReturnListDTO> lists = returnDao.returnProList(map);
		return lists;
	}
	
	@RequestMapping("/returnProList_a.do")
	public ModelAndView returnProList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		
		int totalCnt=returnDao.returnProListCnt();
		int listSize=5;
		int pageSize=5;
			
		String pageStr=com.mm.module.PageModule
				.makePage("returnProList_a.do", totalCnt, listSize, pageSize, cp);
			
		List<ReturnListDTO> lists=returnListPage(cp, pageSize);
			
		ModelAndView mav=new ModelAndView();
		mav.setViewName("turnback/returnProList_a");
		mav.addObject("lists", lists);
		mav.addObject("pageStr",pageStr);
			
		return mav;
			
	}

}
