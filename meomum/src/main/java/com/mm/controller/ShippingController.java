package com.mm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.order.model.OrderDAO;
import com.mm.pro.model.ProDAO;
import com.mm.shipping.model.ShippingDAO;
import com.mm.shipping.model.ShippingDTO;

@Controller
public class ShippingController {
	
	@Autowired
	private ShippingDAO shippingDao;
	
	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	private ProDAO proDao;
	

	@RequestMapping(value="/shipInsert.do", method = RequestMethod.POST)
	public ModelAndView shipInsert(ShippingDTO dto,
									@RequestParam("order_idx") String order_idx,
									@RequestParam("pro_idx") int pro_idx) {
		
		Map map = new HashMap();
		map.put("order_idx", order_idx);
		map.put("pro_idx", pro_idx);
		
		ModelAndView mav = new ModelAndView();
		
		//주문 수량이 상품 재고보다 작을 때만 배송처리 가능
		//상품재고는 proSQL에서 상품 재고 조회하는 쿼리 만들고 가져오기
		int origin_amount=proDao.proAmountSelect(pro_idx);
		int order_amount=orderDao.orderData(map).getPro_amount();
		
		if(order_amount>=origin_amount) {
			
			mav.addObject("msg","상품 재고수량이 부족합니다.\n재고를 확인해주세요.");
			mav.addObject("gopage","location.href='orderReport_a.do';");
			mav.setViewName("/mainMsg");
			
		}else {
			
			int result=shippingDao.shipInsert(dto);
			int amountUpdateOk=proDao.proAmountShipUpdate(map); //배송처리 성공 시 상품 재고수량 수정
			
			if(result>0 && amountUpdateOk>0) {
				int statusUpdateOk=orderDao.shipStartUpdate(map); //배송처리 성공 시 주문테이블 상태 2로 수정
				String msg = statusUpdateOk>0?"배송처리가 완료되었습니다.":"배송처리에 실패하였습니다.";
				mav.addObject("msg",msg);
				mav.setViewName("shipping/shipMsg");
			}else {
				mav.addObject("msg","배송처리에 실패하였습니다.");
				mav.addObject("gopage","location.href='orderReport_a.do';");
				mav.setViewName("/mainMsg");
			}
			
		}
		
		return mav;
	}

	
	
	
}
