package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mm.ntc.model.NtcDAO;

@Controller
public class NtcController {

	@Autowired
	private NtcDAO ntcDao;
	
	@RequestMapping(value = "/ntcForm.do", method = RequestMethod.GET )
	public String ntcForm() {
		return "ntc/ntcForm";
	}
}
