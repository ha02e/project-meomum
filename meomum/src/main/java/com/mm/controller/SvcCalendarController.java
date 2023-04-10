package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SvcCalendarController {
	@RequestMapping(value="/svcCalendars.do")
	public String SvcCalendarForm() {
		return "svc/svcCalendar";
	}
}
