package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mm.shipping.model.ShippingDAO;
import com.mm.shipping.model.ShippingDTO;

@Controller
public class ShippingController {
	
	@Autowired
	private ShippingDAO shippingDao;
	

	@RequestMapping(value="/shipInsert.do", method = RequestMethod.POST)
	public ModelAndView shipInsert(ShippingDTO dto) {
		int result=shippingDao.shipInsert(dto);
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"배송처리가 완료되었습니다.":"배송처리에 실패하였습니다.";
		mav.addObject("msg","msg");
		mav.setViewName("shipMsg");
		
		return mav;
	}

	
	
	
}
