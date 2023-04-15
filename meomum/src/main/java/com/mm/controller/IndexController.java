package com.mm.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDAO;
import com.mm.order.model.OrderDAO;
import com.mm.payment.model.PaymentDAO;
import com.mm.payment.model.PaymentDTO;
import com.mm.point.model.PointDAO;
import com.mm.svc.model.SvcDAO;
import com.mm.svc.model.SvcSelectAllDTO;

@Controller
public class IndexController {
	
	@Autowired
	private SvcDAO svcDao;
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private PointDAO pdao;
	@Autowired
	private PaymentDAO payDao;
	@Autowired
	private OrderDAO odao;
	
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	
//	@RequestMapping("/admin.do")
//	public String admin() {
//		return "admin";
//	}
	
	/**통계:메인보드*/
	@RequestMapping("/admin.do")
	public ModelAndView admin(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		//서비스 인지 경로
		List<Map<String, Object>> list = svcDao.svcKnowData();
		
		//정리일상 구독건수
		int count = svcDao.svcTotalCnt();
		
		//매출 총 금액
		int totalSum = Math.floorDiv(payDao.payTotal(), 10000) * 10000;
		DecimalFormat df = new DecimalFormat("#,###");
		String formattedTotalSum = df.format(totalSum / 10000) + "만원";
		
		//매출 요약
		List<Map<String, Object>> payList = payDao.payOutline();
		
		//전체 회원수
		int memCnt = mdao.memberCnt();
		
		//세부 매출
		int totalCnt = payDao.payCnt();
		int listSize = 5;
		int pageSize = 5;
		String pageStr = com.mm.module.PageModule.makePage("admin.do", totalCnt, listSize, pageSize, cp);
		List<PaymentDTO> payAllList = payDao.payList(cp, listSize);
		ModelAndView mav = new ModelAndView();
		
		//구독일상 건수
		int orderCnt = odao.orderCnt();
		
	    mav.addObject("list", list);
	    mav.addObject("svcCnt", count);
	    mav.addObject("totalSum", formattedTotalSum);
	    mav.addObject("payList", payList);
	    mav.addObject("memCnt", memCnt);
	    
	    mav.addObject("payAllList", payAllList);
	    mav.addObject("pageStr", pageStr);
	    
	    mav.addObject("orderCnt", orderCnt);
	    
		mav.setViewName("admin");
		return mav;
	}
	
	
	
	@RequestMapping("/error")
    public ModelAndView handleError(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        Object status = request.getAttribute("javax.servlet.error.status_code");

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                mav.setViewName("error/error404");
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                mav.setViewName("error/error500");
            }
        }
        return mav;
    }

}
